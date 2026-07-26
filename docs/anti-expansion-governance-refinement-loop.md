# Anti-Expansion Governance Refinement Loop

## Loop Name

`anti-expansion-governance-refinement`

## Project Scope

Repository `loop-crafter` skill documentation, safety references, readiness rules, examples, V2 requirements, and local validation checks.

## Non-Goals

- No release or tag publication.
- No installed-skill sync.
- No unattended runner implementation.
- No changes to `multi-agent-working-group` governance.
- No new promotion or README objective.

## Trigger Condition

Owner reports that a loop expanded beyond its target or started recursively governing its own governance.

## Objective Category

Governance refinement.

## Frozen Objective

Add anti-expansion controls to the repository skill and validation package so future loops freeze their target, stop at completion, classify next steps, use a bounded owner-authorized Gate Repair Window, and cannot use newly edited governance text as current-run authority.

## Startup Gate-Set Snapshot

Current-run authority remains the project and governance rules in force at startup:

- Project `AGENTS.md` requires `multi-agent-working-group` for development, review, commit, and push gates.
- Normal commit and push require PM and Advisor agreement, fresh validation, clear scope, no unresolved P0/P1, and passing secret/copy-content checks.
- Default-excluded actions still require explicit owner authorization naming the action.
- Newly edited governance text in this run may guide future loops only after this run exits under the startup gate set.
- The current-run effective governance is immutable; future governance artifacts may be edited, but they cannot grant authority to this run.

## Completion Predicate

The repository documentation and validation script require these controls:

- Goal Freeze.
- Authorized Objective Continuation.
- Completion Predicate.
- Phase Boundary.
- No Self-Governance Expansion.
- Next Backlog.
- Gate Repair Window.
- Exit under the gate set in force at startup.

## Evidence Inputs

- `SKILL.md`
- `docs/loop-crafter-design.md`
- `docs/loop-crafter-v2-requirements.md`
- `docs/validation/loop-crafter-v2-behavior-validation.md`
- `references/loop-design-checklist.md`
- `references/safety-and-gates.md`
- `references/readiness-model.md`
- `references/examples.md`
- `references/scaffold-package.md`
- `scripts/validate-local.sh`
- `docs/anti-expansion-governance-refinement-loop.md`
- `git status --short --branch`
- `./scripts/validate-local.sh`

## Declared File Scope

- `SKILL.md`
- `docs/loop-crafter-design.md`
- `docs/loop-crafter-v2-requirements.md`
- `docs/validation/loop-crafter-v2-behavior-validation.md`
- `references/examples.md`
- `references/loop-design-checklist.md`
- `references/readiness-model.md`
- `references/safety-and-gates.md`
- `references/scaffold-package.md`
- `scripts/validate-local.sh`
- `docs/anti-expansion-governance-refinement-loop.md`

## Objective Amendments

- Owner instruction: add Gate Repair Window so owner authorization covers a frozen-objective repair window instead of each individual repair line.
- Change made: Frozen Objective, Completion Predicate, safety rules, scaffold contracts, behavior validation, and local validation now include Gate Repair Window.
- Authorized by: owner message in the current conversation.
- Authorized when: 2026-07-26 America/Los_Angeles.
- Re-frozen objective: add anti-expansion controls and Gate Repair Window to the declared file scope without release, tag, installed-skill sync, publication, deployment, or current-run governance relaxation.

## Allowed Actions

- Update `loop-crafter` documentation and validation checks for anti-expansion controls.
- Record review evidence after PM and Advisor review.
- Commit and push only after project git gates pass.

## Human Gates

- Owner confirmation is required for any new objective category.
- Owner confirmation is required for default-excluded actions.
- PM and Advisor agreement is required before normal commit or push.

## State, Budget, And Recovery

- State: this document records the current governance-refinement loop package.
- Gate Repair Window: owner authorizes bounded P0/P1 repairs inside this governance-refinement objective, including validation-only repairs, as long as they do not relax current-run effective governance, do not add default-excluded actions, remain inside the declared files, and receive fresh validation plus fresh PM/Advisor review before git exit.
- Declared File Scope: the 11 files listed in this document.
- repair-window opened: 2026-07-26T16:10:41-0700.
- repair-window expires: 2026-07-26T17:40:41-0700.
- repair-cycle cap: up to 3 bounded repair cycles for PM, Advisor, Reviewer, validation, or Leader verification P0/P1 repairs.
- wall-clock cap: 90 minutes for the active repair window.
- validation-only budget handling: validation-only repairs and staging required newly tracked files do not consume a full repair cycle.
- repair-window forbidden actions: release, tag, installed-skill sync, publication, deployment, default-excluded actions, scope expansion, and current-run governance relaxation remain forbidden.
- fresh-review requirement: fresh validation and fresh PM/Advisor review are required before commit, push, or another git exit.
- Leader recovery: after interruption, re-read this document, current git status, current diff, and latest PM/Advisor findings before continuing.
- PM/Advisor recovery: before both independent first passes finish, each role may read only its own prior reasoning plus a conclusion-free evidence packet; do not read the other role's conclusions.

## Forbidden Actions

- Tag or release publication.
- Deployment or public publication.
- Installed-skill sync.
- Credential, secret, auth, security, permission, schema, production, or destructive changes.
- Changing `multi-agent-working-group` rules.
- Starting a new objective category without owner confirmation.

## Roles

- Leader: implement the narrow repository change, verify evidence, and handle git gates.
- PM: independently review scope, completion predicate, validation, and whether the change preserves same-objective continuation.
- Advisor: independently review safety, over-expansion risk, recursive governance risk, and whether default-excluded actions remain gated.

## Validation Plan

Run:

```bash
./scripts/validate-local.sh
git diff --check
```

Pass evidence:

- Local validation exits 0.
- Diff check exits 0.
- PM and Advisor report no unresolved P0/P1.
- Secret/copy-content scan in validation passes.

## Stop Conditions

- Failed validation.
- Unresolved P0/P1.
- Missing PM or Advisor review before git exit.
- Default-excluded action requested without explicit owner authorization.
- Any recommended next step outside the governance-refinement objective.

## Next Backlog Contract

Recommendations outside the frozen target must be recorded using:

```text
item:
why it matters:
risk:
needs owner authorization:
recommended priority:
```

## Current Next Backlog

item: Consider richer examples for long-running implementation loops.
why it matters: More examples can make the anti-expansion controls easier to apply across projects.
risk: Low for examples only; medium if examples change governance behavior.
needs owner authorization: Yes, if handled after this loop's completion predicate is satisfied.
recommended priority: Medium.

## Next Owner Decision

No owner decision is needed if PM and Advisor clear the repaired target and normal commit/push gates pass. Owner confirmation is required before release, tag, installed-skill sync, publication, deployment, or any new objective category.
