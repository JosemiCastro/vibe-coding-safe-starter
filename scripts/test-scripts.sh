#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMP_ROOT="$(mktemp -d)"
trap 'rm -rf "$TEMP_ROOT"' EXIT

APP="$TEMP_ROOT/app"
BACKUPS="$TEMP_ROOT/offsite"
mkdir -p "$APP" "$BACKUPS"
printf 'contenido seguro\n' > "$APP/app.txt"
printf 'TOKEN=no-debe-archivarse\n' > "$APP/.env"
printf '//registry.example/:_authToken=no-debe-archivarse\n' > "$APP/.npmrc"

printf '[test] Crear backup\n'
APP_ROOT="$APP" BACKUP_ROOT="$BACKUPS" "$ROOT/scripts/backup-example.sh" >/dev/null
BACKUP_DIR="$(find "$BACKUPS" -mindepth 1 -maxdepth 1 -type d -print -quit)"
[ -n "$BACKUP_DIR" ]

printf '[test] Verificar backup\n'
"$ROOT/scripts/verify-backup-example.sh" "$BACKUP_DIR" >/dev/null

ARCHIVE="$(find "$BACKUP_DIR" -name 'app-files-*.tar.gz' -print -quit)"
tar -tzf "$ARCHIVE" | grep -q '^\./app.txt$'
if tar -tzf "$ARCHIVE" | grep -Eq '^\./(\.env|\.npmrc)$'; then
  echo "[error] Un archivo sensible apareció en el backup" >&2
  exit 1
fi

printf '[test] Predeploy limpio\n'
cp "$ROOT/.gitignore" "$APP/.gitignore"
cp "$ROOT/templates/CHANGELOG.md" "$APP/CHANGELOG.md"
mkdir -p "$APP/backups/backup-now"
git -C "$APP" init -q
git -C "$APP" config user.email test@example.invalid
git -C "$APP" config user.name "CI Test"
git -C "$APP" add .
git -C "$APP" commit -qm "test fixture"
APP_ROOT="$APP" "$ROOT/scripts/predeploy-check-example.sh" >/dev/null

printf '[test] Predeploy bloquea secreto versionado\n'
printf 'PASSWORD=supersecretpassword\n' > "$APP/config.txt"
git -C "$APP" add config.txt
git -C "$APP" commit -qm "unsafe fixture"
if APP_ROOT="$APP" "$ROOT/scripts/predeploy-check-example.sh" >/dev/null 2>&1; then
  echo "[error] El predeploy no bloqueó un secreto versionado" >&2
  exit 1
fi

printf '[test] Inclusión explícita de .env\n'
ENV_BACKUPS="$TEMP_ROOT/env-offsite"
mkdir -p "$ENV_BACKUPS"
APP_ROOT="$APP" BACKUP_ROOT="$ENV_BACKUPS" BACKUP_ENV=true "$ROOT/scripts/backup-example.sh" >/dev/null
ENV_BACKUP_DIR="$(find "$ENV_BACKUPS" -mindepth 1 -maxdepth 1 -type d -print -quit)"
[ -f "$ENV_BACKUP_DIR/.env.backup" ]
[ "$(stat -c '%a' "$ENV_BACKUP_DIR/.env.backup")" = "600" ]

printf '[ok] Pruebas funcionales de scripts superadas\n'
