#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMP_ROOT="$(mktemp -d)"
trap 'rm -rf "$TEMP_ROOT"' EXIT

mkdir -p "$TEMP_ROOT/scripts"
cp -a "$ROOT/.claude" "$TEMP_ROOT/"
cp -a "$ROOT/.agents" "$TEMP_ROOT/"
cp "$ROOT/scripts/validate-skills.sh" "$TEMP_ROOT/scripts/validate-skills.sh"
chmod +x "$TEMP_ROOT/scripts/validate-skills.sh"

printf '[test] Skill válida y sincronizada\n'
"$TEMP_ROOT/scripts/validate-skills.sh" >/dev/null

printf '[test] Detectar copias desincronizadas\n'
printf '\n# drift\n' >> "$TEMP_ROOT/.agents/skills/vibe-coding-safe/SKILL.md"
if "$TEMP_ROOT/scripts/validate-skills.sh" >/dev/null 2>&1; then
  echo "[error] Se aceptaron skills desincronizadas" >&2
  exit 1
fi
cp "$TEMP_ROOT/.claude/skills/vibe-coding-safe/SKILL.md" "$TEMP_ROOT/.agents/skills/vibe-coding-safe/SKILL.md"

printf '[test] Rechazar frontmatter YAML inválido\n'
python3 - "$TEMP_ROOT" <<'PY'
from pathlib import Path
import sys
root = Path(sys.argv[1])
for relative in (
    ".claude/skills/vibe-coding-safe/SKILL.md",
    ".agents/skills/vibe-coding-safe/SKILL.md",
):
    path = root / relative
    text = path.read_text(encoding="utf-8")
    path.write_text(text.replace("name: vibe-coding-safe", "name: [broken", 1), encoding="utf-8")
PY
if "$TEMP_ROOT/scripts/validate-skills.sh" >/dev/null 2>&1; then
  echo "[error] Se aceptó frontmatter YAML inválido" >&2
  exit 1
fi

printf '[ok] Pruebas de skills superadas\n'
