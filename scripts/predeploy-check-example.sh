#!/usr/bin/env bash
set -euo pipefail

# Script orientativo de chequeo previo a deploy.
# No decide por ti; te ayuda a detectar huecos básicos antes de publicar.

APP_ROOT="${APP_ROOT:-$(pwd)}"
EXIT_CODE=0

ok() { echo "[ok] $*"; }
warn() { echo "[warn] $*"; EXIT_CODE=1; }
info() { echo "[info] $*"; }

info "Revisando proyecto en $APP_ROOT"

# Git limpio
if git -C "$APP_ROOT" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if [ -n "$(git -C "$APP_ROOT" status --short)" ]; then
    warn "Hay cambios sin commitear"
  else
    ok "Working tree limpio"
  fi
else
  warn "No parece un repo git"
fi

# .env
if [ -f "$APP_ROOT/.env" ]; then
  ok ".env presente"
else
  warn "No existe .env en la raíz del proyecto"
fi

# Changelog
if [ -f "$APP_ROOT/templates/CHANGELOG.md" ] || [ -f "$APP_ROOT/CHANGELOG.md" ]; then
  ok "Existe changelog o plantilla de changelog"
else
  warn "No hay changelog visible"
fi

# Secretos típicos trackeados
MATCHES=$(grep -RInE "OPENAI_API_KEY=|GEMINI_API_KEY=|CLAUDE_API_KEY=|DATABASE_URL=postgres|AKIA[0-9A-Z]{16}" "$APP_ROOT" \
  --exclude-dir=.git \
  --exclude=.env \
  --exclude=.env.example \
  --exclude='*.md' \
  --exclude='predeploy-check-example.sh' 2>/dev/null || true)
if [ -n "$MATCHES" ]; then
  warn "Posibles secretos o conexiones sensibles encontrados:"
  echo "$MATCHES"
else
  ok "No se detectan secretos típicos en archivos rastreados"
fi

# Backups
if [ -d "$APP_ROOT/backups" ]; then
  ok "Existe directorio backups/"
else
  warn "No existe directorio backups/"
fi

# Resumen
if [ "$EXIT_CODE" -eq 0 ]; then
  echo "\nResultado: checklist básica superada"
else
  echo "\nResultado: revisa los warnings antes de desplegar"
fi

exit "$EXIT_CODE"
