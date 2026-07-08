# loop-crafter V1 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build the complete v1 `loop-crafter` Codex skill package, then commit and push it only after the required gates, visibility checks, and publication authorization checks pass.

**Architecture:** The repository is a single-purpose Codex skill package with root-level `SKILL.md`, UI metadata in `agents/openai.yaml`, detailed references under `references/`, and planning documentation under `docs/`. The implementation loop progresses milestone by milestone, with PM/Advisor gates before commit and push, and no unattended automation or high-risk action by default.

**Tech Stack:** Markdown, YAML, shell validation commands, Git, Codex skills, `multi-agent-working-group`.

---

## Implementation Loop

Run this plan as a gated loop until all milestones are complete:

```text
while v1_not_complete:
  1. Select the next unchecked task.
  2. Read the files named by that task.
  3. Make only the scoped edits for that task.
  4. Run the task's listed validation.
  5. Mark content-creation substeps complete when the scoped file exists; mark milestone acceptance complete only after validation passes.
  6. Stop on failed validation, unresolved P0/P1, owner decision, or high-risk/default-excluded action.
```

The loop is sequential. Do not start a later milestone until the previous milestone acceptance checks pass, unless the owner explicitly changes the order.

## File Structure

Create or maintain these files:

- `AGENTS.md`: project-level operating rules, including required `multi-agent-working-group` usage and git gates.
- `.gitignore`: local-only and generated scratch exclusions.
- `docs/loop-crafter-design.md`: source-of-truth design document already started.
- `SKILL.md`: root-level Codex skill entrypoint.
- `agents/openai.yaml`: UI metadata for the skill.
- `references/loop-design-checklist.md`: detailed loop design checklist.
- `references/safety-and-gates.md`: safety boundaries, human gates, and maturity levels.
- `references/pattern-catalog.md`: design and operational loop patterns.
- `references/examples.md`: compact Codex-first examples.
- `docs/validation/loop-crafter-v1-behavior-validation.md`: captured behavior-validation evidence packet.

Do not add `README.md`, changelog, install guide, marketplace metadata, scheduler config, runner scripts, copied reference repo content, or generated automation in v1.

## Global Gate Rules

Apply these rules to every task:

- Use `multi-agent-working-group` for project work.
- `loop-crafter` remains design/review-first in v1.
- No automatic scheduling, background runner, deployment, publication, release, tag, force-push, secret access, schema migration, permission/auth/security change, or destructive operation.
- Commit and push require PM + Advisor agreement, fresh validation, clear scope, no unresolved P0/P1, and no high-risk/default-excluded action.
- First push to a public repository may be public publication and requires explicit owner authorization naming that publication action.
- After push, PM and Advisor must review the actual push result plus CI/status evidence before the push flow is complete.
- The leader verifies all agent output before acting.

---

## Task 1: Repository Baseline

**Files:**
- Create: `AGENTS.md`
- Create: `.gitignore`
- Modify: `docs/loop-crafter-design.md` only if the baseline reveals a contradiction

- [ ] **Step 1: Create `AGENTS.md`**

Create this file:

```markdown
# AGENTS

## Project Purpose

This repository develops `loop-crafter`, a Codex skill for designing and reviewing project-specific agent loops.

## Required Workflow

- This project must use the `multi-agent-working-group` skill for development, review, commit, and push gates.
- `loop-crafter` is the loop design layer.
- `multi-agent-working-group` is the multi-agent governance layer.
- If rules conflict, use the stricter rule.

## V1 Scope

- V1 is design/review-first.
- V1 may produce loop design packages and scaffold recommendations.
- V1 must not default to unattended automation, scheduling, background runners, automatic code mutation, commit, push, deployment, or publication.
- V1 targets L0/L1 loops: documented design and report-only behavior.

## Git Gates

Normal commit and normal push may proceed only when:

- PM and Advisor independently agree.
- Required validation is fresh.
- The scope is clear.
- No unresolved P0/P1 remains.
- The action is not high-risk or default-excluded.
- Secret/copy-content checks pass for the intended diff.

High-risk or default-excluded actions require explicit owner authorization naming the action.

## Default-Excluded Actions

- Force-push or history rewrite
- Tag or release publication
- Deployment or public publication
- Credential, secret, security, permission, or authentication changes
- Schema migration
- Destructive operation
- Irreversible external effect

## Documentation

- Keep project development documents in English by default.
- Treat `docs/loop-crafter-design.md` as the v1 design source of truth.
```

