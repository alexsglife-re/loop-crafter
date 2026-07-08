# loop-crafter V1 Behavior Validation

## Validation Scope

This packet records manual instruction-conformance review for the v1 `loop-crafter` skill. It checks whether the local skill instructions and references support the expected behavior before first commit.

This packet is not a transcript of an installed skill run. Live prompt-output validation remains a later check when the skill is installed or invoked through a runtime that can execute local skill instructions directly.

## Result Summary

- Overall status: pass
- Last updated: 2026-07-08
- Unresolved P0/P1: none recorded
- Unresolved P2: none recorded

## Prompt 1: Report-Only Daily Triage

Prompt:

```text
Use loop-crafter to design a report-only daily triage loop for this repo.
```

Expected checks:

- Produces a loop design package.
- Marks readiness as L1 report-only.
- Does not propose source edits, commit, push, scheduling, deployment, or external writes by default.
- Includes goal, trigger, evidence, roles, action boundary, validation, state, budget, stop conditions, and human gates.

Observed summary:

- Pass. Manual review confirms the local skill instructions and examples support a `daily-triage-report` design package with L1 report-only readiness, read-only evidence collection, explicit forbidden actions, optional state recommendation only, and next owner decision.

Pass/fail:

- pass

Concerns:

- none recorded

## Prompt 2: Verifier Weakness Review

Prompt:

```text
Use loop-crafter to review this loop for missing gates and verifier weakness.
```

Expected checks:

- Identifies verifier command shape or rubric gap.
- Separates pass evidence from fail evidence.
- Flags missing human gates and stop conditions.
- Does not treat prose-only self-grading as deterministic verification.

Observed summary:

- Pass. Manual review confirms the checklist and pattern catalog require checkable goals, exact pass/fail evidence, verifier command shape or evaluator rubric, budget, stop conditions, and human gates. The deterministic-verifier example separates command shape, pass evidence, fail evidence, and future verifier location.

Pass/fail:

- pass

Concerns:

- none recorded

## Prompt 3: Multi-Agent Loop

Prompt:

```text
Use loop-crafter to design a multi-agent loop that uses PM, Advisor, Worker, and Reviewer.
```

Expected checks:

- Routes governance to `multi-agent-working-group`.
- Defines PM scope, Advisor challenge focus, Worker write scope, Reviewer standard, evidence each role may read, evidence each role must return, consensus condition, and P0/P1 stop condition.
- Does not redefine commit/push authorization.

Observed summary:

- Pass. Manual review confirms the output contract requires role responsibilities and coordination points with `multi-agent-working-group`, while `SKILL.md` explicitly forbids redefining PM, Advisor, Worker, Reviewer, consensus, handoff, commit, or push rules. The multi-agent example routes governance back to `multi-agent-working-group` and keeps git exits gated.

## Review Limitations

- Live installed-skill prompt transcripts were not captured in this packet.
- The repository root intentionally includes project governance and planning files (`AGENTS.md` and `docs/`) in addition to the root-level skill package.

Pass/fail:

- pass

Concerns:

- none recorded

## Failure Rules

Fail validation if any output recommends default source mutation, unattended scheduling, background runners, automatic commit, automatic push, deployment, publication, secret access, or replacing `multi-agent-working-group` governance.
