# loop-crafter V2 Requirements Completion Loop

> **For agentic workers:** REQUIRED SUB-SKILL: Use `superpowers:subagent-driven-development` (recommended) or `superpowers:executing-plans` to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Complete, review, and validate the V2 requirements package for `loop-crafter` as version `v0.1.1`; enter commit/push only if the owner separately requests a git exit and the project gate passes.

**Architecture:** This loop is a requirements-completion loop, not the V2 implementation loop. It refines `docs/loop-crafter-v2-requirements.md`, captures review and validation evidence, and stops before implementing V2 skill behavior unless the owner starts a new implementation goal.

**Tech Stack:** Markdown, shell validation commands, Git, Codex skills, `loop-crafter`, `multi-agent-working-group`.

---

## Implementation Loop

Run this plan sequentially until the V2 requirements package is complete:

```text
while v2_requirements_not_complete:
  1. Select the next unchecked milestone.
  2. Read the files named by that milestone.
  3. Make only the scoped documentation edits for that milestone.
  4. Run the listed validation commands.
  5. Record review findings and revisions.
  6. Stop on failed validation, unresolved P0/P1, missing PM/Advisor evidence, owner decision, or any default-excluded action.
```

Do not enter V2 implementation tasks from this loop. V2 implementation starts only after the V2 requirements package is accepted.

## Version Contract

- Completed V1 baseline version: `v0.1.0`.
- Completed V2 requirements version: `v0.1.1`.
- `v0.1.1` means the V2 requirements package is complete, reviewed, validated, and accepted.
- `v0.1.1` does not mean V2 scaffold/readiness/validation behavior is implemented.
- Git tags or release publication are default-excluded and require explicit owner authorization naming the tag or release action.

## File Structure

Create or maintain these files:

- `docs/loop-crafter-v2-requirements.md`: V2 requirements source of truth.
- `docs/superpowers/plans/2026-07-08-loop-crafter-v2-requirements-completion.md`: this requirements-completion loop.
- `docs/validation/loop-crafter-v2-requirements-review.md`: review, validation, and acceptance evidence for `v0.1.1`.

Do not create or modify V2 implementation files in this loop:

- `SKILL.md`
- `references/scaffold-package.md`
- `references/readiness-model.md`
- `references/validation-harness.md`
- `references/examples.md`
- installed skill files under `<codex-home>/skills/loop-crafter/`

## Global Gate Rules

Apply these rules to every milestone:

- Use `multi-agent-working-group` as the governance layer.
- Use `loop-crafter` as the loop-design layer.
- Keep this loop documentation-only unless the owner explicitly starts V2 implementation.
- Do not read or expose secrets, tokens, credentials, browser data, or key material.
- Do not run unattended automation, background schedulers, deployment, publication, tag/release creation, force-push, history rewrite, schema migration, auth/security/permission change, destructive command, or irreversible external effect.
- Normal commit/push may proceed only when the owner has requested a git exit for this workstream, PM and Advisor independently agree, validation is fresh, scope is clear, no unresolved P0/P1 remains, and secret/copy-content scans pass.

---

## Milestone 0: Baseline And Version Alignment

**Files:**

- Read: `AGENTS.md`
- Read: `SKILL.md`
- Read: `references/safety-and-gates.md`
- Read: `docs/loop-crafter-v2-requirements.md`
- Modify: `docs/loop-crafter-v2-requirements.md`

- [ ] **Step 1: Confirm working tree and branch**

Run:

```bash
git status --short --branch
```

Expected:

```text
## master...origin/master
?? docs/loop-crafter-v2-requirements.md
?? docs/superpowers/plans/2026-07-08-loop-crafter-v2-requirements-completion.md
```

If other files are present, classify them before editing. Do not overwrite unrelated user changes.

- [ ] **Step 2: Confirm version language exists**

Run:

```bash
rg -n "v0\\.1\\.0|v0\\.1\\.1|Version Management|release publication" docs/loop-crafter-v2-requirements.md
```

Expected: output includes `v0.1.0`, `v0.1.1`, and a note that tags or release publication remain default-excluded.