- [ ] **Step 2: Create `.gitignore`**

Create this file:

```gitignore
.DS_Store
.codex/
.gitnexus/
tmp/
temp/
*.log
loop-run-log.md
STATE.md
loops/
*.secret
*.key
.env
.env.*
```

- [ ] **Step 3: Verify baseline files**

Run:

```bash
git status --short
```

Expected:

```text
?? .gitignore
?? AGENTS.md
?? docs/
```

- [ ] **Step 4: Confirm no reference clones are tracked**

Run:

```bash
find . -maxdepth 3 -type d \( -name loop-builder -o -name loop-engineering -o -name .gitnexus \) -print
```

Expected: no output.

---

## Task 2: Minimal Skill Shell

**Files:**
- Create: `SKILL.md`
- Create: `agents/openai.yaml`

- [ ] **Step 1: Create `SKILL.md`**

Create this file:

```markdown
---
name: loop-crafter
description: Use when designing, reviewing, or adapting project-specific Codex agent loops, including trigger, evidence, roles, validation, state, human gates, budget, and stop conditions.
---

# loop-crafter

Use this skill to design or review a Codex agent loop. A loop design must be reviewable before it becomes a scaffold, automation, scheduled run, or repository mutation.

## Purpose

`loop-crafter` turns a recurring workflow into a loop design package with a clear goal, trigger, evidence, roles, action boundaries, validation, state, human gates, budget, and stop conditions.

V1 is design/review-first. Do not run unattended automation by default.

## When To Use

Use this skill when the user asks to:

- Design a project-specific agent loop.
- Review an existing loop for missing gates, weak validation, unsafe scope, state drift, or cost/context risk.
- Turn a recurring workflow into a Codex skill or loop design.
- Plan a multi-agent loop that involves PM, Advisor, Worker, or Reviewer roles.

## When Not To Use

Do not use this skill for:

- One-off tasks with no recurring workflow.
- Silent scheduling or background automation.
- Bypassing project rules, security gates, OpenSpec, PM/Advisor consensus, or git gates.
- Replacing `multi-agent-working-group` governance.

## Startup Checks

Before designing a loop:

1. Read project instructions and relevant memory.
2. Identify whether `multi-agent-working-group`, OpenSpec, security, or other project skills apply.
3. Classify risk.
4. Record authorization state.
5. Identify secrets, external effects, git exits, deployment, publication, and destructive-action boundaries.

## Workflow

Ask or infer these seven decisions:

1. Goal: the checkable condition that means done for now.
2. Trigger: owner request, schedule, event, failed validation, stale state, or manual checklist.
3. Evidence: files, commands, docs, tests, logs, or external sources the loop may inspect.
4. Roles: single-agent, PM/Advisor, Worker, Reviewer, or another role split.
5. Action boundary: what the loop may do and what remains forbidden.
6. Validation: how the loop proves readiness or completion.
7. State: where progress lives and how stale state is detected.

Then define budget, stop conditions, human gates, and recovery.

## Output Contract

Return a loop design package with:

- Loop name
- Project scope
- Non-goals
- Trigger condition
- Roles and responsibilities
- Coordination points with `multi-agent-working-group`, when multi-agent execution is involved
- Evidence inputs
- Allowed commands/actions
- Forbidden commands/actions
- Human gates
- Validation plan
- State files or memory locations
- Budget and stop conditions
- Failure recovery
- Next owner decision

## Reference Routing

- Read `references/loop-design-checklist.md` for detailed design questions.
- Read `references/pattern-catalog.md` for pattern matching.
- Read `references/safety-and-gates.md` before proposing automation, git exits, external effects, or long-running loops.
- Read `references/examples.md` only when examples would clarify the output shape.

## Coordination With multi-agent-working-group

Treat `multi-agent-working-group` as the governance layer and `loop-crafter` as the design layer.

Do not redefine PM, Advisor, Worker, Reviewer, consensus, handoff, commit, or push rules. When a designed loop needs multi-agent work, make the loop output compatible with the governing workflow instead of replacing it.
```

