#!/usr/bin/env bash
set -euo pipefail

# Chequeo local, no destructivo y sin dependencias externas.
# Devuelve 1 si hay bloqueos y 0 si supera las comprobaciones básicas.

APP_ROOT="${APP_ROOT:-$(pwd)}"
BACKUP_MAX_AGE_HOURS="${BACKUP_MAX_AGE_HOURS:-24}"
FAILURES=0
WARNINGS=0

ok() { printf '[ok] %s\n' "$*"; }
warn() { printf '[warn] %s\n' "$*"; WARNINGS=$((WARNINGS + 1)); }
block() { printf '[block] %s\n' "$*"; FAILURES=$((FAILURES + 1)); }

[ -d "$APP_ROOT" ] || { echo "[block] APP_ROOT no existe: $APP_ROOT"; exit 1; }
printf '[info] Proyecto: %s\n' "$APP_ROOT"

if git -C "$APP_ROOT" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if [ -n "$(git -C "$APP_ROOT" status --short)" ]; then
    block "Hay cambios sin commit"
  else
    ok "Working tree limpio"
  fi
else
  block "No parece un repositorio git"
fi

[ -f "$APP_ROOT/.gitignore" ] && ok ".gitignore presente" || block "Falta .gitignore"

if git -C "$APP_ROOT" ls-files --error-unmatch .env >/dev/null 2>&1; then
  block ".env está versionado"
elif [ -f "$APP_ROOT/.env" ]; then
  ok ".env local presente y no versionado"
else
  warn "No existe .env local; puede ser normal en un repo guía"
fi

# Escanea solo archivos versionados para reducir falsos positivos.
SECRET_REGEX='(OPENAI_API_KEY|GEMINI_API_KEY|ANTHROPIC_API_KEY|CLAUDE_API_KEY|DATABASE_URL|PASSWORD|SECRET|TOKEN)[[:space:]]*=[[:space:]]*[^[:space:]$<{][^[:space:]]{7,}'
SECRET_HITS="$(git -C "$APP_ROOT" grep -nEI "$SECRET_REGEX" -- ':!*.md' ':!*.example' ':!scripts/predeploy-check-example.sh' 2>/dev/null || true)"
if [ -n "$SECRET_HITS" ]; then
  block "Posibles secretos hardcodeados en archivos versionados (contenido redactado):"
  printf '%s\n' "$SECRET_HITS" | cut -d: -f1,2 | sort -u
else
  ok "Sin patrones obvios de secretos en archivos versionados"
fi

if [ -f "$APP_ROOT/CHANGELOG.md" ]; then
  ok "Changelog del proyecto disponible"
elif [ -f "$APP_ROOT/templates/CHANGELOG.md" ]; then
  warn "Solo existe la plantilla de changelog; crea CHANGELOG.md en la raíz"
else
  warn "No hay changelog"
fi

LATEST_BACKUP="$(find "$APP_ROOT/backups" -mindepth 1 -maxdepth 1 -type d -name 'backup-*' -printf '%T@ %p\n' 2>/dev/null | sort -nr | cut -d' ' -f2- | head -1 || true)"
if [ -n "$LATEST_BACKUP" ]; then
  AGE_HOURS=$(( ( $(date +%s) - $(stat -c %Y "$LATEST_BACKUP") ) / 3600 ))
  BACKUP_ARCHIVE="$(find "$LATEST_BACKUP" -maxdepth 1 -name 'app-files-*.tar.gz' -print -quit)"

  if [ "$AGE_HOURS" -gt "$BACKUP_MAX_AGE_HOURS" ]; then
    block "Último backup demasiado antiguo: ${AGE_HOURS}h"
  elif [ ! -f "$LATEST_BACKUP/manifest.txt" ] || [ ! -f "$LATEST_BACKUP/SHA256SUMS" ] || [ -z "$BACKUP_ARCHIVE" ]; then
    block "El backup reciente está incompleto: faltan manifiesto, checksums o archivo"
  elif ! awk '{print $2}' "$LATEST_BACKUP/SHA256SUMS" | grep -Fxq "$(basename "$BACKUP_ARCHIVE")"; then
    block "El archivo principal no figura en SHA256SUMS"
  elif ! command -v sha256sum >/dev/null 2>&1 || ! (cd "$LATEST_BACKUP" && sha256sum --check --status SHA256SUMS); then
    block "El backup reciente no supera la verificación de checksums"
  elif ! command -v tar >/dev/null 2>&1 || ! tar -tzf "$BACKUP_ARCHIVE" >/dev/null; then
    block "El archivo del backup reciente no es legible"
  else
    ok "Backup reciente y verificado: $LATEST_BACKUP (${AGE_HOURS}h)"
  fi
else
  warn "No se encontró backup local; confirma que existe uno externo si el deploy toca datos"
fi

printf '\nResumen: %s bloqueo(s), %s aviso(s)\n' "$FAILURES" "$WARNINGS"
[ "$FAILURES" -eq 0 ] || exit 1