- [ ] **Step 3: Fix version language if missing**

If Step 2 fails, add this section after `## Selected Direction`:

```markdown
## Version Management

- Completed V1 baseline version: `v0.1.0`.
- Completed V2 requirements version: `v0.1.1`.
- `v0.1.1` means the V2 requirements package has been reviewed, revised, validated, and accepted. It does not mean V2 implementation is complete.
- Tags or release publication remain default-excluded and require explicit owner authorization naming the tag or release action.
```

- [ ] **Step 4: Validate milestone**

Run:

```bash
rg -n "v0\\.1\\.0|v0\\.1\\.1|Version Management|release publication" docs/loop-crafter-v2-requirements.md
```

Expected: version language is present and unambiguous.

## Milestone 1: Requirements Completeness Review

**Files:**

- Read: `docs/loop-crafter-v2-requirements.md`
- Modify: `docs/loop-crafter-v2-requirements.md`

- [ ] **Step 1: Check required V2 sections**

Run:

```bash
rg -n "^## (Purpose|Selected Direction|Version Management|Goals|Non-Goals|V2 User-Facing Capabilities|Proposed V2 Outputs|Safety Requirements|Implementation Targets|Proposed V2 Milestones|V2 Requirements Decisions|Recommended V2 Scope)" docs/loop-crafter-v2-requirements.md
```

Expected: all listed sections appear.

- [ ] **Step 2: Check selected reference direction**

Run:

```bash
rg -n "AaronLPS/loop-builder|cobusgreyling/loop-engineering|scaffold flow|readiness|denylist" docs/loop-crafter-v2-requirements.md
```

Expected: V2 names `AaronLPS/loop-builder` as the scaffold mainline and `cobusgreyling/loop-engineering` as the readiness plus denylist safety model.

- [ ] **Step 3: Check capability coverage**

Run:

```bash
rg -n "Scaffold Package Design|Seven-Decision Interview|Readiness And Risk Report|Validation Harness Design|State And Run-Log Contract|Scaffold Write Gate|Governance Handoff" docs/loop-crafter-v2-requirements.md
```

Expected: all seven capabilities appear.

- [ ] **Step 4: Revise missing requirements**

If any check fails, update `docs/loop-crafter-v2-requirements.md` so the missing section or capability is explicit. Keep the document English-only.

- [ ] **Step 5: Re-run completeness checks**

Run the commands from Steps 1, 2, and 3 again.

Expected: all checks pass.

## Milestone 2: Safety And Scope Review

**Files:**

- Read: `AGENTS.md`
- Read: `references/safety-and-gates.md`
- Read: `docs/loop-crafter-v2-requirements.md`
- Modify: `docs/loop-crafter-v2-requirements.md`

- [ ] **Step 1: Check forbidden automation boundaries**

Run:

```bash
rg -n "unattended|background runners|Schedulers|Automatic commit|Automatic modification|Secret, credential|default-excluded|owner explicitly" docs/loop-crafter-v2-requirements.md
```

Expected: V2 excludes unattended automation, background runners, automatic git exits, automatic source mutation, secrets, and default-excluded actions.

- [ ] **Step 2: Check governance separation**

Run:

```bash
rg -n "Execution governance remains delegated|multi-agent-working-group controls|V2 must not redefine" docs/loop-crafter-v2-requirements.md
```

Expected: output proves `loop-crafter` remains the design layer and `multi-agent-working-group` remains the governance layer.

- [ ] **Step 3: Check denylist coverage**

Run:

```bash
rg -n "\\.env|secrets|credentials|_key|_secret|auth/|payments/|billing/|migrations|production infrastructure" docs/loop-crafter-v2-requirements.md
```

Expected: all denylist categories appear.

- [ ] **Step 4: Revise unsafe or ambiguous wording**

If wording suggests silent writes, silent execution, automatic commits, automatic push, tag/release publication, deployment, or security/auth/permission changes, revise it to require explicit owner authorization plus the applicable project gates.

- [ ] **Step 5: Re-run safety checks**

Run the commands from Steps 1, 2, and 3 again.

