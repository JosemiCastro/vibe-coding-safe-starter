# Vibe Coding Safe Starter

[![quality](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/quality.yml/badge.svg)](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/quality.yml)
[![secret-scan](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/secret-scan.yml/badge.svg)](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/secret-scan.yml)

[Versión en español](./README.md)

A practical guide for building software with AI without breaking production, exposing secrets, or losing data.

This is not a basic programming theory course. It provides **operational judgment**, checklists, templates, and scripts for using Claude Code, Codex, and other coding agents with more control.

## Start here

Read it directly on GitHub or clone it:

```bash
git clone https://github.com/JosemiCastro/vibe-coding-safe-starter.git
cd vibe-coding-safe-starter
```

Have five minutes? Follow this route:

1. open [START_HERE.en.md](./START_HERE.en.md)
2. complete the [Project Brief](./templates/PROJECT_BRIEF.md)
3. use the [safe prompt template](./examples/SAFE_PROMPT_TEMPLATE.md)
4. complete the [Pre-Deploy Checklist](./templates/PRE_DEPLOY_CHECKLIST.md)
5. prepare the [Rollback Plan](./templates/ROLLBACK_PLAN.md)

## Stop if any of these is true

- you do not understand what changed
- AI touched more files than expected
- real data is involved and you have no verified backup
- you do not know how to return to the previous version
- deploy is your only way to discover whether it works

## Choose what you need

| Need | Resource |
|---|---|
| Protect secrets | [Where NOT to store secrets](./docs/en/10-where-not-to-store-secrets.md) |
| Decide whether to deploy | [When NOT to deploy](./docs/en/11-when-not-to-deploy.md) |
| Prepare rollback | [How to roll back](./docs/en/12-how-to-roll-back.md) |
| Ask AI for smaller changes | [How to ask AI for small changes](./docs/en/13-how-to-ask-ai-for-small-changes.md) |
| Protect data | [How not to lose your database](./docs/en/14-how-not-to-lose-your-database.md) |
| Use Claude Code | [Claude Code guide — Spanish](./docs/07-claude-code.md) |
| Use Codex | [Codex guide — Spanish](./docs/08-codex.md) |
| Choose an agent | [Claude Code vs Codex — Spanish](./docs/09-claude-code-vs-codex.md) |

## Recommended safe flow

```text
Known-good state → small change → review → test → backup → deploy → validate
        ↑                                                              ↓
        └──────────────────────── rollback on failure ──────────────────┘
```

1. save a known-good state in Git
2. request one concrete change
3. review affected files and risks
4. test the exact case
5. create and verify a backup when data is involved
6. deploy with rollback prepared
7. validate the main flow and logs

## Project checklists

- [SaaS with users — Spanish](./checklists/saas-con-usuarios.md)
- [Internal automation — Spanish](./checklists/automatizacion-interna.md)
- [Landing or corporate site — Spanish](./checklists/landing-web.md)
- [Admin dashboard — Spanish](./checklists/dashboard-admin.md)
- [Admin panel and roles — Spanish](./checklists/panel-admin-y-roles.md)
- [Payments and subscriptions — Spanish](./checklists/pagos-y-suscripciones.md)
- [Database migration — Spanish](./checklists/migracion-base-de-datos.md)
- [External API integration — Spanish](./checklists/api-externa.md)

## Realistic deploy and rollback cases

- [Login broken after a change — Spanish](./examples/deploys/rollback-simple.md)
- [Failed migration or database change — Spanish](./examples/deploys/rollback-db.md)
- [Automation firing too often — Spanish](./examples/deploys/rollback-automatizacion.md)
- [Broken landing page or form — Spanish](./examples/deploys/rollback-landing.md)

## Stack examples

- [React + Node + Postgres — Spanish](./examples/stacks/react-node.md)
- [Next.js — Spanish](./examples/stacks/nextjs.md)
- [n8n — Spanish](./examples/stacks/n8n.md)
- [Python — Spanish](./examples/stacks/python.md)

## Operational templates

- [Project Brief](./templates/PROJECT_BRIEF.md)
- [Pre-Deploy Checklist](./templates/PRE_DEPLOY_CHECKLIST.md)
- [Rollback Plan](./templates/ROLLBACK_PLAN.md)
- [Incident Report](./templates/INCIDENT_REPORT.md)
- [Changelog](./templates/CHANGELOG.md)

## Example scripts

> These are educational examples. Read, adapt, and test them outside production.

```bash
# Validate repository structure and shell syntax
./scripts/validate-repo.sh

# Create backup; .env is excluded by default
APP_ROOT=/path/project BACKUP_ROOT=/external/path ./scripts/backup-example.sh

# Only when you explicitly accept a backup without the requested database dump
ALLOW_PARTIAL_BACKUP=true APP_ROOT=/path/project ./scripts/backup-example.sh

# Verify checksums and readability
./scripts/verify-backup-example.sh /path/to/backup

# Pre-deploy sanity check
APP_ROOT=/path/project ./scripts/predeploy-check-example.sh
```

## Security

- Gitleaks scans pushes and pull requests for secrets.
- The `quality` workflow validates structure, local links, and Bash syntax.
- Read [SECURITY.md](./SECURITY.md) before reporting an exposed secret or vulnerability.

## Contributing

Contributions should solve a practical problem, include a verifiable example, and contain no secrets. Read [CONTRIBUTING.md](./CONTRIBUTING.md) and see published changes in [CHANGELOG.md](./CHANGELOG.md).

## License

MIT. See [LICENSE](./LICENSE).
