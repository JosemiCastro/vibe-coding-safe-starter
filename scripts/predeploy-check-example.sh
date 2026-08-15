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
  block "Posibles secretos hardcodeados en archivos versionados:"
  printf '%s\n' "$SECRET_HITS"
else
  ok "Sin patrones obvios de secretos en archivos versionados"
fi

if [ -f "$APP_ROOT/CHANGELOG.md" ] || [ -f "$APP_ROOT/templates/CHANGELOG.md" ]; then
  ok "Changelog disponible"
else
  warn "No hay changelog"
fi

LATEST_BACKUP="$(find "$APP_ROOT/backups" -mindepth 1 -maxdepth 1 -type d -name 'backup-*' -printf '%T@ %p\n' 2>/dev/null | sort -nr | cut -d' ' -f2- | head -1 || true)"
if [ -n "$LATEST_BACKUP" ]; then
  AGE_HOURS=$(( ( $(date +%s) - $(stat -c %Y "$LATEST_BACKUP") ) / 3600 ))
  if [ "$AGE_HOURS" -le "$BACKUP_MAX_AGE_HOURS" ]; then
    ok "Backup reciente: $LATEST_BACKUP (${AGE_HOURS}h)"
  else
    block "Último backup demasiado antiguo: ${AGE_HOURS}h"
  fi
else
  warn "No se encontró backup local; confirma que existe uno externo si el deploy toca datos"
fi

printf '\nResumen: %s bloqueo(s), %s aviso(s)\n' "$FAILURES" "$WARNINGS"
[ "$FAILURES" -eq 0 ] || exit 1
