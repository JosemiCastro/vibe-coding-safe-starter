# Vibe Coding Safe Starter

[![secret-scan](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/secret-scan.yml/badge.svg)](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/secret-scan.yml)

A practical guide for people building software with AI without a strong programming background.

The goal is not to kill the fun of building.
The goal is to help you avoid breaking production, losing data, or turning a quick prototype into unmanageable technical debt.

## What problem this solves

A lot of people are building with Claude, Codex, Gemini, and similar tools without a solid software foundation.

That speed is powerful, but it also creates very specific risks:

- changing production without understanding the impact
- committing secrets to a repo
- having no real backups
- deploying without rollback
- accepting huge refactors no one can maintain later
- confusing speed with safety

This repo adds simple guardrails to reduce exactly that.

## Who this is for

- people using AI to build apps and automations
- founders, marketers, operators, and non-technical builders shipping MVPs
- small teams that need minimum rules before deploying
- people who want to use Claude Code or Codex with judgment instead of blind trust

## What you will find here

- operational principles for building with AI without causing damage
- basic security before publishing anything
- backups and recovery
- acceptable vs unacceptable technical debt
- pre-deploy checklists
- templates for documenting projects, changes, and incidents
- specific guides for Claude Code and Codex

## Philosophy

If you are still learning to code, your biggest risk is not writing one bad function.
Your biggest risk is this:

1. changing things without understanding impact
2. having no backup
3. putting secrets in code
4. deploying without rollback
5. accumulating undocumented changes

This repo is designed to put simple rails around that.

## Structure

### Docs
- `docs/01-principios.md` — core rules for working with AI safely
- `docs/02-seguridad-basica.md` — secrets, permissions, auth, and public exposure
- `docs/03-backups.md` — what to back up, how often, and how to verify it
- `docs/04-deuda-tecnica.md` — acceptable vs unacceptable technical debt
- `docs/05-checklist-antes-de-desplegar.md` — short pre-deploy checklist
- `docs/06-trabajar-con-ia-sin-romperlo-todo.md` — recommended workflow for AI-assisted changes
- `docs/07-claude-code.md` — how to use Claude Code safely as a beginner
- `docs/08-codex.md` — how to use Codex with limits and judgment
- `docs/09-claude-code-vs-codex.md` — when to use Claude Code vs Codex

### Templates
- `templates/PROJECT_BRIEF.md` — minimum project brief
- `templates/PRE_DEPLOY_CHECKLIST.md` — reusable pre-deploy checklist
- `templates/INCIDENT_REPORT.md` — incident documentation template
- `templates/CHANGELOG.md` — visible, traceable changes

### Examples
- `examples/.env.example` — safe environment variable example
- `examples/SAFE_PROMPT_TEMPLATE.md` — template for asking AI for changes with proper context
- `examples/stacks/react-node.md` — safe baseline for React + Node + Postgres
- `examples/stacks/nextjs.md` — safe baseline for Next.js projects
- `examples/stacks/n8n.md` — safe baseline for n8n workflows
- `examples/stacks/python.md` — safe baseline for Python projects
- `examples/deploys/rollback-simple.md` — simple deploy with basic rollback
- `examples/deploys/rollback-db.md` — deploy with database rollback plan
- `examples/deploys/rollback-automatizacion.md` — automation rollback example
- `examples/deploys/rollback-landing.md` — landing rollback example

### Checklists
- `checklists/saas-con-usuarios.md` — checklist for SaaS apps with users
- `checklists/automatizacion-interna.md` — checklist for internal automations
- `checklists/landing-web.md` — checklist for landing pages and public sites
- `checklists/dashboard-admin.md` — checklist for admin dashboards

### Scripts
- `scripts/backup-example.sh` — simple backup script example

## Recommended reading order

1. `docs/01-principios.md`
2. `docs/02-seguridad-basica.md`
3. `docs/03-backups.md`
4. `docs/05-checklist-antes-de-desplegar.md`
5. `docs/06-trabajar-con-ia-sin-romperlo-todo.md`
6. `docs/07-claude-code.md`
7. `docs/08-codex.md`
8. `docs/09-claude-code-vs-codex.md`

## Golden rule

If an app has users, payments, data, or third-party API access, never make direct production changes without:

- a recent backup
- a minimum changelog entry
- variables in `.env`
- a rollback plan
- a basic functional test

## Quick start

1. clone or copy this repo
2. fill in `templates/PROJECT_BRIEF.md`
3. create your `.env` from `examples/.env.example`
4. define a backup method before touching production
5. use `templates/PRE_DEPLOY_CHECKLIST.md` on every deploy
6. if you work with agents, also read `docs/07-claude-code.md`, `docs/08-codex.md`, and `docs/09-claude-code-vs-codex.md`

## What this repo does NOT try to do

It does not try to teach you programming from scratch.
It does not try to be an academic manual.
It does not try to cover every stack.

Its job is simpler:

- help you avoid breaking important things
- give you minimum operational judgment
- make AI-assisted building safer and more deliberate

## Strong recommendation

If you are creating repos for people starting with vibe coding, this should be more about **operational judgment** than theory.

Less:
- “what is an API?”

More:
- where NOT to store keys
- when NOT to deploy
- how to roll back
- how to ask AI for smaller changes
- how not to lose your database

## Suggested next improvements

- English versions of all docs, not just the README
- stack-specific examples (`React+Node`, `Next.js`, `n8n`, `Python`)
- more deployment and rollback playbooks
- checklist folders by app type

## License

MIT
