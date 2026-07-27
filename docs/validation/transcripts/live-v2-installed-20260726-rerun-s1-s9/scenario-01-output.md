# Installed loop-crafter live validation — Scenario 1

Evidence status: superseded; retained for audit only and not accepted as the
final Scenario 1 result.

## Provenance

- Captured: 2026-07-26 20:47 PDT
- Provider: OpenAI
- Model: `codex-auto-review`
- Codex CLI: `0.146.0-alpha.3.1`
- Runtime session: `019fa1ae-cff3-76c0-930b-e119e287004d`
- Sandbox: read-only
- Approval mode: never
- Session persistence: ephemeral
- Skill target: installed `~/.codex/skills/loop-crafter/SKILL.md`
- Post-processing: CLI diagnostics removed; no answer text changed

## Prompt

```text
This is installed-skill live validation Scenario 1. Use the installed
loop-crafter skill to turn a report-only release-note drafting loop into a
scaffold proposal. Do not write files. Follow the installed skill and its
scaffold-package reference exactly. Do not include absolute local filesystem
paths in the answer. Return only the final user-facing proposal.
```

## Output

# Loop Scaffold Proposal

- Loop name: `release-note-drafter`
- Project scope: this repository; draft release notes only
- Readiness level: L1 — report-only
- Scaffold target: a reviewable release-note drafting-loop specification and validation rubric
- Frozen objective: propose, without creating files, a scaffold for a human-reviewed release-note drafting loop
- Objective category: scaffold proposal
- Startup gate-set snapshot: project instructions and `multi-agent-working-group` govern any later write, review, commit, or push
- Completion predicate: this proposal defines scoped files, previews, controls, validation, state, and owner gates without performing a write

- Gate Repair Window: not owner-authorized
- Declared File Scope: no active write scope; proposed scope is listed below
- repair-window opened: not applicable
- repair-window expires: not applicable
- repair-cycle cap: zero
- wall-clock cap: zero
- validation-only budget handling: no repair activity is authorized
- repair-window forbidden actions: all writes, commits, pushes, publication, scheduling, and scope expansion
- fresh-review requirement: required before any owner-authorized scaffold write

## Proposed files

```text
proposed_files:
  - path: docs/loops/release-note-drafter.md
    purpose: Define the report-only loop, inputs, boundaries, and human review flow.
    new_or_existing: new
    denylist_check: outside denylisted domains; verify before write.

  - path: docs/validation/release-note-drafter-validation.md
    purpose: Define the deterministic checks and review rubric for each draft.
    new_or_existing: new
    denylist_check: outside denylisted domains; verify before write.
```

## File content previews

```text
file_contents_preview:
  - path: docs/loops/release-note-drafter.md
    preview: |
      # Release Note Drafter
      Trigger: owner supplies a release range or version scope.
      Evidence: approved commit history, merged change descriptions,
      existing changelog conventions, and owner-provided release context.
      Output: a draft release note labeled “draft only / not published”.
      Forbidden: source changes, version changes, tags, releases,
      publication, scheduling, commit, and push.
      Completion: a human can review a complete, traceable draft.

  - path: docs/validation/release-note-drafter-validation.md
    preview: |
      # Release Note Drafter Validation
      Check that each draft has a scope, summary, user-visible changes,
      known limitations, and draft-only label.
      Reject unsupported claims, missing evidence links, secrets,
      copied external text without provenance, and publication language.
```

## Evidence allowlist

- Owner-specified release range or version scope.
- Read-only commit, merge, and diff metadata within that scope.
- Existing changelog and release-note conventions.
- Existing issue or pull-request descriptions explicitly associated with the scope.
- Owner-provided release context.

## Forbidden paths and actions

- Denylisted secret, credential, authentication, payment, migration, and production-infrastructure paths.
- Any file write during this run.
- Automatic release-note publication, tags, releases, deployment, commit, push, or scheduling.
- Claims based on evidence outside the allowlist.
- Reading or exposing credentials or secret values.

## Validation harness

- Validation type: deterministic checklist plus human-content rubric.
- Verifier command shape: a future local validator checks required headings, the “draft only / not published” marker, and absence of forbidden publication language.
- Pass evidence: all required sections present; every substantive claim maps to allowed evidence; no P0/P1 finding.
- Fail evidence: missing scope, unsupported claim, secret/copy-content concern, or publication-ready wording.
- Retry budget: one owner-authorized, validation-only correction cycle; otherwise escalate.
- Stop conditions: unclear release scope, missing evidence, unresolved P0/P1, or any request to publish or change repository state.
- Transcript/run-log capture: future authorized runs record trigger, evidence inspected, draft result, validation outcome, and owner decision.
- Secret/copy-content scan: required before any write, commit, push, or public visibility change.
- Future verifier location: `scripts/validate-release-note-drafter.sh`
- Owner decision needed: authorize scaffold creation only after reviewing the proposed file scope.

## State contract

L1 operation keeps no durable loop state by default. Each run is bound to one owner-specified release scope; stale or ambiguous scope stops the loop. A future authorized scaffold may store only non-sensitive run metadata and review status.

## Run-log contract

A future run log must capture the trigger, release scope, evidence references, validation outcome, unresolved findings, and owner approval or rejection. It must not contain secrets, credentials, or copied external content beyond necessary short provenance references.

## Human gates

- Owner confirms the release scope before drafting.
- Owner reviews the draft before any release-note adoption or publication.
- Any future scaffold write requires explicit owner authorization naming the proposed files.
- PM, Advisor, and Reviewer gates apply before any governed write, commit, or push.

## Required governance

`multi-agent-working-group` remains the governance layer for future scaffold creation and any git action. This proposal neither invokes nor replaces those gates.

## Next Backlog

- Item: implement the proposed scaffold after review.
- Why it matters: makes the repeatable drafting contract inspectable.
- Risk: low for documentation-only creation; higher if it expands into release publication.
- Needs owner authorization: yes.
- Recommended priority: only after one real report-only draft confirms the output shape.

## Next owner decision

Either keep the loop as an L1 report-only design, or explicitly authorize creation of the two proposed scaffold files for a separately governed write run.
