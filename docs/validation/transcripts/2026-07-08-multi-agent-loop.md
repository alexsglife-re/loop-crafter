---
validation_date: 2026-07-08
runtime: codex-cli 0.142.4
command: codex exec --ephemeral --sandbox read-only -C <repo-root>
installed_skill: <codex-home>/skills/loop-crafter
prompt: Use loop-crafter to design a multi-agent loop that uses PM, Advisor, Worker, and Reviewer.
---

# Loop Design Package: PM / Advisor / Worker / Reviewer Multi-Agent Loop

## 1. Loop Name

`pm-advisor-worker-reviewer-loop`

## 2. Purpose

Design a bounded multi-agent workflow where:

- PM owns scope, sequencing, and gate decisions.
- Advisor independently challenges assumptions, risks, and completion claims.
- Worker performs the assigned bounded task.
- Reviewer checks the result against scope, quality, safety, and evidence.

This loop is design/review-first. It produces plans, findings, recommendations, and handoff-ready reports. It does not default to unattended automation, file mutation, commit, push, deployment, publication, scheduling, or background execution.

## 3. Loop Level

`L1: Report-only governed execution`

The loop may coordinate agents and produce structured outputs, but external actions remain gated and require explicit owner authorization when applicable.

## 4. Roles

### PM

Responsibilities:

- Restate the owner request.
- Define scope, non-goals, risks, and acceptance criteria.
- Assign bounded work to Worker.
- Request Advisor review before high-impact decisions.
- Decide whether the loop may proceed to the next phase.
- Prepare final owner-facing summary.

Authority:

- May approve internal loop progression.
- May not authorize default-excluded actions on behalf of the owner.

Required outputs:

- Scope brief.
- Work packet.
- Gate decision.
- Final loop report.

### Advisor

Responsibilities:

- Independently review PM scope and assumptions.
- Identify missing context, hidden risks, overreach, and unresolved ambiguity.
- Challenge whether the proposed work is necessary, bounded, and reversible.
- Review completion evidence before PM closes the loop.

Authority:

- May block progression with P0/P1 concerns.
- May recommend narrower scope or additional validation.
- May not perform the Worker task directly unless the loop is explicitly re-scoped.

Required outputs:

- Advisor assessment.
- Risk list.
- Gate recommendation: `proceed`, `proceed with constraints`, or `block`.

### Worker

Responsibilities:

- Execute only the task packet assigned by PM.
- Stay within scope and report blockers early.
- Preserve evidence of what was inspected, produced, or recommended.
- Avoid default-excluded actions unless explicitly authorized by the owner.

Authority:

- May perform bounded analysis, drafting, design, or local validation allowed by the task.
- May not expand scope, mutate files, commit, push, deploy, publish, or change credentials without authorization.

Required outputs:

- Work result.
- Evidence summary.
- Open issues.
- Self-check against acceptance criteria.

### Reviewer

Responsibilities:

- Review Worker output against PM scope and acceptance criteria.
- Check for overreach, missing evidence, unresolved risks, and quality issues.
- Confirm whether secret/copy-content checks are needed and satisfied.
- Recommend closeout, revision, or escalation.

Authority:

- May block closeout with P0/P1 findings.
- May request Worker revision.
- May not override PM/Advisor gate requirements.

Required outputs:

- Review findings ordered by severity.
- Acceptance result.
- Required fixes, if any.
- Residual risk statement.

## 5. Loop Phases

### Phase 0: Intake

Input:

- Owner request.
- Repository or project rules.
- Known constraints.
- Explicit prohibitions.

PM produces:

```markdown
## Scope Brief

Request:
Constraints:
Non-goals:
Default-excluded actions:
Acceptance criteria:
Required evidence:
Open questions:
```

Gate:

- If scope is unclear, PM asks the owner.
- If the task touches default-excluded actions, PM must stop unless the owner explicitly names the authorized action.

### Phase 1: PM Planning

PM creates a bounded Worker packet.

```markdown
## Worker Packet

Objective:
Allowed actions:
Disallowed actions:
Inputs:
Expected output:
Validation required:
Stop conditions:
```

Advisor reviews the packet before Worker starts.

Advisor checks:

- Is the task smaller than necessary?
- Are assumptions explicit?
- Are stop conditions clear?
- Are default-excluded actions blocked?
- Is validation proportional?

Gate:

- PM and Advisor must both agree before Worker begins.
- If Advisor blocks, PM revises scope or asks owner.

### Phase 2: Worker Execution

Worker performs the assigned task only.

Worker output format:

```markdown
## Worker Result

Completed work:
Evidence:
Acceptance check:
Issues found:
Unresolved questions:
Recommended next step:
```

Stop conditions:

- Scope becomes ambiguous.
- Required evidence is unavailable.
- A P0/P1 risk appears.
- A default-excluded action would be required.
- The task would require secret, credential, permission, deployment, publication, destructive, or irreversible action.

