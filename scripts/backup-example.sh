#!/usr/bin/env bash
set -euo pipefail

# Ejemplo operativo de backup para proyectos pequeños.
# No sustituye una estrategia profesional, pero es mucho más útil que una plantilla vacía.
# Qué hace:
# 1) crea carpeta de backup con timestamp
# 2) guarda manifiesto básico
# 3) intenta exportar .env si existe
# 4) intenta dump PostgreSQL si hay config y pg_dump disponible
# 5) comprime archivos del proyecto sin basura típica
# 6) deja un resumen final

DATE="$(date +%F-%H%M%S)"
APP_ROOT="${APP_ROOT:-$(pwd)}"
BACKUP_ROOT="${BACKUP_ROOT:-$APP_ROOT/backups}"
BACKUP_NAME="backup-$DATE"
BACKUP_DIR="$BACKUP_ROOT/$BACKUP_NAME"
FILES_ARCHIVE="$BACKUP_DIR/app-files-$DATE.tar.gz"
MANIFEST="$BACKUP_DIR/manifest.txt"

mkdir -p "$BACKUP_DIR"

info() { echo "[info] $*"; }
warn() { echo "[warn] $*"; }
fail() { echo "[error] $*"; exit 1; }

command -v tar >/dev/null 2>&1 || fail "tar no está disponible"

info "APP_ROOT=$APP_ROOT"
info "BACKUP_DIR=$BACKUP_DIR"

{
  echo "backup_name=$BACKUP_NAME"
  echo "created_at=$(date --iso-8601=seconds)"
  echo "app_root=$APP_ROOT"
  echo "hostname=$(hostname 2>/dev/null || echo unknown)"
  echo "git_commit=$(git -C "$APP_ROOT" rev-parse --short HEAD 2>/dev/null || echo no-git)"
} > "$MANIFEST"

# Guardar .env si existe
if [ -f "$APP_ROOT/.env" ]; then
  cp "$APP_ROOT/.env" "$BACKUP_DIR/.env.backup"
  info "Copia de .env guardada en $BACKUP_DIR/.env.backup"
else
  warn "No existe $APP_ROOT/.env"
fi

# Export PostgreSQL si hay configuración suficiente
DB_DUMP_DONE=false
if command -v pg_dump >/dev/null 2>&1; then
  if [ -n "${DATABASE_URL:-}" ]; then
    info "Generando dump PostgreSQL desde DATABASE_URL"
    if pg_dump "$DATABASE_URL" > "$BACKUP_DIR/postgres-$DATE.sql"; then
      DB_DUMP_DONE=true
      info "Dump PostgreSQL guardado en $BACKUP_DIR/postgres-$DATE.sql"
    else
      warn "pg_dump con DATABASE_URL falló"
      rm -f "$BACKUP_DIR/postgres-$DATE.sql"
    fi
  elif [ -n "${PGHOST:-}" ] && [ -n "${PGDATABASE:-}" ] && [ -n "${PGUSER:-}" ]; then
    info "Generando dump PostgreSQL usando variables PG*"
    if pg_dump > "$BACKUP_DIR/postgres-$DATE.sql"; then
      DB_DUMP_DONE=true
      info "Dump PostgreSQL guardado en $BACKUP_DIR/postgres-$DATE.sql"
    else
      warn "pg_dump con variables PG* falló"
      rm -f "$BACKUP_DIR/postgres-$DATE.sql"
    fi
  else
    warn "No hay DATABASE_URL ni variables PG* suficientes para dump"
  fi
else
  warn "pg_dump no está instalado; se omite backup de PostgreSQL"
fi

echo "database_dump=$DB_DUMP_DONE" >> "$MANIFEST"

# Comprimir archivos del proyecto
info "Comprimiendo archivos del proyecto"
tar -czf "$FILES_ARCHIVE" \
  -C "$APP_ROOT" . \
  --exclude='./.git' \
  --exclude='./node_modules' \
  --exclude='./.next' \
  --exclude='./dist' \
  --exclude='./build' \
  --exclude='./coverage' \
  --exclude='./backups' \
  --exclude='./.venv' \
  --exclude='./venv' \
  --exclude='./__pycache__'

info "Archivo comprimido generado: $FILES_ARCHIVE"

# Añadir tamaños al manifiesto
{
  echo "files_archive=$FILES_ARCHIVE"
  echo "files_archive_size=$(du -h "$FILES_ARCHIVE" | cut -f1)"
  if [ -f "$BACKUP_DIR/postgres-$DATE.sql" ]; then
    echo "postgres_dump=$BACKUP_DIR/postgres-$DATE.sql"
    echo "postgres_dump_size=$(du -h "$BACKUP_DIR/postgres-$DATE.sql" | cut -f1)"
  fi
} >> "$MANIFEST"

info "Backup completado"
echo
cat <<EOF
Resumen:
- carpeta: $BACKUP_DIR
- manifiesto: $MANIFEST
- archivos: $FILES_ARCHIVE
- dump DB: $DB_DUMP_DONE

Siguiente paso recomendado:
1. mover esta copia fuera del servidor principal
2. anotar dónde quedó guardada
3. probar restauración en entorno aparte
EOF
