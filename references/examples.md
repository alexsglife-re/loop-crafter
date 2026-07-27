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

## Anti-Expansion Governance Refinement

Loop name: `anti-expansion-governance-refinement`

- Goal: add loop rules that prevent target expansion and recursive self-governance while preserving same-objective continuation.
- Objective category: governance refinement.
- Completion predicate: skill references and local validation require Goal Freeze, Completion Predicate, Phase Boundary, Authorized Objective Continuation, No Self-Governance Expansion, Next Backlog, and Gate Repair Window.
- Gate Repair Window: owner-authorized for bounded P0/P1 repair inside the frozen governance-refinement objective.
- Declared File Scope: skill, requirements, validation, and reference files named by the loop package.
- repair-window opened: 2026-07-26T16:10:41-0700.
- repair-window expires: 2026-07-26T17:40:41-0700.
- repair-cycle cap: 3 bounded repair cycles.
- wall-clock cap: 90 minutes.
- validation-only budget handling: validation-only repairs do not consume a full repair cycle but remain subject to the wall-clock cap.
- repair-window forbidden actions: release, tag, installed-skill sync, publication, deployment, default-excluded actions, scope expansion, and current-run governance relaxation.
- fresh-review requirement: fresh validation and fresh PM/Advisor review before commit, push, or another git exit.
- Trigger: owner reports that a loop expanded beyond its goal or began governing itself.
- Evidence: current skill files, safety references, readiness model, validation script, and PM/Advisor review.
- Roles: Leader implements narrow documentation/script changes; PM and Advisor independently review before commit or push.
- Allowed actions: update loop-crafter rules and validation checks for the anti-expansion controls.
- Forbidden actions: release, tag, publication, installed-skill sync, runtime implementation beyond the rule update, or changing multi-agent governance.
- Validation: local validation passes and PM/Advisor agree no unresolved P0/P1 remains.
- Stop condition: when the completion predicate is satisfied, report completion and place any release, promotion, or broader governance work in Next Backlog.
- Next Backlog example:
  - item: Add richer examples for long-running implementation loops.
  - why it matters: examples can make the controls easier to apply later.
  - risk: low if docs-only, medium if it changes governance behavior.
  - needs owner authorization: yes, if it expands beyond this governance-refinement objective.
  - recommended priority: medium.

## V2 Scaffold Proposal

# Loop Scaffold Proposal

Loop name: `release-note-drafter`
Project scope: private repository documentation workflow
Readiness level: L1 now, L2 only after owner-approved scaffold writing
Scaffold target: project-local skill folder or `docs/loops/release-note-drafter.md`
Frozen objective: draft a reviewable release-note scaffold proposal only
Objective category: scaffold proposal
Startup gate-set snapshot: no writes without owner authorization; commit and push remain governed by current project gates
Completion predicate: proposal includes files, evidence, validation, state, human gates, and Next Backlog without writing files
Gate Repair Window: none; proposal revisions need owner direction unless the owner grants a bounded repair window
Declared File Scope: not applicable unless a Gate Repair Window is owner-authorized
repair-window opened: not applicable unless a Gate Repair Window is owner-authorized
repair-window expires: not applicable unless a Gate Repair Window is owner-authorized
repair-cycle cap: not applicable unless a Gate Repair Window is owner-authorized
wall-clock cap: not applicable unless a Gate Repair Window is owner-authorized
validation-only budget handling: not applicable unless a Gate Repair Window is owner-authorized
repair-window forbidden actions: no file writes, commit, push, release, publication, or installed-skill sync without the applicable owner and governance gates
fresh-review requirement: fresh validation and PM/Advisor review before any write or git exit

Proposed files:

- `docs/loops/release-note-drafter.md`: durable loop rules and owner gates.
- `docs/validation/release-note-drafter-validation.md`: validation harness design.

File content previews:

- Include only short draft sections for goal, trigger, evidence, boundaries, validation, and state.

Evidence allowlist:

- Git log, merged PR notes, existing changelog, release checklist, validation output.

Forbidden paths/actions:

- No tag, release publication, deployment, push, external posting, or credential access.

Validation harness:

- Rubric evaluator checks accuracy, omitted changes, unsupported claims, and owner decision needs.

State contract:

- No state file by default. Future `STATE.md` writing requires owner authorization.

Run-log contract:

- Recommend transcript capture under `docs/validation/transcripts/` if repeated.

Human gates:

- Owner must approve any write and any external publication.

Required governance:

- `multi-agent-working-group` controls PM/Advisor review and git exits.

write_authorization_needed: yes
write_authorization_status: not requested

validation_before_write:

- Confirm the exact proposed files and current dirty scope.
- Check proposed paths against denylisted and default-excluded domains.
- Run secret and copied-content checks and obtain required fresh review.

validation_after_write:

- Confirm only owner-approved files changed.
- Run the declared validation harness and secret/copy-content checks.
- Obtain fresh PM/Advisor review before any separately gated git exit.

Next Backlog:

- item: Turn the proposal into scaffold files.
- why it matters: files are needed only if the owner wants the loop installed in a project.
- risk: medium because writing files changes the repository.
- needs owner authorization: yes.
- recommended priority: owner-dependent.

Next owner decision:

- Approve scaffold writing, request revisions, or keep report-only.

## V2 Readiness Report

# Loop Readiness Report

Current level: L1 Report
Target level: L2 Assisted
Missing controls:

- Owner-approved scaffold target
- Post-write validation command
- State staleness rule

Denylist conflicts: none identified
Validation strength: rubric-based; deterministic verifier not available
State maturity: proposed only, not written
Observability: transcript capture recommended
Human gates: required before any file write, commit, push, or publication
Recommendation: revise before L2

## V2 Scaffold Write Packet

# Scaffold Write Packet

Write authorization: not granted
Files to create:

- `docs/loops/release-note-drafter.md`

Files to modify: none
Pre-write checks:

- `git status --short --branch`
- denylist check for target paths
- secret/copy-content scan over previews

Post-write checks:

- file exists
- required sections present
- secret/copy-content scan passes

Rollback plan:

- remove only the newly created scaffold file if validation fails before commit

Stop conditions:

- owner authorization missing
- denylist conflict
- failed validation
- unresolved P0/P1

PM/Advisor requirements:

- Required if the project governance layer requires them for writes or git exits.

Owner decision needed:

- Explicitly authorize scaffold file creation or keep this as a proposal only.
