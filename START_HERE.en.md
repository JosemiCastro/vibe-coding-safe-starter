# Start here: 5 minutes before building

You do not need to read the whole repository now. Do these five things first.

> **AI shortcut:** if you opened this project with Claude Code, use `/vibe-coding-safe`. In Codex, mention `$vibe-coding-safe` or select it from `/skills`. The skill will guide you, but you should review its decisions and results.

## 1. Protect your secrets

- use `.env`
- confirm `.env` is ignored by Git
- never put keys in React, public HTML, READMEs, screenshots, or commits

Read: [Where NOT to store secrets](docs/en/10-where-not-to-store-secrets.md)

## 2. Save a known-good state

```bash
git add .
git commit -m "stable state before change"
```

If you cannot return to this point, do not make a large change yet.

## 3. Ask AI for one thing only

```text
Project [stack].
Change only [specific area].
Do not touch auth, database, or deploy.
Return affected files, risks, test steps, and rollback.
```

## 4. Before deploying

Complete: [Pre-Deploy Checklist](templates/PRE_DEPLOY_CHECKLIST.md)

Stop if:
- you do not understand the change
- you have no backup
- you do not know how to roll back
- AI changed more files than expected

## 5. If something fails

1. stop new changes
2. save logs
3. return to the last known-good version
4. validate the main flow
5. document the incident

Use:
- [Rollback Plan](templates/ROLLBACK_PLAN.md)
- [Incident Report](templates/INCIDENT_REPORT.md)

## Recommended next route

1. [When NOT to deploy](docs/en/11-when-not-to-deploy.md)
2. [How to roll back](docs/en/12-how-to-roll-back.md)
3. [How to ask AI for small changes](docs/en/13-how-to-ask-ai-for-small-changes.md)
4. [How not to lose your database](docs/en/14-how-not-to-lose-your-database.md)
