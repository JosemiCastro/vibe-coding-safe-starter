#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FAILED=0

required=(
  README.md README.en.md START_HERE.md START_HERE.en.md
  LICENSE CONTRIBUTING.md SECURITY.md CHANGELOG.md
  templates/PROJECT_BRIEF.md templates/PRE_DEPLOY_CHECKLIST.md
  templates/ROLLBACK_PLAN.md templates/INCIDENT_REPORT.md
  scripts/backup-example.sh scripts/verify-backup-example.sh
  scripts/predeploy-check-example.sh scripts/test-scripts.sh
  scripts/validate-skills.sh scripts/test-skills.sh
  .claude/skills/vibe-coding-safe/SKILL.md
  .agents/skills/vibe-coding-safe/SKILL.md
)

for path in "${required[@]}"; do
  if [ -e "$ROOT/$path" ]; then
    printf '[ok] %s\n' "$path"
  else
    printf '[missing] %s\n' "$path" >&2
    FAILED=1
  fi
done

for script in "$ROOT"/scripts/*.sh; do
  bash -n "$script" || FAILED=1
done

# Detecta enlaces Markdown locales rotos en README y docs.
python3 - "$ROOT" <<'PY' || FAILED=1
from pathlib import Path
import re, sys
root = Path(sys.argv[1])
broken = []
ignored_dirs = {'.git', 'node_modules', '.venv', 'venv', 'dist', 'build', '.next', 'coverage', 'backups'}
for file in root.rglob('*.md'):
    if ignored_dirs.intersection(file.parts):
        continue
    text = file.read_text(encoding='utf-8')
    for target in re.findall(r'\[[^]]+\]\(([^)]+)\)', text):
        if target.startswith(('http://', 'https://', '#', 'mailto:')):
            continue
        clean = target.split('#',1)[0]
        if clean and not (file.parent / clean).resolve().exists():
            broken.append(f'{file.relative_to(root)} -> {target}')
if broken:
    print('[error] Enlaces locales rotos:')
    print('\n'.join(broken))
    raise SystemExit(1)
print('[ok] Enlaces Markdown locales válidos')
PY

"$ROOT/scripts/validate-skills.sh" || FAILED=1

exit "$FAILED"
