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
if APP_ROOT="$APP" BACKUP_ROOT="$APP" "$ROOT/scripts/backup-example.sh" >/dev/null 2>&1; then
  echo "[error] El backup aceptó la raíz del proyecto como destino" >&2
  exit 1
fi
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
mkdir -p "$APP/backups"
cp -a "$BACKUP_DIR" "$APP/backups/"
git -C "$APP" init -q
git -C "$APP" config user.email test@example.invalid
git -C "$APP" config user.name "CI Test"
git -C "$APP" add .
git -C "$APP" commit -qm "test fixture"
APP_ROOT="$APP" "$ROOT/scripts/predeploy-check-example.sh" >/dev/null

printf '[test] Predeploy rechaza un directorio de backup vacío\n'
EMPTY_BACKUP="$APP/backups/backup-zz-empty"
mkdir -p "$EMPTY_BACKUP"
if APP_ROOT="$APP" "$ROOT/scripts/predeploy-check-example.sh" >/dev/null 2>&1; then
  echo "[error] El predeploy aceptó un backup vacío" >&2
  exit 1
fi
rmdir "$EMPTY_BACKUP"

printf '[test] Predeploy exige que el archivo principal figure en SHA256SUMS\n'
UNBOUND_BACKUP="$APP/backups/backup-zz-unbound"
cp -a "$BACKUP_DIR" "$UNBOUND_BACKUP"
(cd "$UNBOUND_BACKUP" && sha256sum manifest.txt > SHA256SUMS)
if APP_ROOT="$APP" "$ROOT/scripts/predeploy-check-example.sh" >/dev/null 2>&1; then
  echo "[error] El predeploy aceptó un archivo principal no ligado a SHA256SUMS" >&2
  exit 1
fi
if "$ROOT/scripts/verify-backup-example.sh" "$UNBOUND_BACKUP" >/dev/null 2>&1; then
  echo "[error] El verificador aceptó un archivo principal no ligado a SHA256SUMS" >&2
  exit 1
fi
rm -r "$UNBOUND_BACKUP"

printf '[test] Predeploy bloquea secreto versionado sin revelar su valor\n'
printf 'PASSWORD=supersecretpassword\n' > "$APP/config.txt"
git -C "$APP" add config.txt
git -C "$APP" commit -qm "unsafe fixture"
PREDEPLOY_OUTPUT="$TEMP_ROOT/predeploy-secret.log"
if APP_ROOT="$APP" "$ROOT/scripts/predeploy-check-example.sh" >"$PREDEPLOY_OUTPUT" 2>&1; then
  echo "[error] El predeploy no bloqueó un secreto versionado" >&2
  exit 1
fi
if grep -q 'supersecretpassword' "$PREDEPLOY_OUTPUT"; then
  echo "[error] El predeploy reveló el valor del secreto" >&2
  exit 1
fi
grep -q 'config.txt:1' "$PREDEPLOY_OUTPUT"

printf '[test] El backup falla si el dump solicitado falla\n'
FAKE_BIN="$TEMP_ROOT/fake-bin"
FAILED_DB_BACKUPS="$TEMP_ROOT/failed-db"
mkdir -p "$FAKE_BIN" "$FAILED_DB_BACKUPS"
printf '#!/usr/bin/env bash\nexit 1\n' > "$FAKE_BIN/pg_dump"
chmod +x "$FAKE_BIN/pg_dump"
if PATH="$FAKE_BIN:$PATH" DATABASE_URL='postgresql://invalid.example/db' APP_ROOT="$APP" BACKUP_ROOT="$FAILED_DB_BACKUPS" "$ROOT/scripts/backup-example.sh" >/dev/null 2>&1; then
  echo "[error] El backup declaró éxito pese al fallo de pg_dump" >&2
  exit 1
fi

printf '[test] El backup parcial requiere autorización y queda marcado\n'
PARTIAL_DB_BACKUPS="$TEMP_ROOT/partial-db"
mkdir -p "$PARTIAL_DB_BACKUPS"
PATH="$FAKE_BIN:$PATH" DATABASE_URL='postgresql://invalid.example/db' ALLOW_PARTIAL_BACKUP=true APP_ROOT="$APP" BACKUP_ROOT="$PARTIAL_DB_BACKUPS" "$ROOT/scripts/backup-example.sh" >/dev/null 2>&1
PARTIAL_DIR="$(find "$PARTIAL_DB_BACKUPS" -mindepth 1 -maxdepth 1 -type d -print -quit)"
grep -q '^backup_status=parcial$' "$PARTIAL_DIR/manifest.txt"
grep -q '^database_dump=false$' "$PARTIAL_DIR/manifest.txt"

printf '[test] Inclusión explícita de .env\n'
ENV_BACKUPS="$TEMP_ROOT/env-offsite"
mkdir -p "$ENV_BACKUPS"
APP_ROOT="$APP" BACKUP_ROOT="$ENV_BACKUPS" BACKUP_ENV=true "$ROOT/scripts/backup-example.sh" >/dev/null
ENV_BACKUP_DIR="$(find "$ENV_BACKUPS" -mindepth 1 -maxdepth 1 -type d -print -quit)"
[ -f "$ENV_BACKUP_DIR/.env.backup" ]
[ "$(stat -c '%a' "$ENV_BACKUP_DIR/.env.backup")" = "600" ]

printf '[ok] Pruebas funcionales de scripts superadas\n'
