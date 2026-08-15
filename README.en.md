# Vibe Coding Safe Starter

[![secret-scan](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/secret-scan.yml/badge.svg)](https://github.com/JosemiCastro/vibe-coding-safe-starter/actions/workflows/secret-scan.yml)

[Versión en español](./README.md)

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
- concrete rules about where NOT to store secrets
- clear criteria for when NOT to deploy
- simple rollback and recovery guidance
- how to ask AI for smaller changes
- how not to lose your database
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

### Spanish docs
- `docs/01-principios.md` — core rules for working with AI safely
- `docs/02-seguridad-basica.md` — secrets, permissions, auth, and public exposure
- `docs/03-backups.md` — what to back up, how often, and how to verify it
- `docs/04-deuda-tecnica.md` — acceptable vs unacceptable technical debt
- `docs/05-checklist-antes-de-desplegar.md` — short pre-deploy checklist
- `docs/06-trabajar-con-ia-sin-romperlo-todo.md` — recommended workflow for AI-assisted changes
- `docs/07-claude-code.md` — how to use Claude Code safely as a beginner
- `docs/08-codex.md` — how to use Codex with limits and judgment
- `docs/09-claude-code-vs-codex.md` — when to use Claude Code vs Codex
- `docs/10-donde-no-guardar-claves.md` — where not to store secrets
- `docs/11-cuando-no-desplegar.md` — when not to deploy
- `docs/12-como-revertir.md` — how to roll back
- `docs/13-como-pedir-cambios-pequenos-a-la-ia.md` — how to ask AI for small changes
- `docs/14-como-no-perder-la-base-de-datos.md` — how not to lose your database

### English operational docs
- `docs/en/10-where-not-to-store-secrets.md`
- `docs/en/11-when-not-to-deploy.md`
- `docs/en/12-how-to-roll-back.md`
- `docs/en/13-how-to-ask-ai-for-small-changes.md`
- `docs/en/14-how-not-to-lose-your-database.md`

The most important docs for a beginner are not the most theoretical ones.
They are the ones that stop expensive mistakes on day one.

### Templates
- `templates/PROJECT_BRIEF.md` — operational brief with risks, environments, and rollback
- `templates/PRE_DEPLOY_CHECKLIST.md` — reusable checklist with real deploy blockers
- `templates/INCIDENT_REPORT.md` — incident template with cause, containment, and prevention
- `templates/CHANGELOG.md` — visible, traceable changes useful for rollback

### Examples
- `examples/.env.example` — safe environment variable example
- `examples/SAFE_PROMPT_TEMPLATE.md` — template for asking AI for changes with proper context
- `examples/stacks/react-node.md` — safe baseline for React + Node + Postgres
- `examples/stacks/nextjs.md` — safe baseline for Next.js projects
- `examples/stacks/n8n.md` — safe baseline for n8n workflows
- `examples/stacks/python.md` — safe baseline for Python projects
- `examples/deploys/rollback-simple.md` — realistic case: login or small change broken after deploy
- `examples/deploys/rollback-db.md` — realistic case: database error after deploy
- `examples/deploys/rollback-automatizacion.md` — realistic case: automation firing too often
- `examples/deploys/rollback-landing.md` — realistic case: landing or form broken after release

### Checklists
- `checklists/saas-con-usuarios.md` — checklist for SaaS apps with users
- `checklists/automatizacion-interna.md` — checklist for internal automations
- `checklists/landing-web.md` — checklist for landing pages and public sites
- `checklists/dashboard-admin.md` — checklist for admin dashboards

### Scripts
- `scripts/backup-example.sh` — operational backup example with manifest, compression, and PostgreSQL dump when available
- `scripts/predeploy-check-example.sh` — example pre-deploy sanity check

## Recommended reading order

1. `docs/en/10-where-not-to-store-secrets.md`
2. `docs/en/11-when-not-to-deploy.md`
3. `docs/en/12-how-to-roll-back.md`
4. `docs/en/13-how-to-ask-ai-for-small-changes.md`
5. `docs/en/14-how-not-to-lose-your-database.md`
6. `docs/07-claude-code.md`
7. `docs/08-codex.md`
8. `docs/09-claude-code-vs-codex.md`
9. review `examples/stacks/` if one of them matches your project
10. use `checklists/` and `examples/deploys/` before deploying

## Golden rule

If an app has users, payments, data, or third-party API access, never make direct production changes without:

- a recent backup
- a minimum changelog entry
- variables in `.env`
- a rollback plan
- a basic functional test

## Quick start

1. clone or copy this repo
2. read `docs/en/10-where-not-to-store-secrets.md` first
3. continue with `docs/en/11-when-not-to-deploy.md` and `docs/en/12-how-to-roll-back.md`
4. fill in `templates/PROJECT_BRIEF.md`
5. create your `.env` from `examples/.env.example`
6. define a backup method before touching production
7. use `templates/PRE_DEPLOY_CHECKLIST.md` on every deploy
8. if you work with agents, also read `docs/en/13-how-to-ask-ai-for-small-changes.md`, `docs/07-claude-code.md`, `docs/08-codex.md`, and `docs/09-claude-code-vs-codex.md`

## What this repo does NOT try to do

It does not try to teach you programming from scratch.
It does not try to be an academic manual.
It does not try to cover every stack.
It does not try to impress you with theory that will not prevent real mistakes.

Its job is simpler:

- help you avoid breaking important things
- give you minimum operational judgment
- make AI-assisted building safer and more deliberate
- teach you to stop before an expensive mistake

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