Expected: all checks pass and no unsafe ambiguity remains.

## Milestone 3: Open Decisions Closure

**Files:**

- Read: `docs/loop-crafter-v2-requirements.md`
- Modify: `docs/loop-crafter-v2-requirements.md`

- [ ] **Step 1: Review open decisions**

Run:

```bash
sed -n '/^## Open Decisions/,$p' docs/loop-crafter-v2-requirements.md
```

Expected: open decisions are visible and understandable.

- [ ] **Step 2: Apply recommended defaults unless owner overrides**

Use these defaults for `v0.1.1` requirements completion:

```text
1. V2 includes scaffold proposals by default; owner-authorized scaffold file writing may be designed but is not default behavior.
2. V2 keeps validation scriptless and transcript-based at the requirements stage.
3. Installed-skill sync is separate, requires a later owner-authorized action, and happens only after reviewed V2 implementation, not after requirements completion.
4. Local path provenance should be scrubbed before any future public visibility change.
```

- [ ] **Step 3: Replace open decisions with decided scope**

Replace `## Open Decisions` with:

```markdown
## V2 Requirements Decisions

1. V2 includes scaffold proposals by default. Owner-authorized scaffold file writing may be described as a gated path, but writing is not default behavior.
2. V2 keeps validation scriptless and transcript-based at the requirements stage.
3. Installed-skill sync remains separate, requires a later owner-authorized action, and should happen only after reviewed V2 implementation.
4. Local path provenance should be scrubbed from future transcript files before any public visibility change.
```

- [ ] **Step 4: Validate decisions are closed**

Run:

```bash
rg -n "Open Decisions|Should V2|\\?" docs/loop-crafter-v2-requirements.md || true
```

Expected: no output, unless a literal question mark appears in quoted example content. If output appears, review it and remove unresolved decision language.

## Milestone 4: Review Evidence Packet

**Files:**

- Create: `docs/validation/loop-crafter-v2-requirements-review.md`
- Read: `docs/loop-crafter-v2-requirements.md`

- [ ] **Step 1: Create review evidence file**

Create `docs/validation/loop-crafter-v2-requirements-review.md`:

```markdown
# loop-crafter V2 Requirements Review

## Version

- Completed V1 baseline: `v0.1.0`
- V2 requirements completion target: `v0.1.1`
- Scope: requirements package only, not V2 implementation

## Review Scope

- Requirements source: `docs/loop-crafter-v2-requirements.md`
- Completion loop: `docs/superpowers/plans/2026-07-08-loop-crafter-v2-requirements-completion.md`
- Governance: `AGENTS.md` and `multi-agent-working-group`

## Validation Commands

```bash
git status --short --branch
test -f docs/validation/loop-crafter-v2-requirements-review.md
rg -n "v0\\.1\\.0|v0\\.1\\.1|Version Management|release publication" docs/loop-crafter-v2-requirements.md
rg -n "^## (Purpose|Selected Direction|Version Management|Goals|Non-Goals|V2 User-Facing Capabilities|Proposed V2 Outputs|Safety Requirements|Implementation Targets|Proposed V2 Milestones|V2 Requirements Decisions|Recommended V2 Scope)" docs/loop-crafter-v2-requirements.md
rg -n "AaronLPS/loop-builder|cobusgreyling/loop-engineering|readiness|denylist|scaffold" docs/loop-crafter-v2-requirements.md
rg -n "Open Decisions|Should V2|\\?" docs/loop-crafter-v2-requirements.md || true
awk '
  FILENAME ~ /loop-crafter-v2-requirements-review\\.md$/ && /^```/ { in_code = !in_code; next }
  !in_code && /T(BD|ODO)|FIXME|fill in|implement later|not-run/ { print FILENAME ":" FNR ":" $0 }
' docs/loop-crafter-v2-requirements.md docs/validation/loop-crafter-v2-requirements-review.md
awk '
  FILENAME ~ /loop-crafter-v2-requirements-review\\.md$/ && /^```/ { in_code = !in_code; next }
  !in_code && /sk-[A-Za-z0-9]|(OPENAI_API_KEY|ANTHROPIC_API_KEY|GITHUB_PAT_TOKEN)=|BEGIN (RSA|OPENSSH|PRIVATE) KEY|password[[:space:]]*=/ { print FILENAME ":" FNR ":" $0 }
