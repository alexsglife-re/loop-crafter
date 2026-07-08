# loop-crafter V1 Behavior Validation

## Validation Scope

This packet records manual instruction-conformance review for the v1 `loop-crafter` skill. It checks whether the local skill instructions and references support the expected behavior before first commit.

This packet originally recorded manual instruction-conformance review before first commit. It now also includes live prompt-output validation from an installed local skill run.

## Result Summary

- Overall status: pass
- Last updated: 2026-07-08
- Unresolved P0/P1: none recorded
- Unresolved P2: none recorded
- Installed skill path: `/Users/alex/.codex/skills/loop-crafter`
- Runtime: `codex-cli 0.142.4`
- Runtime mode: `codex exec --ephemeral --sandbox read-only`

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

- Pass. Manual review confirmed the local skill instructions and examples support a `daily-triage-report` design package with L1 report-only readiness, read-only evidence collection, explicit forbidden actions, optional state recommendation only, and next owner decision.
- Live transcript pass. Codex CLI returned a `daily-report-only-triage` loop design package with `L1 report loop`, human-invoked operation, allowed read/report actions, forbidden writes/commits/pushes/deployments/publication/background jobs, acceptance criteria, and stop conditions.
- Transcript: `docs/validation/transcripts/2026-07-08-report-only-daily-triage.md`

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

- Pass. Manual review confirmed the checklist and pattern catalog require checkable goals, exact pass/fail evidence, verifier command shape or evaluator rubric, budget, stop conditions, and human gates. The deterministic-verifier example separates command shape, pass evidence, fail evidence, and future verifier location.
- Live transcript pass. Codex CLI rejected the sample loop as unsafe, identified missing trigger/evidence/risk/write/human approval/validation/git/state/stop/budget gates, explicitly called out subjective self-judgment as verifier weakness, and recommended downgrading to an L1 report-only loop.
- Transcript: `docs/validation/transcripts/2026-07-08-verifier-weakness-review.md`

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

- Pass. Manual review confirmed the output contract requires role responsibilities and coordination points with `multi-agent-working-group`, while `SKILL.md` explicitly forbids redefining PM, Advisor, Worker, Reviewer, consensus, handoff, commit, or push rules. The multi-agent example routes governance back to `multi-agent-working-group` and keeps git exits gated.
- Live transcript pass. Codex CLI returned a PM/Advisor/Worker/Reviewer loop design package with bounded role responsibilities, start/worker/review/closeout gates, no unresolved P0/P1 closeout, explicit default-excluded actions, and no default commit/push/deployment/publication/background automation.
- Transcript: `docs/validation/transcripts/2026-07-08-multi-agent-loop.md`

Pass/fail:

- pass

Concerns:

- none recorded

## Review Limitations

- The repository root intentionally includes project governance and planning files (`AGENTS.md` and `docs/`) in addition to the root-level skill package.
- The live transcript runs were read-only. They validated prompt-output behavior but did not perform file mutation, git actions, deployment, publication, or background automation.
- Codex CLI emitted unrelated local loader warnings for other installed plugins/skills and a shutdown warning that GitHub MCP lacked `GITHUB_PAT_TOKEN`. These did not affect the local `loop-crafter` prompt-output validation because the runs used installed skill files and read-only local context.

## Failure Rules

Fail validation if any output recommends default source mutation, unattended scheduling, background runners, automatic commit, automatic push, deployment, publication, secret access, or replacing `multi-agent-working-group` governance.