### Phase 3: Reviewer Check

Reviewer evaluates the Worker result.

Review format:

```markdown
## Reviewer Report

Findings:
- P0:
- P1:
- P2:
- P3:

Acceptance result:
Evidence quality:
Scope compliance:
Secret/copy-content check:
Residual risk:
Recommendation:
```

Severity definitions:

- `P0`: Must stop. Unsafe, unauthorized, destructive, or invalidates the task.
- `P1`: Must fix before closeout. Incorrect, incomplete, or materially risky.
- `P2`: Should fix if in scope.
- `P3`: Optional improvement.

Gate:

- No unresolved P0/P1 may remain before closeout.
- Reviewer may return the task to Worker once with a bounded revision request.
- If revision would expand scope, PM must re-plan and Advisor must re-check.

### Phase 4: PM + Advisor Closeout

PM compares:

- Original request.
- Worker result.
- Reviewer report.
- Advisor risk assessment.
- Acceptance criteria.

Advisor independently reviews closeout.

Closeout gate passes only when:

- PM agrees the work satisfies scope.
- Advisor independently agrees.
- Reviewer has no unresolved P0/P1.
- Required validation is fresh.
- Secret/copy-content checks pass where relevant.
- No default-excluded action has occurred without explicit owner authorization.

Final output:

```markdown
## Final Loop Report

Outcome:
Scope completed:
Validation:
Key decisions:
Residual risks:
Not performed:
Recommended next owner decision:
```

## 6. Default-Excluded Actions

The loop must not perform these by default:

- Force-push or history rewrite.
- Tag or release publication.
- Deployment or public publication.
- Credential, secret, security, permission, or authentication changes.
- Schema migration.
- Destructive operation.
- Irreversible external effect.
- Commit or push.
- Background runner or scheduled automation.
- Automatic code mutation outside explicit scope.

These require explicit owner authorization naming the action.

## 7. Decision Gates

### Start Gate

Required:

- PM scope brief exists.
- Advisor agrees scope is bounded.
- Owner constraints are preserved.

### Worker Gate

Required:

- PM work packet exists.
- Advisor approves or approves with constraints.
- Worker has clear stop conditions.

### Review Gate

Required:

- Worker result exists.
- Evidence is sufficient.
- Reviewer has checked acceptance criteria.

### Closeout Gate

Required:

- PM and Advisor independently agree.
- Reviewer has no unresolved P0/P1.
- Required validation is fresh.
- No prohibited action occurred.
- Final report clearly states completed work and residual risk.

## 8. Communication Protocol

Agent messages should be structured, short, and evidence-backed.

PM may ask:

```markdown
Advisor, review this scope for overreach, missing risks, and gate readiness.
```

PM may assign:

```markdown
Worker, complete only this packet. Stop if any stop condition appears.
```

Reviewer may return:

```markdown
Revision required: P1 finding remains. Worker should address only this issue.
```

Advisor may block:

```markdown
Block: scope requires owner authorization because it includes a default-excluded action.
```

## 9. Artifacts

Required artifacts:

- `Scope Brief`
- `Advisor Assessment`
- `Worker Packet`
- `Worker Result`
- `Reviewer Report`
- `Final Loop Report`

Optional artifacts:

- Risk register.
- Decision log.
- Handoff packet.
- Validation checklist.

## 10. Acceptance Criteria

The loop is successful when:

- The task remains bounded to the owner request.
- Each role produces its required output.
- PM and Advisor independently agree at start and closeout.
- Worker output is reviewed before finalization.
- Reviewer findings are resolved or explicitly carried as residual risk.
- No P0/P1 remains unresolved.
- No default-excluded action occurs without explicit owner authorization.
- Final output distinguishes completed work, non-goals, and recommended next decisions.

## 11. Failure Modes

Stop and escalate to owner when:

- PM and Advisor disagree on safety or scope.
- Required validation cannot be performed.
- Worker needs to exceed the assigned packet.
- Reviewer finds unresolved P0/P1.
- The task requires credentials, permissions, deployment, publication, destructive action, commit, push, or irreversible external effects.
- The loop risks becoming unattended automation instead of report-only governed work.

## 12. Minimal Run Template

```markdown
# Multi-Agent Loop Run

## Owner Request

## Constraints

## PM Scope Brief

## Advisor Assessment

## PM Worker Packet

## Worker Result

## Reviewer Report

## PM Closeout

## Advisor Closeout Check

## Final Loop Report
```

## 13. Recommended Default Policy

Use this loop as the default for project-specific agent work where quality and governance matter.

Default behavior:

- Design first.
- Review before action.
- Worker stays bounded.
- Reviewer checks evidence.
- PM and Advisor both gate closeout.
- External effects require explicit owner authorization.
