# Validation Harness

Use this reference when designing validation for a loop or scaffold package.

A validation harness is a design output by default. It does not create a runner, schedule jobs, or execute unattended automation unless a later owner-authorized implementation explicitly adds that behavior.

## Deterministic Verifier

Use a command-shape verifier when success can be checked mechanically.

Include:

- Command shape
- Working directory
- Inputs read
- Expected exit code
- Expected output or no-output condition
- Pass evidence
- Fail evidence
- Retry budget
- Stop conditions

Example:

```text
verifier_command_shape: ./scripts/validate-local.sh
pass_evidence: exit code 0 and no P0/P1 findings
fail_evidence: non-zero exit code plus captured failing check
retry_budget: one repair cycle before escalation
```

## Rubric Evaluator

Use a rubric when success requires judgment.

Include:

- Rubric dimensions
- Severity scale
- Required independence, if any
- Evidence the evaluator must inspect
- Pass threshold
- Fail threshold
- Required objections or counterexamples

Rubric output should classify findings as P0/P1/P2 when the governing workflow uses that severity model.

## Transcript And Run-Log Capture

Recommend transcript or run-log capture when the loop will be repeated.

Capture:

- Prompt or trigger
- Evidence inspected
- Decisions made
- Validation command or rubric result
- Stop conditions reached
- Owner decisions
- PM/Advisor/Reviewer results when applicable

Do not write run logs by default during design output. Identify where future logs would live if state writing is authorized.

## Secret And Copy-Content Scan

Every scaffold or validation design should identify whether a future write requires:

- Secret pattern scan
- Credential/key/path denylist scan
- Copy-content review for large copied external material
- Local path provenance review before public visibility changes

Suspected secrets block writing, commit, push, sync, publication, and any other outward movement until resolved.

## Harness Output

Use this shape:

```text
# Validation Harness Design

Validation type:
Verifier command shape:
Rubric:
Pass evidence:
Fail evidence:
Retry budget:
Stop conditions:
Transcript/run-log capture:
Secret/copy-content scan:
Future verifier location:
Owner decision needed:
```