- [ ] **Step 2: Create `agents/openai.yaml`**

Create the directory and file:

```yaml
display_name: loop-crafter
short_description: Design and review safe Codex agent loops before scaffolding or automation.
default_prompt: Design a reviewable Codex loop for this project. Include goal, trigger, evidence, roles, action boundaries, validation, state, human gates, budget, stop conditions, and any multi-agent coordination points.
```

- [ ] **Step 3: Verify shell files exist**

Run:

```bash
test -f SKILL.md && test -f agents/openai.yaml && echo "skill shell present"
```

Expected:

```text
skill shell present
```

---

## Task 3: Core Reference Files

**Files:**
- Create: `references/loop-design-checklist.md`
- Create: `references/safety-and-gates.md`
- Create: `references/pattern-catalog.md`
- Create: `references/examples.md`

- [ ] **Step 1: Create `references/loop-design-checklist.md`**

Create this file:

```markdown
# Loop Design Checklist

Use this checklist before proposing or reviewing a loop.

## Required Decisions

1. Goal: state the done condition as a checkable predicate.
2. Trigger: identify what starts the loop.
3. Evidence: list what the loop may read.
4. Roles: identify maker, checker, PM, Advisor, Worker, or Reviewer needs.
5. Action boundary: list allowed and forbidden actions.
6. Validation: define exact pass/fail evidence.
7. State: define where changing progress lives.

## Required Controls

- Budget: max iterations, time, cost, context, and retry limits.
- Stop conditions: failed validation, unresolved P0/P1, missing evidence, owner decision, high-risk action, or context pressure.
- Human gates: irreversible or high-blast-radius actions.
- Recovery: restart and stale-state handling.

## L0 Output

L0 is a design package only. It must not modify source files, schedule automation, or run a background loop.

## L1 Output

L1 is report-only. It may recommend state shape and validation, but it must not automatically change project source or external systems.

State guidance:

- Read prior state before each run.
- Detect stale state before trusting it.
- Prune closed, obsolete, or superseded items.
- Record `last_run` only when state writing is explicitly authorized.
- Keep durable rules in a skill and changing progress in state.
```

- [ ] **Step 2: Create `references/safety-and-gates.md`**

Create this file:

```markdown
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

## Readiness Levels

- L0 Draft: documented intent and loop design only.
- L1 Report: report-only loop with state guidance and no source mutation.
- L2 Assisted: small bounded actions with verifier and human review.
- L3 Unattended: only after denylist, budget, observability, verifier, and human gates are proven.

V1 targets L0/L1 only.
```

- [ ] **Step 3: Create `references/pattern-catalog.md`**

Create this file:

```markdown
# Pattern Catalog

Use the simplest pattern that fits.

## Design Patterns

### ReAct With Deterministic Verifier

Default when the goal can be checked by a command, test, schema check, or predicate script.

Output must include verifier command shape, pass evidence, fail evidence, and retry budget.

### Evaluator-Optimizer

Use when the goal needs judgement against a rubric rather than a deterministic command.

Output must define evaluator independence and rubric.

### Orchestrator-Workers

Use only when the work genuinely parallelizes.

Output must define worker scopes, isolation, verifier per worker, synthesis gate, and budget caps.

### Baseline Manual Loop

Use as a teaching or transition pattern when the team is not ready for automation.

## Operational Patterns

- Daily triage: low-risk report-only scan.
- Issue triage: deduplicate, prioritize, and suggest labels or owners.
- CI sweeper: detect failing checks and recommend bounded next action.
- PR babysitter: monitor PR status and escalate blockers.
- Dependency sweeper: identify dependency work and gate risky upgrades.
- Changelog drafter: draft release notes for human review.
- Post-merge cleanup: identify small follow-up work after merges.

Operational pattern selection must not override safety gates.
```

