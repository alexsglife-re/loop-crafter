# Examples

## Report-Only Daily Triage

Loop name: `daily-triage-report`

- Goal: produce a daily report of high-priority project items.
- Trigger: owner request or daily reminder.
- Evidence: git status, recent commits, open docs/tasks, validation output when available.
- Roles: single designer or PM/Advisor if the report affects git gates.
- Allowed actions: read files and report findings.
- Forbidden actions: source edits, commit, push, deployment, publication, and external writes.
- Validation: report includes findings, uncertainty, stop conditions, and next owner decision.
- State: optional `STATE.md` recommendation only unless owner authorizes writing it.
- Readiness: L1 report-only.

## Deterministic-Verifier Loop

Loop name: `validator-feedback-loop`

- Goal: update a design until `./scripts/validate-local.sh` exits 0.
- Trigger: owner asks for validation loop.
- Evidence: design files and validator output.
- Allowed actions: propose fixes or scaffold only when owner explicitly asks.
- Verifier command shape: `./scripts/validate-local.sh`
- Pass evidence: exit code 0 and no P0/P1 findings.
- Fail evidence: non-zero exit code plus captured failing check.
- Future verifier location if scaffolded: `scripts/validate-local.sh` in the target project.
- Readiness: L0 design by default; L1 if report-only state is authorized.

## Multi-Agent Loop

Loop name: `multi-agent-review-loop`

- Goal: get independent PM and Advisor agreement before a gated action.
- Trigger: owner requests implementation, commit, push, or review.
- Evidence: current project files, git diff, validation output, and design docs.
- Roles: PM, Advisor, optional Worker, optional Reviewer.
- Governance: `multi-agent-working-group` controls role independence, consensus, P0/P1 handling, commit, push, and handoff gates.
- Allowed actions: design role prompts and required outputs.
- Forbidden actions: redefining PM/Advisor rules or self-authorizing git exits.
- Validation: PM and Advisor agree on goal, scope, risk, next action, verification, and no unresolved P0/P1.
