# Safety And Gates

`loop-crafter` designs loops; it does not grant execution authority.

## Default Forbidden Actions

Require explicit owner authorization before any loop may perform:

- Force-push or history rewrite
- Tag or release publication
- Deployment or public publication
- Credential, secret, security, permission, or authentication changes
- Schema migration
- Destructive operation
- Irreversible external effect

## Denylist

Treat these paths and domains as human-gated:

- `.env`
- `.env.*`
- `**/secrets/**`
- `**/credentials/**`
- `**/*_key*`
- `**/*_secret*`
- `auth/**`
- `payments/**`
- `billing/**`
- `**/migrations/**`
- production infrastructure files

## Git Gates

Commit and push are governed by project rules and `multi-agent-working-group`.

Normal commit or push may proceed only when PM and Advisor agree, validation is fresh, scope is clear, no unresolved P0/P1 remains, and the action is not high-risk or default-excluded.

## Readiness Levels

- L0 Draft: documented intent and loop design only.
- L1 Report: report-only loop with state guidance and no source mutation.
- L2 Assisted: small bounded actions with verifier and human review.
- L3 Unattended: only after denylist, budget, observability, verifier, and human gates are proven.

V1 targets L0/L1 only.
