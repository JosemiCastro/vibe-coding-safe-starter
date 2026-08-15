#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_SKILL="$ROOT/.claude/skills/vibe-coding-safe/SKILL.md"
CODEX_SKILL="$ROOT/.agents/skills/vibe-coding-safe/SKILL.md"

fail() { printf '[error] %s\n' "$*" >&2; exit 1; }
ok() { printf '[ok] %s\n' "$*"; }

[ -f "$CLAUDE_SKILL" ] || fail "Falta la skill de Claude Code"
[ -f "$CODEX_SKILL" ] || fail "Falta la skill de Codex"
cmp -s "$CLAUDE_SKILL" "$CODEX_SKILL" || fail "Las skills de Claude Code y Codex no están sincronizadas"

python3 - "$CLAUDE_SKILL" <<'PY'
from pathlib import Path
import re
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")
if not text.startswith("---\n"):
    raise SystemExit("[error] SKILL.md debe empezar por frontmatter YAML")
match = re.match(r"---\n(.*?)\n---\n(.+)", text, re.S)
if not match:
    raise SystemExit("[error] Frontmatter o cuerpo de SKILL.md inválido")
frontmatter, body = match.groups()
frontmatter_match = re.fullmatch(
    r"name: ([a-z0-9]+(?:-[a-z0-9]+)*)\ndescription: ([^\n]+)",
    frontmatter,
)
if not frontmatter_match:
    raise SystemExit("[error] Frontmatter debe contener solo name y description en formato YAML simple")
name, description = frontmatter_match.groups()
if name != "vibe-coding-safe":
    raise SystemExit("[error] name debe ser vibe-coding-safe")
if not description.strip():
    raise SystemExit("[error] Falta description")
if len(description) > 1024:
    raise SystemExit("[error] description supera 1024 caracteres")
if any(char in description for char in "[]{}#&*!|>'\"%@`:"):
    raise SystemExit("[error] description contiene caracteres no permitidos para YAML simple")
required = [
    "## Cuándo usar esta skill",
    "## Flujo obligatorio",
    "## Escala de riesgo",
    "## Criterio de finalización",
]
missing = [heading for heading in required if heading not in body]
if missing:
    raise SystemExit("[error] Faltan secciones: " + ", ".join(missing))
print("[ok] Frontmatter y estructura de SKILL.md válidos")
PY

ok "Skill compatible sincronizada para Claude Code y Codex"
