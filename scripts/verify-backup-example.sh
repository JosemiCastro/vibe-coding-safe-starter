#!/usr/bin/env bash
set -euo pipefail

# Verifica estructura, checksums y legibilidad de un backup.
# No restaura producción. Extrae archivos en un temporal aislado.
#
# Uso:
#   ./scripts/verify-backup-example.sh /ruta/al/backup-AAAA-MM-DD-HHMMSS

BACKUP_DIR="${1:-}"
[ -n "$BACKUP_DIR" ] || { echo "Uso: $0 /ruta/al/backup" >&2; exit 2; }
[ -d "$BACKUP_DIR" ] || { echo "[error] No existe: $BACKUP_DIR" >&2; exit 1; }

MANIFEST="$BACKUP_DIR/manifest.txt"
CHECKSUMS="$BACKUP_DIR/SHA256SUMS"
ARCHIVE="$(find "$BACKUP_DIR" -maxdepth 1 -name 'app-files-*.tar.gz' -print -quit)"
TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_DIR"' EXIT

[ -f "$MANIFEST" ] || { echo "[error] Falta manifest.txt" >&2; exit 1; }
[ -f "$CHECKSUMS" ] || { echo "[error] Falta SHA256SUMS" >&2; exit 1; }
[ -n "$ARCHIVE" ] || { echo "[error] Falta archivo app-files-*.tar.gz" >&2; exit 1; }
if ! awk '{print $2}' "$CHECKSUMS" | grep -Fxq "$(basename "$ARCHIVE")"; then
  echo "[error] El archivo principal no figura en SHA256SUMS" >&2
  exit 1
fi

printf '[info] Verificando checksums\n'
(cd "$BACKUP_DIR" && sha256sum --check SHA256SUMS)

printf '[info] Probando lectura del archivo comprimido\n'
tar -tzf "$ARCHIVE" >/dev/null

printf '[info] Extrayendo en temporal aislado\n'
tar -xzf "$ARCHIVE" -C "$TEMP_DIR"

if [ -f "$BACKUP_DIR/.env.backup" ]; then
  MODE="$(stat -c '%a' "$BACKUP_DIR/.env.backup")"
  [ "$MODE" = "600" ] || echo "[warn] .env.backup debería tener permisos 600; tiene $MODE" >&2
fi

DB_DUMP="$(find "$BACKUP_DIR" -maxdepth 1 -name 'postgres-*.dump' -print -quit)"
if [ -n "$DB_DUMP" ]; then
  if command -v pg_restore >/dev/null 2>&1; then
    printf '[info] Verificando índice del dump PostgreSQL\n'
    pg_restore --list "$DB_DUMP" >/dev/null
  else
    echo "[warn] pg_restore no está disponible; no se valida el dump PostgreSQL" >&2
  fi
fi

printf '[ok] Backup legible y checksums válidos\n'
printf '[info] Aún debes probar una restauración completa en un entorno aparte\n'