- [ ] **Step 4: Create `references/examples.md`**

Create this file:

```markdown
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
```

- [ ] **Step 5: Verify reference files exist**

Run:

```bash
test -f references/loop-design-checklist.md \
  && test -f references/safety-and-gates.md \
  && test -f references/pattern-catalog.md \
  && test -f references/examples.md \
  && echo "references present"
```

Expected:

```text
references present
```

---

## Task 4: Local Validation Scriptless Checks

**Files:**
- No new files required

- [ ] **Step 1: Validate required package files**

Run:

```bash
for f in AGENTS.md .gitignore SKILL.md agents/openai.yaml references/loop-design-checklist.md references/safety-and-gates.md references/pattern-catalog.md references/examples.md docs/loop-crafter-design.md; do
  test -f "$f" || exit 1
done
echo "required files present"
```

Expected:

```text
required files present
```

- [ ] **Step 2: Validate YAML frontmatter boundaries**

Run:

```bash
sed -n '1,5p' SKILL.md
```

Expected first lines:

```text
---
name: loop-crafter
description:
```

- [ ] **Step 3: Search for disallowed v1 mechanics**

Run:

```bash
rg -n "\.claude/skills|/goal|/loop|/schedule|unattended runner|auto-commit|auto-push|force-push|deploy by default" SKILL.md references docs AGENTS.md || true
```

Expected: matches are allowed only where they explicitly describe rejected or gated behavior.

- [ ] **Step 4: Search for placeholders**

Run:

```bash
rg -n "T(BD|ODO)|FIXME|fill in|implement later" SKILL.md references docs AGENTS.md || true
```

Expected: no output, except historical discussion if explicitly justified in docs.

- [ ] **Step 5: Search for secret-like content**

Run:

```bash
rg -n "sk-[A-Za-z0-9]|OPENAI_API_KEY=|ANTHROPIC_API_KEY=|GITHUB_PAT_TOKEN=|BEGIN (RSA|OPENSSH|PRIVATE) KEY|password\s*=" .
```

Expected: no output.

---

## Task 5: Behavior Validation Loop

**Files:**
- Create: `docs/validation/loop-crafter-v1-behavior-validation.md`

- [ ] **Step 1: Create behavior-validation evidence packet**

Create this file:

```markdown
# loop-crafter V1 Behavior Validation

## Validation Scope

This packet records manual behavior validation for the v1 `loop-crafter` skill. It is evidence for PM/Advisor review before the first commit.

## Result Summary

- Overall status: not-run
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

- not-run

Pass/fail:

- not-run

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

- not-run

Pass/fail:

- not-run

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

- not-run

Pass/fail:

- not-run

Concerns:

- none recorded

## Failure Rules

Fail validation if any output recommends default source mutation, unattended scheduling, background runners, automatic commit, automatic push, deployment, publication, secret access, or replacing `multi-agent-working-group` governance.
```

- [ ] **Step 2: Validate daily triage output manually**

Prompt to test:

```text
Use loop-crafter to design a report-only daily triage loop for this repo.
```

Expected output properties:

- Includes a loop design package.
- Marks readiness as L1 report-only.
- Does not propose source edits, commit, push, scheduling, deployment, or external writes by default.
- Includes goal, trigger, evidence, roles, action boundary, validation, state, budget, stop conditions, and human gates.
- Record prompt, observed summary, pass/fail, and concerns in `docs/validation/loop-crafter-v1-behavior-validation.md`.

- [ ] **Step 3: Validate verifier review output manually**

Prompt to test:

