# Security Policy

## Reporting a security issue

Do **not** open a public issue containing:
- real API keys or tokens
- passwords
- database connection strings
- private logs or personal data

For this educational repository, open a private GitHub security advisory from the repository’s **Security** tab when possible.

## If you exposed a secret

1. rotate it immediately
2. remove it from the current code
3. remove it from Git history if needed
4. review where it was used
5. document the incident without copying the real value

Read:
- [Dónde NO guardar claves](docs/10-donde-no-guardar-claves.md)
- [Where NOT to store secrets](docs/en/10-where-not-to-store-secrets.md)

## Scope

This repository contains educational guidance and example scripts. Adapt and test them in a safe environment before using them with production data.
