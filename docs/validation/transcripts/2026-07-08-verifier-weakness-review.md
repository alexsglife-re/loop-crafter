---
validation_date: 2026-07-08
runtime: codex-cli 0.142.4
command: codex exec --ephemeral --sandbox read-only -C <repo-root>
installed_skill: <codex-home>/skills/loop-crafter
prompt: Use loop-crafter to review this loop for missing gates and verifier weakness.
---

**Loop Review**

Verdict: this loop is not safe as written. It jumps from vague health checking directly into autonomous fixes, with no objective verifier, no scope boundary, and no human gate before mutation.

**Missing Gates**

- Trigger gate: “every morning” needs an explicit schedule owner, timezone, skip conditions, and manual disable path.
- Evidence gate: “recent files” is too broad. It must define allowed paths, excluded paths, lookback window, and whether logs/tests/git state may be read.
- Risk gate: before any fix, classify whether the issue touches secrets, auth, permissions, migrations, billing, deployment, generated files, or production config.
- Write gate: “writes fixes when needed” should be forbidden for V1/L1. At most, the loop should produce a report and proposed patch plan.
- Human approval gate: any source mutation should require owner approval, or PM/Advisor agreement if using the project governance workflow.
- Validation gate: fixes must not be marked complete unless exact validation commands/checks pass.
- Git gate: commit/push must remain outside the loop unless separately authorized and approved through project rules.
- State gate: “records done” needs a defined state file/location, stale-state detection, and rules for recording blocked/failed/partial runs.
- Stop gate: the loop must stop on missing evidence, failed validation, unclear scope, unresolved P0/P1, high-risk files, context pressure, or repeated failures.
- Budget gate: needs max runtime, max files inspected, max proposed changes, retry limit, and cost/context ceiling.

**Verifier Weaknesses**

- “Asks itself whether things look okay” is not a verifier. It is subjective self-judgment.
- No checkable health predicate exists. “Okay” must become concrete checks such as tests pass, docs unchanged, no failing CI, no unresolved TODO class, no stale spec, no broken links, etc.
- No independent review exists. The same actor detects, changes, and approves completion.
- No baseline comparison exists, so the loop may confuse normal drift with failure.
- No pass/fail evidence is required before recording done.
- No regression check exists after a fix.
- No secret/copy-content check exists before writing or reporting.
- No diff review exists before mutation.
- No failure trail exists for “looked okay but was wrong.”
- No mechanism prevents the loop from repeatedly touching the same area or hiding unfinished work behind “done.”

**Required Correction**

Downgrade this to an L1 report-only morning health loop:

- It may read only defined project evidence.
- It may produce a health report with findings, severity, evidence, and recommended next actions.
- It must not write fixes automatically.
- It must record “done” only for report generation, not project health.
- Any fix moves to a separate owner-approved task with fresh validation and applicable PM/Advisor gates.
