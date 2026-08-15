#!/usr/bin/env bash
set -euo pipefail

# Backup operativo para proyectos pequeños.
# - Archivos del proyecto (sin secretos comunes ni dependencias)
# - Dump PostgreSQL opcional
# - Manifiesto y checksums SHA-256
#
# Uso:
#   APP_ROOT=/ruta/proyecto BACKUP_ROOT=/ruta/externa ./scripts/backup-example.sh
#
# Opcional:
#   DATABASE_URL=postgresql://...   # activa pg_dump si está instalado
#   BACKUP_ENV=true                # copia .env bajo responsabilidad del usuario
#   ALLOW_PARTIAL_BACKUP=true      # permite continuar si falla el dump solicitado

DATE="$(date +%F-%H%M%S)"
RAW_APP_ROOT="${APP_ROOT:-$(pwd)}"
RAW_BACKUP_ROOT="${BACKUP_ROOT:-$RAW_APP_ROOT/backups}"
BACKUP_ENV="${BACKUP_ENV:-false}"
ALLOW_PARTIAL_BACKUP="${ALLOW_PARTIAL_BACKUP:-false}"
BACKUP_NAME="backup-$DATE"

info() { printf '[info] %s\n' "$*"; }
warn() { printf '[warn] %s\n' "$*" >&2; }
fail() { printf '[error] %s\n' "$*" >&2; exit 1; }

command -v tar >/dev/null 2>&1 || fail "tar no está disponible"
command -v sha256sum >/dev/null 2>&1 || fail "sha256sum no está disponible"
command -v realpath >/dev/null 2>&1 || fail "realpath no está disponible"

APP_ROOT="$(realpath -m "$RAW_APP_ROOT")"
BACKUP_ROOT="$(realpath -m "$RAW_BACKUP_ROOT")"
BACKUP_DIR="$BACKUP_ROOT/$BACKUP_NAME"
FILES_ARCHIVE="$BACKUP_DIR/app-files-$DATE.tar.gz"
TEMP_ARCHIVE="$BACKUP_DIR/.app-files-$DATE.tar.gz.tmp"
DB_DUMP="$BACKUP_DIR/postgres-$DATE.dump"
MANIFEST="$BACKUP_DIR/manifest.txt"
CHECKSUMS="$BACKUP_DIR/SHA256SUMS"
BACKUP_STATUS="completo"
trap 'rm -f "$TEMP_ARCHIVE"' EXIT

[ -d "$APP_ROOT" ] || fail "APP_ROOT no existe: $APP_ROOT"

if [ "$BACKUP_ROOT" = "$APP_ROOT" ]; then
  fail "BACKUP_ROOT no puede ser la raíz del proyecto; usa $APP_ROOT/backups o una ruta externa"
