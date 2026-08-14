#!/usr/bin/env bash
set -euo pipefail

# Ejemplo mínimo. Adaptar a tu proyecto.
# Nunca asumas que esto sustituye una estrategia real.

DATE=$(date +%F-%H%M%S)
BACKUP_DIR="${BACKUP_DIR:-./backups}"
mkdir -p "$BACKUP_DIR"

if [ -n "${DATABASE_URL:-}" ]; then
  echo "[info] Aquí lanzarías pg_dump contra DATABASE_URL"
  echo "DATABASE_URL configurada, pero este script es solo plantilla."
else
  echo "[warn] DATABASE_URL no está definida"
fi

tar -czf "$BACKUP_DIR/app-files-$DATE.tar.gz" . \
  --exclude='./node_modules' \
  --exclude='./.git' \
  --exclude='./backups'

echo "Backup de archivos generado en $BACKUP_DIR/app-files-$DATE.tar.gz"