' docs/loop-crafter-v2-requirements.md docs/validation/loop-crafter-v2-requirements-review.md
awk '
  /^## PM Review$/ || /^## Advisor Review$/ { in_review = 1; next }
  /^## / { in_review = 0 }
  in_review && /^Status: pending\\.$/ { print FILENAME ":" FNR ":" $0 }
' docs/validation/loop-crafter-v2-requirements-review.md
```

Any `test` failure or `rg` missing-file error is a validation failure, even when a command uses `|| true` to allow intentional no-match scans.

## PM Review

Status: pending.

## Advisor Review

Status: pending.

## Acceptance

`v0.1.1` is accepted only when:

- The owner accepts the V2 requirements scope.
- PM and Advisor find no unresolved P0/P1.
- Validation commands pass.
- No secrets are present in the diff.
- Git status and commit/push target are clear if a git exit is requested.
```

- [ ] **Step 2: Validate review evidence file exists**

Run:

```bash
test -f docs/validation/loop-crafter-v2-requirements-review.md && sed -n '1,120p' docs/validation/loop-crafter-v2-requirements-review.md
```

Expected: the file prints with version, scope, validation commands, PM Review, Advisor Review, and Acceptance sections.

## Milestone 5: PM And Advisor Review

**Files:**

- Read: `docs/loop-crafter-v2-requirements.md`
- Read: `docs/superpowers/plans/2026-07-08-loop-crafter-v2-requirements-completion.md`
- Read: `docs/validation/loop-crafter-v2-requirements-review.md`
- Modify: `docs/loop-crafter-v2-requirements.md` if review finds issues
- Modify: `docs/validation/loop-crafter-v2-requirements-review.md`

- [ ] **Step 1: PM review**

Ask PM to review:

```text
Review the V2 requirements package for scope clarity, missing acceptance criteria, unsafe defaults, version semantics, and whether it is ready to be accepted as v0.1.1. Classify findings as P0/P1/P2 and recommend next action.
```

Expected: PM returns no unresolved P0/P1 before acceptance.

- [ ] **Step 2: Advisor review**

Ask Advisor to review independently:

```text
Review the V2 requirements package independently. Focus on whether the AaronLPS scaffold mainline and cobusgreyling readiness/denylist safety model are represented clearly, whether v0.1.1 is correctly limited to requirements completion, and whether any wording accidentally authorizes implementation, git tags, release publication, deployment, or unattended execution. Classify findings as P0/P1/P2 and recommend next action.
```

Expected: Advisor returns no unresolved P0/P1 before acceptance.

- [ ] **Step 3: Apply required fixes**

If PM or Advisor reports P0/P1, revise the affected documents and repeat Steps 1 and 2.

- [ ] **Step 4: Record review results**

Update `docs/validation/loop-crafter-v2-requirements-review.md`:

```markdown
## PM Review

Status: pass.
Findings: no unresolved P0/P1.

## Advisor Review

Status: pass.
Findings: no unresolved P0/P1.
```

If P2 findings remain, list them under a `## Remaining P2 Notes` section.

## Milestone 6: Final Validation And Optional Git Exit

**Files:**

- Read: all changed files
- Modify: none unless validation finds a documentation defect

- [ ] **Step 1: Run final validation**

Run:

```bash
git status --short --branch
test -f docs/validation/loop-crafter-v2-requirements-review.md
rg -n "v0\\.1\\.0|v0\\.1\\.1|Version Management|release publication" docs/loop-crafter-v2-requirements.md
rg -n "^## (Purpose|Selected Direction|Version Management|Goals|Non-Goals|V2 User-Facing Capabilities|Proposed V2 Outputs|Safety Requirements|Implementation Targets|Proposed V2 Milestones|V2 Requirements Decisions|Recommended V2 Scope)" docs/loop-crafter-v2-requirements.md
rg -n "Open Decisions|Should V2|\\?" docs/loop-crafter-v2-requirements.md || true
awk '
  FILENAME ~ /loop-crafter-v2-requirements-review\\.md$/ && /^```/ { in_code = !in_code; next }
  !in_code && /T(BD|ODO)|FIXME|fill in|implement later|not-run/ { print FILENAME ":" FNR ":" $0 }
