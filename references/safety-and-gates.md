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

## Next-Step Classification Gate

Classify every PM, Advisor, Leader, or Reviewer next-step recommendation before executing it.

A loop's current-run effective governance is immutable for that run. A separately authorized governance-refinement loop may edit future governance artifacts, but it must still exit under the gate set in force at startup. New or revised gate text can govern only later loops unless the owner explicitly names a different current-run gate exception.

Continue within the current run only when all are true:

- The action is required to satisfy the current completion predicate.
- The action stays inside the frozen owner-authorized objective category.
- The action does not relax or expand the loop's current-run effective governance.
- The action is not default-excluded and does not introduce a new high-risk domain.
- Required validation and PM/Advisor gates remain fresh for the affected scope.

Stop, ask the owner, or record a Next Backlog item when any are true:

- The action starts a new objective category, such as moving from README work to release, CI, promotion, implementation, or governance refinement.
- The action changes authorization, review, commit, push, release, publication, handoff, or escalation rules for the same loop currently running, unless the frozen objective category is governance refinement, the owner authorized that category, the change is limited to future governance artifacts, and the run still exits under the gate set in force at startup.
- The action is useful polish but not necessary for the completion predicate.
- The action touches a default-excluded area.

Next Backlog items must include:

- item
- why it matters
- risk
- needs owner authorization
- recommended priority

## Gate Repair Window

Owner authorization should target a frozen objective and a bounded, verifiable repair window, not each individual repair line.

Within an owner-authorized Gate Repair Window, continue without asking the owner again only when all are true:

- The repair is requested by PM, Advisor, Reviewer, validation, or Leader verification as a P0/P1 repair necessary for the current completion predicate.
- The repair stays inside the frozen objective category and declared file scope.
- The repair does not relax or expand current-run effective governance.
- The repair does not introduce a default-excluded action or new high-risk domain.
- The repair touches only declared files or validation coverage for declared files.
- Fresh validation runs after the repair.
- Fresh PM/Advisor review clears the repaired target before commit, push, or another gated exit.

Do not consume a full repair cycle for validation-only repairs unless the owner says otherwise. Treat staging a required newly tracked file as a git-gate precondition, not a new objective.

Stop for owner confirmation when a repair would cross categories, change risk class, relax current-run effective governance, add default-excluded actions, expand file scope beyond the declared repair window, exceed the repair window, or remain disputed as P0/P1 after the window is exhausted.

Each Gate Repair Window must have both a repair-cycle cap and a wall-clock cap. Validation-only repairs may also have a separate cap, but they remain subject to the wall-clock cap. Validation-coverage repairs must be additive or coverage-preserving; deleting or weakening a declared check is `P1-governance-relax`.

Recommended P1 classification:

- `P1-target`: target contract or behavior is materially wrong.
- `P1-validation`: validation fails or misses a required declared check.
- `P1-git-precondition`: commit/push precondition is missing, such as staging a required newly tracked file.
- `P1-scope-change`: requested repair crosses the frozen objective or file scope and needs owner confirmation.
- `P1-risk-change`: requested repair changes the risk class and needs owner confirmation.
- `P1-governance-relax`: requested repair relaxes current-run effective governance and must stop.

## Objective Amendments

Changing a frozen objective requires explicit owner instruction, recorded amendment provenance, and a re-frozen objective before further review. The record must identify what changed, why it changed, who authorized it, and when it was authorized.

Objective amendments do not retroactively authorize work already performed and do not change the startup gate-set snapshot unless the owner explicitly names that current-run gate exception.

## Readiness Levels

- L0 Draft: documented intent and loop design only.
- L1 Report: report-only loop with state guidance and no source mutation.
- L2 Assisted: small bounded actions with verifier and human review.
- L3 Unattended: only after denylist, budget, observability, verifier, and human gates are proven.

V1 targets L0/L1 only.