fi
if [[ "$BACKUP_ROOT" == "$APP_ROOT"/* ]] && [ "$BACKUP_ROOT" != "$APP_ROOT/backups" ]; then
  fail "BACKUP_ROOT dentro del proyecto debe ser $APP_ROOT/backups o una ruta externa"
fi

mkdir -p "$BACKUP_ROOT"
mkdir "$BACKUP_DIR" || fail "Ya existe un backup con el mismo timestamp: $BACKUP_DIR"
chmod 700 "$BACKUP_DIR"

info "Proyecto: $APP_ROOT"
info "Destino: $BACKUP_DIR"

{
  echo "backup_name=$BACKUP_NAME"
  echo "created_at=$(date --iso-8601=seconds)"
  echo "app_root=$APP_ROOT"
  echo "hostname=$(hostname 2>/dev/null || echo unknown)"
  echo "git_commit=$(git -C "$APP_ROOT" rev-parse HEAD 2>/dev/null || echo no-git)"
  echo "environment_file_included=false"
  echo "database_dump=false"
  echo "backup_status=pending"
} > "$MANIFEST"

# .env se excluye siempre del archivo general. Solo se copia con opt-in explícito.
if [ "$BACKUP_ENV" = "true" ] && [ -f "$APP_ROOT/.env" ]; then
  cp "$APP_ROOT/.env" "$BACKUP_DIR/.env.backup"
  chmod 600 "$BACKUP_DIR/.env.backup"
  sed -i 's/environment_file_included=false/environment_file_included=true/' "$MANIFEST"
  warn "Se ha incluido .env por petición explícita. Protege y mueve esta copia."
fi

# Dump PostgreSQL en formato custom, más adecuado para restaurar con pg_restore.
DB_REQUESTED=false
if [ -n "${DATABASE_URL:-}" ] || { [ -n "${PGHOST:-}" ] && [ -n "${PGDATABASE:-}" ] && [ -n "${PGUSER:-}" ]; }; then
  DB_REQUESTED=true
fi

if [ "$DB_REQUESTED" = "true" ]; then
  if ! command -v pg_dump >/dev/null 2>&1; then
    if [ "$ALLOW_PARTIAL_BACKUP" = "true" ]; then
      BACKUP_STATUS="parcial"
      warn "Se solicitó PostgreSQL, pero pg_dump no está instalado. Backup parcial autorizado."
    else
      fail "Se solicitó PostgreSQL, pero pg_dump no está instalado. Usa ALLOW_PARTIAL_BACKUP=true solo si aceptas un backup incompleto."
    fi
  elif [ -n "${DATABASE_URL:-}" ]; then
    info "Generando dump PostgreSQL"
    if PGDATABASE="$DATABASE_URL" pg_dump --format=custom --file="$DB_DUMP"; then
      chmod 600 "$DB_DUMP"
      sed -i 's/database_dump=false/database_dump=true/' "$MANIFEST"
      info "Dump generado: $DB_DUMP"
    elif [ "$ALLOW_PARTIAL_BACKUP" = "true" ]; then
      rm -f "$DB_DUMP"
      BACKUP_STATUS="parcial"
      warn "pg_dump falló. Backup parcial autorizado."
    else
      rm -f "$DB_DUMP"
      fail "pg_dump falló; no se declarará completo un backup sin la base de datos solicitada"
    fi
  else
    info "Generando dump PostgreSQL con variables PG*"
    if pg_dump --format=custom --file="$DB_DUMP"; then
      chmod 600 "$DB_DUMP"
      sed -i 's/database_dump=false/database_dump=true/' "$MANIFEST"
    elif [ "$ALLOW_PARTIAL_BACKUP" = "true" ]; then
      rm -f "$DB_DUMP"
      BACKUP_STATUS="parcial"
      warn "pg_dump falló. Backup parcial autorizado."
    else
      rm -f "$DB_DUMP"
      fail "pg_dump falló; no se declarará completo un backup sin la base de datos solicitada"
    fi
  fi
else
  warn "No se solicitó backup PostgreSQL"
fi

info "Comprimiendo archivos sin secretos comunes, dependencias ni artefactos"
tar \
  --exclude='./.git' \
  --exclude='./.env' \
  --exclude='./.env.*' \
  --exclude='./.envrc' \
  --exclude='./.npmrc' \
  --exclude='./.pypirc' \
  --exclude='./.netrc' \
  --exclude='*.pem' \
  --exclude='*.key' \
  --exclude='./node_modules' \
  --exclude='./.next' \
  --exclude='./dist' \
  --exclude='./build' \
  --exclude='./coverage' \
  --exclude='./backups' \
  --exclude='./.venv' \
  --exclude='./venv' \
  --exclude='./__pycache__' \
  -czf "$TEMP_ARCHIVE" \
  -C "$APP_ROOT" .
chmod 600 "$TEMP_ARCHIVE"
mv "$TEMP_ARCHIVE" "$FILES_ARCHIVE"

(
  cd "$BACKUP_DIR"
  sha256sum "$(basename "$FILES_ARCHIVE")" > "$CHECKSUMS"
  [ ! -f "$(basename "$DB_DUMP")" ] || sha256sum "$(basename "$DB_DUMP")" >> "$CHECKSUMS"
  [ ! -f .env.backup ] || sha256sum .env.backup >> "$CHECKSUMS"
)

{
  echo "files_archive=$(basename "$FILES_ARCHIVE")"
  echo "files_archive_size=$(du -h "$FILES_ARCHIVE" | cut -f1)"
  echo "checksums=$(basename "$CHECKSUMS")"
} >> "$MANIFEST"
sed -i "s/backup_status=pending/backup_status=$BACKUP_STATUS/" "$MANIFEST"

cat <<EOF

Backup $BACKUP_STATUS:
- carpeta: $BACKUP_DIR
- manifiesto: $MANIFEST
- checksums: $CHECKSUMS

Siguiente paso obligatorio:
1. ejecuta scripts/verify-backup-example.sh "$BACKUP_DIR"
2. mueve la copia fuera del servidor principal
3. prueba una restauración en un entorno aparte
EOF