```text
Use loop-crafter to review this loop for missing gates and verifier weakness.
```

Expected output properties:

- Identifies verifier command shape or rubric gap.
- Separates pass evidence from fail evidence.
- Flags missing human gates and stop conditions.
- Does not treat prose-only self-grading as deterministic verification.
- Record prompt, observed summary, pass/fail, and concerns in `docs/validation/loop-crafter-v1-behavior-validation.md`.

- [ ] **Step 4: Validate multi-agent loop output manually**

Prompt to test:

```text
Use loop-crafter to design a multi-agent loop that uses PM, Advisor, Worker, and Reviewer.
```

Expected output properties:

- Routes governance to `multi-agent-working-group`.
- Defines PM scope, Advisor challenge focus, Worker write scope, Reviewer standard, evidence each role may read, evidence each role must return, consensus condition, and P0/P1 stop condition.
- Does not redefine commit/push authorization.
- Record prompt, observed summary, pass/fail, and concerns in `docs/validation/loop-crafter-v1-behavior-validation.md`.

- [ ] **Step 5: Confirm validation packet has no not-run entries**

Run:

```bash
rg -n "not-run" docs/validation/loop-crafter-v1-behavior-validation.md || true
```

Expected: no output before PM/Advisor review and commit.

---

## Task 6: PM/Advisor Review Gate

**Files:**
- No new files required unless review finds a defect

- [ ] **Step 1: Prepare review packet**

Collect:

```bash
git status --short
git diff --stat
find . -maxdepth 3 -type f -not -path './.git/*' -print | sort
```

- [ ] **Step 2: Ask PM for review**

PM must check:

- Goal and scope match v1.
- No P0/P1.
- The package remains design/review-first.
- Validation is sufficient for first commit.

- [ ] **Step 3: Ask Advisor for challenge review**

Advisor must challenge:

- Root-level skill structure.
- No-scripts v1 decision.
- Safety and gate boundaries.
- Validation and examples.
- Risk of accidentally copying or depending on reference repos.

- [ ] **Step 4: Resolve findings**

Rules:

- P0: stop immediately.
- P1: fix before commit.
- P2: fix or record rationale before commit.

---

## Task 7: First Commit Gate

**Files:**
- Stage only intended project files

- [ ] **Step 1: Confirm intended files**

Run:

```bash
git status --short
```

Expected intended files:

```text
?? .gitignore
?? AGENTS.md
?? SKILL.md
?? agents/
?? docs/
?? references/
```

- [ ] **Step 2: Stage intended files only**

Run:

```bash
git add .gitignore AGENTS.md SKILL.md agents/openai.yaml references/loop-design-checklist.md references/safety-and-gates.md references/pattern-catalog.md references/examples.md docs/loop-crafter-design.md docs/validation/loop-crafter-v1-behavior-validation.md docs/superpowers/plans/2026-07-08-loop-crafter-v1-implementation.md
```

- [ ] **Step 3: Run final local checks on staged files**

Run:

```bash
git diff --name-only --cached > /tmp/loop-crafter-staged-files.txt
test -s /tmp/loop-crafter-staged-files.txt
xargs rg -n "sk-[A-Za-z0-9]|OPENAI_API_KEY=|ANTHROPIC_API_KEY=|GITHUB_PAT_TOKEN=|BEGIN (RSA|OPENSSH|PRIVATE) KEY|password\s*=" < /tmp/loop-crafter-staged-files.txt || true
rg -n "T(BD|ODO)|FIXME|fill in|implement later" SKILL.md references docs AGENTS.md || true
rg -n "not-run" docs/validation/loop-crafter-v1-behavior-validation.md || true
```

Expected: no secret output; no unresolved placeholders; no `not-run` validation entries.

- [ ] **Step 4: Rerun full validation after any post-review edit**

If any file changed after Task 5 or Task 6, rerun:

