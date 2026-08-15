# Where NOT to store secrets

If you are starting with vibe coding, this can save you from one of the dumbest and most expensive mistakes.

## Never store secrets in
- `.js`, `.ts`, `.py`, `.php` files
- frontend code (`React`, client-side `Next.js`, public HTML)
- Git repositories
- screenshots
- issues, chats, or pasted snippets in public places
- public documentation
- unencrypted backups scattered across folders
- tool exports that include credentials

## Things you should NEVER commit
- `OPENAI_API_KEY=...` inside a commit
- a real Postgres connection string in a README
- an n8n token pasted into an exported workflow
- production credentials inside a tracked `.env`
- a service-account JSON uploaded “just for testing”

## Correct places
- a local untracked `.env`
- your hosting or platform secret manager
- server environment variables
- a proper vault if the project already needs one

## Simple rule
If the user’s browser can see the value, it is not a secret.

## Before you push
Always check:
- whether you touched `.env`
- whether logs contain tokens
- whether you uploaded exports with credentials
- whether AI inserted a fake-looking key that might actually be real
- whether shared config files still contain secrets

## If you already exposed one
1. do not leave it there
2. rotate the key
3. remove it from the repo and history if needed
4. review downstream access
5. document the incident
6. verify whether it was used in production or only in testing

## Typical beginner mistake
“I’ll remove it later.”
That usually ends in a forgotten commit, a shared screenshot, or a secret exposed longer than you thought.

## Minimum checklist
- [ ] no real `.env` files are tracked
- [ ] no secrets exist in frontend code
- [ ] no shared logs contain tokens
- [ ] you know where each real secret lives

## Final rule
Knowing what an API is matters less than knowing a real secret should never end up in public code.