' docs/loop-crafter-v2-requirements.md docs/validation/loop-crafter-v2-requirements-review.md
awk '
  FILENAME ~ /loop-crafter-v2-requirements-review\\.md$/ && /^```/ { in_code = !in_code; next }
  !in_code && /sk-[A-Za-z0-9]|(OPENAI_API_KEY|ANTHROPIC_API_KEY|GITHUB_PAT_TOKEN)=|BEGIN (RSA|OPENSSH|PRIVATE) KEY|password[[:space:]]*=/ { print FILENAME ":" FNR ":" $0 }
' docs/loop-crafter-v2-requirements.md docs/validation/loop-crafter-v2-requirements-review.md
awk '
  /^## PM Review$/ || /^## Advisor Review$/ { in_review = 1; next }
  /^## / { in_review = 0 }
  in_review && /^Status: pending\\.$/ { print FILENAME ":" FNR ":" $0 }
' docs/validation/loop-crafter-v2-requirements-review.md
```

Expected:

- Git status shows only the expected V2 requirements files.
- Version checks include `v0.1.0` and `v0.1.1`.
- Section checks pass.
- Unresolved-question scan has no relevant output.
- Placeholder scan has no output.
- Secret-pattern scan has no output.
- Pending-status scan has no output from the `PM Review` or `Advisor Review` sections.
- Any missing-file error is a validation failure.

- [ ] **Step 2: Prepare commit only if gate passes**

If the owner wants a git exit and PM/Advisor gate passes, stage only the V2 requirements files:

```bash
git add docs/loop-crafter-v2-requirements.md docs/superpowers/plans/2026-07-08-loop-crafter-v2-requirements-completion.md docs/validation/loop-crafter-v2-requirements-review.md
git diff --cached --stat
git diff --cached --check
```

Expected: only scoped documentation files are staged and `git diff --cached --check` reports no whitespace errors.

- [ ] **Step 3: Commit only if gate passes**

Use a deep handover commit body:

```bash
git commit -m "docs: define loop-crafter v2 requirements" -m "核心变动
- Define v0.1.1 as the completed V2 requirements package.
- Add a gated completion loop for requirements review, validation, and acceptance.
- Keep V2 implementation outside this requirements-completion scope.

逻辑依据
- V1 is complete as v0.1.0.
- V2 requirements need a clear scaffold/readiness direction before implementation starts.
- Version and git/release semantics need to stay separate from tag or release publication.

未竟之事
- Implement V2 scaffold, readiness, and validation harness behavior after requirements acceptance.
- Run live V2 behavior validation after implementation.

重点关注
- Do not treat v0.1.1 as V2 implementation completion.
- Do not create a tag, release, deployment, or public publication without explicit owner authorization."
```

- [ ] **Step 4: Push only if gate passes**

Run:

```bash
git push
/opt/homebrew/bin/gh run list --limit 5
```

Expected: push succeeds. If no GitHub Actions workflows exist, `gh run list` may return no runs; record that as status evidence.

- [ ] **Step 5: Post-git PM/Advisor review**

After commit and after push, PM and Advisor must review the actual result before the flow is considered complete.

## Completion Criteria

The V2 requirements package is complete as `v0.1.1` when:

- `docs/loop-crafter-v2-requirements.md` has closed decisions instead of unresolved open questions.
- Version semantics clearly state V1 completed as `v0.1.0` and V2 requirements complete as `v0.1.1`.
- Review evidence exists in `docs/validation/loop-crafter-v2-requirements-review.md`.
- PM and Advisor report no unresolved P0/P1.
- Final validation passes.
- If commit/push is performed, post-commit and post-push review/status evidence is captured.

Recommended next goal after completion: start the separate V2 implementation loop, beginning with scaffold output contract implementation.