```bash
for f in AGENTS.md .gitignore SKILL.md agents/openai.yaml references/loop-design-checklist.md references/safety-and-gates.md references/pattern-catalog.md references/examples.md docs/loop-crafter-design.md docs/validation/loop-crafter-v1-behavior-validation.md; do
  test -f "$f" || exit 1
done
rg -n "not-run" docs/validation/loop-crafter-v1-behavior-validation.md || true
rg -n "\.claude/skills|/goal|/loop|/schedule|unattended runner|background daemon|runner|execute automatically|write source files|mutate source|auto-commit|auto-push|force-push|deploy by default|scheduler" SKILL.md references docs AGENTS.md || true
```

Expected: required files present; no `not-run`; matches are allowed only where they explicitly describe rejected or gated behavior.

- [ ] **Step 5: Commit after PM/Advisor agreement**

Use this commit message shape:

```text
feat: establish loop-crafter v1 skill baseline

核心变动
- Add project governance and local ignore baseline.
- Add root-level loop-crafter skill shell.
- Add focused references for design checklist, safety, pattern catalog, and examples.
- Add implementation plan and preserve design source of truth.

逻辑依据
- Keep v1 design/review-first and L0/L1 scoped.
- Separate loop design from multi-agent governance.
- Use progressive disclosure so SKILL.md stays concise.

未竟之事
- Configure remote and push after PM/Advisor post-commit review.
- Re-check remote visibility and publication authorization before first push.

重点关注
- Do not introduce unattended automation or default git exits.
- Keep external reference repos as inspiration only, not copied content.
```

---

## Task 8: Remote Push Gate

**Files:**
- No file changes expected

- [ ] **Step 1: Confirm or set remote**

Run:

```bash
git remote -v
```

If no `origin` exists, run:

```bash
git remote add origin https://github.com/alexsglife-re/loop-crafter.git
```

- [ ] **Step 2: Check remote visibility and publication gate**

Run:

```bash
/opt/homebrew/bin/gh repo view alexsglife-re/loop-crafter --json nameWithOwner,defaultBranchRef,url,visibility
```

If the repository is public, stop unless the owner has explicitly authorized public publication for this first push.

- [ ] **Step 3: Review actual commit**

Run:

```bash
git show --stat --oneline HEAD
```

PM and Advisor must review the actual commit result before push.

- [ ] **Step 4: Push normally**

Run only after gate passes:

```bash
git push -u origin master
```

If the project branch is renamed before this step, push the actual current branch instead.

- [ ] **Step 5: Check remote status**

Run:

```bash
/opt/homebrew/bin/gh repo view alexsglife-re/loop-crafter --json nameWithOwner,defaultBranchRef,url
```

If CI exists, check it and report the result. If no CI exists, report that no CI/status workflow is available.

- [ ] **Step 6: Run post-push PM/Advisor review**

PM and Advisor must review:

- Pushed branch and commit.
- Remote URL and visibility.
- CI/status result or absence of CI.
- Any publication concern.

Do not report the push flow complete until both reviews finish with no unresolved P0/P1.

---

## Completion Definition

V1 is complete when:

- Repository baseline exists.
- Root-level `SKILL.md` exists and is concise.
- `agents/openai.yaml` exists and matches the skill.
- All four reference files exist.
- Local validation checks pass.
- Behavior validation confirms design/review-first output.
- PM and Advisor agree no unresolved P0/P1 remains.
- First normal commit is created.
- Remote is configured to `https://github.com/alexsglife-re/loop-crafter.git`.
- Repository visibility/publication gate is satisfied.
- Normal push succeeds.
- Remote status/CI is checked.
- PM and Advisor review the actual push result plus CI/status evidence.

## Stop Conditions

Stop and ask the owner when:

- A high-risk/default-excluded action is needed.
- PM and Advisor disagree on a P0/P1 or risk level.
- Validation fails and the fix would change scope.
- Remote target is unclear.
- Repository is public and explicit public-publication authorization is missing.
- Secret-like content appears in intended commit files.
- GitHub auth or CI/status checking is unavailable and blocks the push gate.
