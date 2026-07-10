# loop-crafter Design

## Purpose

`loop-crafter` is a local Codex skill for designing project-specific agent loops. It helps Codex turn a recurring workflow into a reviewable loop design with clear goals, triggers, evidence inputs, role boundaries, validation, stop conditions, human gates, and state handling.

Version 1 should be a loop design and review skill, not an unattended loop runner. Its default output is a loop design package that a human can inspect before any scaffolding, automation, commit, push, deployment, publication, or scheduled execution happens.

## Current Project Decisions

- Skill name: `loop-crafter`
- Intended repository: `https://github.com/alexsglife-re/loop-crafter`
- Local project path: `<repo-root>`
- Project workflow rule: use `multi-agent-working-group` for this project.
- Git gate rule: normal commit and push may proceed only when PM and Advisor agree, no unresolved P0/P1 remains, required validation is fresh, the scope is clear, and the action is not a high-risk/default-excluded action.

## Target Use Cases

`loop-crafter` should help with:

- Designing a new Codex loop for a project workflow.
- Reviewing an existing loop for missing gates, weak validation, state drift, cost/context pressure, or scope creep.
- Turning a repeated PM/Advisor/Worker/Reviewer process into a project-local skill design.
- Planning multi-agent loops while deferring role governance and git gates to `multi-agent-working-group`.
- Producing a scaffold recommendation for a future skill folder without writing it automatically by default.
- Identifying which parts of a proposed loop must remain human-approved.

`loop-crafter` should not be used as:

- A background automation runner.
- A scheduler.
- A replacement for project rules, OpenSpec, security review, PM/Advisor consensus, or git gates.
- A replacement for `multi-agent-working-group` when a loop uses PM, Advisor, Worker, Reviewer, commit, push, or handoff gates.
- A way to bypass owner authorization for high-risk actions.

## Proposed Skill Directory Structure

Recommended published skill layout:

```text
loop-crafter/
├── SKILL.md
├── agents/
│   └── openai.yaml
└── references/
    ├── loop-design-checklist.md
    ├── pattern-catalog.md
    ├── safety-and-gates.md
    └── examples.md
```

This structure keeps `SKILL.md` small and uses progressive disclosure:

- `SKILL.md`: trigger rules, core workflow, output contract, and reference routing.
- `agents/openai.yaml`: human-facing skill metadata for Codex UI.
- `references/loop-design-checklist.md`: detailed design questions and review checklist.
- `references/pattern-catalog.md`: loop pattern taxonomy adapted for Codex.
- `references/safety-and-gates.md`: human gates, forbidden actions, state boundaries, and failure handling.
- `references/examples.md`: compact examples of valid loop design packages.

Avoid extra files inside the skill package unless they directly support the skill. Do not add `README.md`, installation guides, changelogs, or broad conceptual essays inside the skill folder.

## SKILL.md Outline

### Frontmatter

```yaml
---
name: loop-crafter
description: Use when designing, reviewing, or adapting project-specific Codex agent loops, including trigger, evidence, roles, validation, state, human gates, budget, and stop conditions.
---
```

### Body Sections

1. **Purpose**
   - State that the skill designs Codex loops.
   - State that it does not run unattended automation by default.

2. **When to Use**
   - New loop design.
   - Existing loop audit.
   - Recurring workflow conversion into a project-local skill.
   - Multi-agent PM/Advisor/Worker/Reviewer loop planning.

3. **When Not to Use**
   - One-off tasks with no recurring workflow.
   - Requests to silently schedule or run background automation.
   - Requests that require high-risk external effects without explicit owner authorization.

4. **Startup Checks**
   - Read project instructions and relevant memory.
   - Identify whether `multi-agent-working-group`, OpenSpec, security, or other project skills apply.
   - Classify risk.
   - Record authorization state.
   - Identify secrets, external effects, git exits, deployment, publication, and destructive-action boundaries.

5. **Loop Design Workflow**
   - Define the loop goal.
   - Define the trigger.
   - Define discovery/evidence inputs.
   - Define action boundaries.
   - Define validation.
   - Define state and handoff handling.
   - Define budget, stop conditions, and human gates.

6. **Pattern Selection**
   - Route to reference patterns only when needed.
   - Keep pattern selection advisory, not automatic execution.

7. **Output Contract**
   - Loop name.
   - Project scope.
   - Non-goals.
   - Trigger condition.
   - Roles and responsibilities.
   - Coordination points with `multi-agent-working-group`, when multi-agent execution is involved.
   - Evidence inputs.
   - Allowed commands/actions.
   - Forbidden commands/actions.
   - Human gates.
   - Validation plan.
   - State files or memory locations.
   - Budget and stop conditions.
   - Failure recovery.
   - Next owner decision.

8. **Reference Routing**
   - Read `references/loop-design-checklist.md` for detailed design questions.
   - Read `references/pattern-catalog.md` for pattern matching.
   - Read `references/safety-and-gates.md` before proposing automation, git exits, external effects, or long-running loops.
   - Read `references/examples.md` only when examples would clarify the output shape.

9. **Coordination With multi-agent-working-group**
   - Treat `multi-agent-working-group` as the governance layer.
   - Treat `loop-crafter` as the loop design layer.
   - Do not redefine PM, Advisor, Worker, Reviewer, consensus, handoff, commit, or push rules.
   - When a designed loop needs multi-agent work, make its output compatible with the governing workflow instead of replacing it.

## Proposed Core Workflow

The skill should ask or infer these seven decisions before proposing a loop:

1. **Goal**: What recurring outcome should the loop produce?
2. **Trigger**: What starts the loop: owner request, file change, schedule, failed validation, stale state, or manual checklist?
3. **Evidence**: What files, commands, docs, tests, logs, or external sources may the loop inspect?
4. **Roles**: Is this single-agent, PM/Advisor, Worker, Reviewer, or another role split?
5. **Action Boundary**: What may the loop do, and what must remain forbidden?
6. **Validation**: How does the loop prove that the result is correct enough to continue?
7. **State**: Where does current state live, and how is stale state detected or refreshed?

Each loop design must also define:

- Budget: time, context, cost, retries, and maximum iterations.
- Stop conditions: validation failure, unresolved P0/P1, missing evidence, owner decision, context pressure, or high-risk gate.
- Human gates: decisions that require the owner before proceeding.
- Recovery: what to do after interruption, stale state, or partial completion.

## Reference Analysis

Reference repositories were cloned into `/tmp/loop-crafter-reference-repos/` and indexed with GitNexus:

- `/tmp/loop-crafter-reference-repos/loop-builder`: `AaronLPS/loop-builder`, indexed as `ref-loop-builder` at commit `741c887`, status up to date.
- `/tmp/loop-crafter-reference-repos/loop-engineering`: `cobusgreyling/loop-engineering`, indexed as `ref-loop-engineering` at commit `919b72f`, status up to date.

### AaronLPS/loop-builder

Best use for `loop-crafter`: process inspiration.

Reusable ideas:

- Interview first, scaffold later.
- Ask seven loop decisions in order: goal, trigger, discovery, action, verification, state, and human gates.
- Require a checkable goal instead of a vague intent.
- Separate durable knowledge from changing state.
- Survey reusable capabilities before building new pieces.
- Select the simplest fitting pattern before creating artifacts.
- Always include a verifier, human gates, and budget/stop conditions.

Do not copy directly:

- The Claude Code plugin packaging.
- `.claude/skills/` as the default target.
- `/goal`, `/loop`, and `/schedule` as assumed runtime mechanics.
- The default goal of scaffolding unattended scheduled workflows.
- Skill-bank machinery as a required v1 dependency.

For `loop-crafter`, the seven-decision interview should remain, but the output should be Codex-first and review-first.

### cobusgreyling/loop-engineering

Best use for `loop-crafter`: pattern, readiness, and operations reference.

Reusable ideas:

- Readiness levels: L0 draft, L1 report, L2 assisted, L3 unattended.
- Pattern registry fields: goal, cadence, risk, phases, state file, human gates, token cost, and early-exit behavior.
- Loop design checklist: purpose, schedule, skills, maker/checker split, state, handoff, connectors, cost, observability, and safety.
- Safety denylist for secrets, auth, payments, production infra, migrations, and other high-risk paths.
- Production operating guidance: run logs, budgets, pause/kill criteria, and gradual rollout.
- Codex example posture: week 1 report-only, no source modification by default.

Do not copy directly:

- NPM CLI dependency as a v1 requirement.
- GitHub Actions automation as part of initial skill behavior.
- Full docs site structure, visual assets, starter kits, or marketplace material.
- L3 unattended mode as a default target.

For `loop-crafter`, use the L0-L3 maturity model and checklist concepts, but keep v1 scoped to L0/L1 design output.

## Borrowed Concepts Summary

### From AaronLPS/loop-builder

Use as a process reference, not as a direct structure template:

- Decision-first loop design.
- Separation between durable skill instructions and changing loop state.
- Reusable capability survey before creating a new loop.
- Pattern selection before scaffolding.
- Explicit scaffold blocks.
- Human gates.
- Budget and stop-condition thinking.

Adapt these ideas into Codex language and Codex project conventions.

### From cobusgreyling/loop-engineering

Use as a methodology and risk-pattern reference, not as a required CLI dependency:

- Loop pattern taxonomy.
- Loop init, audit, cost, context, sync, and worktree concepts.
- State-management mindset.
- Safety and cost-awareness framing.
- Context-pressure and handoff considerations.

Treat the repo's CLI tools as inspiration for future optional tooling only. Do not make v1 depend on installing or running them.

## Explicitly Not Adopted

Do not adopt these in v1:

- Claude-specific paths such as `.claude/skills`.
- Claude-specific slash commands such as `/goal`, `/loop`, or `/schedule`.
- Unattended recurring automation as the default behavior.
- Automatic background agents with unclear ownership, budget, or stop conditions.
- Automatic commit, push, deployment, publication, release, tag creation, force-push, secret access, permission changes, schema changes, or destructive operations.
- Blind copying of either source repository's folder structure.
- Large conceptual documentation inside the skill package.
- A generic loop engine that tries to execute every loop type itself.

## Safety Model

`loop-crafter` should default to review-first behavior:

- It may design a loop.
- It may recommend a scaffold.
- It may identify missing evidence or weak gates.
- It may propose validation commands.
- It must not silently execute high-risk actions.
- It must not treat an old design, handoff, or prior consensus as current authorization.

For this project, PM and Advisor consensus may allow normal commit and push only after the current gate passes. That does not authorize high-risk/default-excluded actions.

## Coordination With multi-agent-working-group

`loop-crafter` and `multi-agent-working-group` have different responsibilities:

- `loop-crafter` designs the loop.
- `multi-agent-working-group` governs multi-agent execution.

When a proposed loop includes PM, Advisor, Worker, Reviewer, handoff, commit, push, CI/status, or other gated actions, `loop-crafter` must not invent or weaken those rules. It should instead describe the loop's role needs and route execution governance back to `multi-agent-working-group`.

### Responsibility Split

`loop-crafter` may define:

- Why the loop exists.
- What starts the loop.
- What evidence the loop needs.
- Which roles are needed.
- What each role must produce for this loop.
- Which actions are in scope.
- Which actions are forbidden.
- What validation proves readiness.
- What state and handoff artifacts the loop needs.

`multi-agent-working-group` controls:

- PM and Advisor independence.
- Worker and Reviewer boundaries.
- Consensus requirements.
- P0/P1/P2 handling.
- Git exit gates.
- Commit and push readiness.
- Post-commit and post-push review.
- Handoff and continuity rules for multi-agent work.
- Default-excluded high-risk actions.

### Priority Order

If rules conflict, apply the stricter rule in this order:

1. Current owner instruction.
2. Project `AGENTS.md` and project-local memory.
3. `multi-agent-working-group` governance rules.
4. OpenSpec, security, git, or other specialized project gates.
5. `loop-crafter` design recommendations.

### Required Output For Multi-Agent Loops

When `loop-crafter` designs a multi-agent loop, the loop design package should include:

- PM scope and acceptance checks.
- Advisor challenge focus.
- Worker write scope, if implementation is expected.
- Reviewer review standard, if review is required.
- Evidence that each role may read.
- Evidence that each role must return.
- Consensus condition before continuing.
- Stop conditions for unresolved P0/P1.
- Git gate handoff back to `multi-agent-working-group`, when commit or push is in scope.

This keeps `loop-crafter` useful for design while preventing duplicate or conflicting multi-agent governance.

## Closed V1 Decisions

### Skill Publishing Structure

Decision: use a repository-root skill layout.

```text
loop-crafter/
├── SKILL.md
├── agents/
│   └── openai.yaml
└── references/
    ├── loop-design-checklist.md
    ├── pattern-catalog.md
    ├── safety-and-gates.md
    └── examples.md
```

Rationale:

- The target repository is a single-purpose skill repository named `loop-crafter`.
- Root-level `SKILL.md` keeps installation and inspection simple.
- A nested `skills/loop-crafter/` layout is better for multi-skill plugin repositories, which is not the v1 target.

Migration trigger:

- If this repository later becomes a multi-skill plugin or package, move the skill to `skills/loop-crafter/` and keep root-level package/plugin metadata separate from the skill itself.

### V1 Output Mode

Decision: v1 designs and reviews loops; it may draft a scaffold only when the owner explicitly asks.

Default output:

- A loop design package.
- A readiness level recommendation.
- A safety and gate review.
- A suggested file layout for a future scaffold.

Not default:

- Writing runnable loop files.
- Scheduling runs.
- Creating automations.
- Committing, pushing, deploying, publishing, or touching external systems.

### Maturity Target

Decision: v1 targets L0 and L1 loops.

- L0: documented loop intent and design.
- L1: report-only loop with state guidance, no automatic source modification.

L2 assisted fixes and L3 unattended operation are out of scope for v1. The skill may describe what would be required to reach them, but it should not generate an L2/L3 execution setup by default.

### Pattern Catalog Shape

Decision: split patterns into two layers.

- Design patterns: ReAct with deterministic verifier, evaluator-optimizer, orchestrator-workers, and baseline/manual loop.
- Operational patterns: daily triage, issue triage, CI sweeper, PR babysitter, dependency sweeper, changelog drafter, and post-merge cleanup.

Rationale:

- The design-pattern layer answers how the loop reasons.
- The operational-pattern layer answers what recurring workflow the loop serves.
- Keeping them separate avoids overfitting a task to a heavy operational template.

### Memory And State Integration

Decision: include state/memory guidance in v1, but defer automatic memory writes.

V1 may recommend:

- `STATE.md` or a project-local state file.
- A run log.
- A handoff or continuity note.
- A durable-vs-changing split.

V1 must not automatically write global memory, project memory, or state files unless the owner explicitly asks for scaffold creation or memory update.

L1 state guidance should still define the contract:

- Read prior state before each run.
- Detect stale state before trusting it.
- Prune closed, obsolete, or superseded items.
- Record `last_run` when state writing is explicitly authorized.
- Keep durable rules in the skill and changing progress in state.

### Examples

Decision: include compact generic examples plus one Codex multi-agent example.

Examples should demonstrate:

- A report-only daily triage loop.
- A deterministic-verifier loop.
- A multi-agent loop that routes PM/Advisor/Worker/Reviewer governance back to `multi-agent-working-group`.

Do not include large copied examples from either reference repository.

The deterministic-verifier example must define a verifier contract even though v1 has no bundled scripts:

- Command shape.
- Expected pass evidence.
- Expected fail evidence.
- Where a future generated verifier would live if scaffold creation is explicitly requested.

### Scripts

Decision: do not include scripts in v1.

Rationale:

- `loop-crafter` v1 is a design skill, not a runner.
- Deterministic verifier scripts belong to the generated loop or to a later optional scaffold feature.
- Avoiding scripts keeps the first version auditable and easy to review.

## Implementation Target Path

This path is the working to-do for building v1. Each milestone should finish with a small review before moving to the next one. Commit and push remain gated by the project rule: PM and Advisor must agree, validation must be fresh, no unresolved P0/P1 may remain, and the action must not be high-risk or default-excluded.

### Milestone 0: Repository Baseline

Goal: make the repository safe to develop and review.

Progress objective:

- Establish the repo rules and local hygiene before adding the skill itself.
- Make the project safe for later PM/Advisor review and first commit.

Target files:

- `AGENTS.md`: project rules, including required `multi-agent-working-group` usage and git gate policy.
- `.gitignore`: exclude local-only state, reference repos, and generated scratch files.
- `docs/loop-crafter-design.md`: keep this design as the source of truth for v1.

To-do:

- [ ] Create `AGENTS.md` with the project requirement to use `multi-agent-working-group`.
- [ ] Record the normal commit/push rule: PM + Advisor agreement, fresh validation, clear scope, no unresolved P0/P1, no high-risk/default-excluded action.
- [ ] Record that `loop-crafter` is design-first and must not default to unattended automation.
- [ ] Create `.gitignore`.
- [ ] Exclude local-only scratch directories such as `.codex/`, `.gitnexus/`, `tmp/`, `.DS_Store`, and generated run/state artifacts unless explicitly intended.
- [ ] Confirm no reference repository clone is inside the project tree.
- [ ] Re-read `docs/loop-crafter-design.md` after edits and confirm it remains the v1 source of truth.

Acceptance:

- Project rules are explicit.
- Reference clones are not tracked.
- No secrets or local state are introduced.
- `git status --short` shows only intended baseline files.

### Milestone 1: Minimal Skill Shell

Goal: create the root-level skill package.

Progress objective:

- Build the smallest usable Codex skill shell.
- Keep `SKILL.md` concise and route detailed guidance to references.

Target files:

- `SKILL.md`
- `agents/openai.yaml`

To-do:

- [ ] Create root-level `SKILL.md`.
- [ ] Add frontmatter with `name: loop-crafter`.
- [ ] Add a trigger description for designing, reviewing, or adapting project-specific Codex loops.
- [ ] Add `Purpose`, `When to Use`, and `When Not to Use`.
- [ ] Add startup checks: project rules, relevant memory, risk, authorization, external effects, secrets, and git gates.
- [ ] Add the seven-decision loop workflow.
- [ ] Add output contract for loop design packages.
- [ ] Add reference routing to the four reference files.
- [ ] Add the `multi-agent-working-group` coordination rule.
- [ ] Create `agents/openai.yaml` with matching display metadata and default prompt.

Acceptance:

- `SKILL.md` frontmatter has the final name and trigger description.
- The body is concise and routes to references instead of embedding all detail.
- The skill clearly says it designs/reviews loops and does not run unattended automation by default.
- `agents/openai.yaml` matches the skill name, purpose, and default behavior.

### Milestone 2: Core References

Goal: add the design knowledge needed by the skill without bloating `SKILL.md`.

Progress objective:

- Move detailed design rules into focused reference files.
- Keep each reference file narrow enough that Codex can load only what it needs.

Target files:

- `references/loop-design-checklist.md`
- `references/safety-and-gates.md`
- `references/pattern-catalog.md`
- `references/examples.md`

To-do:

- [ ] Create `references/loop-design-checklist.md`.
- [ ] Add the seven-decision interview with checkable-goal guidance.
- [ ] Add L0/L1 output requirements and state guidance.
- [ ] Create `references/safety-and-gates.md`.
- [ ] Add forbidden/default-excluded actions: secrets, auth, permissions, payments, schema, destructive actions, deployment, publication, force-push, tags/releases.
- [ ] Add git gate handoff back to `multi-agent-working-group`.
- [ ] Add L0-L3 readiness levels and v1's L0/L1 boundary.
- [ ] Create `references/pattern-catalog.md`.
- [ ] Separate design patterns from operational patterns.
- [ ] Mark ReAct with deterministic verifier as the default when the goal is program-checkable.
- [ ] Mark orchestrator-workers as escalation only when work genuinely parallelizes.
- [ ] Create `references/examples.md`.
- [ ] Add a report-only daily triage example.
- [ ] Add a deterministic-verifier example with command shape, pass evidence, fail evidence, and future verifier location.
- [ ] Add a multi-agent example that defers role governance to `multi-agent-working-group`.

Acceptance:

- Checklist covers goal, trigger, evidence, action boundary, verification, state, budget, and human gates.
- Safety reference includes denylist, git gates, external effects, secrets, and L0-L3 maturity.
- Pattern catalog separates design patterns from operational patterns.
- Examples are compact and Codex-first.
- No large copied material from either reference repo is included.

### Milestone 3: Validation Pass

Goal: verify the skill behaves as intended before publication.

Progress objective:

- Prove the skill produces reviewable loop design packages by default.
- Catch accidental drift toward runner/scaffold/automation behavior before the first commit.

Validation prompts:

- "Design a report-only daily triage loop for this repo."
- "Review this loop for missing gates and verifier weakness."
- "Design a multi-agent loop that uses PM, Advisor, Worker, and Reviewer."

To-do:

- [ ] Run the three validation prompts against the local skill instructions.
- [ ] Confirm outputs are design packages, not execution plans, unless explicitly asked for scaffolding.
- [ ] Confirm each output includes goal, trigger, evidence, roles, action boundary, validation, state, budget, stop conditions, and human gates.
- [ ] Confirm multi-agent output routes governance to `multi-agent-working-group`.
- [ ] Validate `SKILL.md` frontmatter parses as YAML.
- [ ] Validate required files exist.
- [ ] Validate `agents/openai.yaml` matches the skill name, description, and default prompt.
- [ ] Search the package for accidental `.claude/skills`, `/goal`, `/loop`, `/schedule`, unattended-runner defaults, and copied bulk reference content.
- [ ] Search staged/intended files for secrets or credentials before any git gate.

Acceptance:

- The skill produces a loop design package, not an execution plan by default.
- The validation explicitly checks that the output stays a design package unless the owner asks for scaffolding.
- The multi-agent example routes governance to `multi-agent-working-group`.
- The output includes readiness level, stop conditions, validation, and human gates.
- `SKILL.md` frontmatter is valid.
- `agents/openai.yaml` matches the skill name, description, and default prompt.
- Required reference files are present.
- No stray `README.md`, changelog, install guide, marketplace file, or copied reference-project bulk content appears inside the skill package.

### Milestone 4: PM/Advisor Gate And First Commit

Goal: prepare the first normal commit when PM and Advisor agree.

Progress objective:

- Freeze a clean v1 baseline commit only after review agrees the package is coherent and safe.

Required checks:

- `git status --short`
- Review changed files.
- Search for secrets or accidental copied reference content.
- PM and Advisor independently review no unresolved P0/P1.

To-do:

- [ ] Review `git status --short`.
- [ ] Review `git diff --stat`.
- [ ] Review full diff for intended files only.
- [ ] Run validation from Milestone 3 again if any file changed after validation.
- [ ] Run a secret/copy-content search over intended commit files.
- [ ] Ask PM for independent review.
- [ ] Ask Advisor for independent challenge review.
- [ ] Resolve or record all P2 findings.
- [ ] Stop on any unresolved P0/P1.
- [ ] Stage only intended files.
- [ ] Commit with the required deep handover-style commit message sections.

Acceptance:

- Commit scope is clear.
- No high-risk/default-excluded action is involved.
- Normal commit may proceed under the project rule if PM and Advisor agree.
- The first commit contains the baseline docs and v1 skill package, not temporary reference clones or local state.

### Milestone 5: Remote Setup And Push

Goal: connect to `https://github.com/alexsglife-re/loop-crafter` and push when gates pass.

Progress objective:

- Publish the reviewed baseline to the intended remote without broadening scope.

Required checks:

- Confirm remote is configured correctly.
- Confirm branch target.
- Re-run validation and secret scan.
- PM and Advisor review actual commit before push.
- After push, check remote status/CI if available.

To-do:

- [ ] Confirm whether remote `origin` exists.
- [ ] If missing, set `origin` to `https://github.com/alexsglife-re/loop-crafter.git`.
- [ ] Confirm branch name and remote target before push.
- [ ] Review actual commit with `git show --stat` and targeted diff.
- [ ] Run final secret/copy-content scan over outgoing commit.
- [ ] Get PM and Advisor agreement on the actual commit.
- [ ] Push normally, never force-push.
- [ ] Check remote status and CI/status if available.
- [ ] Report pushed branch, commit, and any CI/status result.

Acceptance:

- Push is a normal push, not force-push.
- Remote target is correct.
- CI/status result is reported if available.

## Current To-Do

The current next actionable checkpoint is Milestone 0.

- [ ] Milestone 0: create repository baseline files.
- [ ] Milestone 1: create minimal root-level skill shell.
- [ ] Milestone 2: add core references.
- [ ] Milestone 3: validate skill behavior and package mechanics.
- [ ] Milestone 4: run PM/Advisor gate and create first commit.
- [ ] Milestone 5: configure remote and push after gates pass.

Do not start a later milestone until the previous milestone's acceptance checks pass or an explicit owner instruction changes the order.

## Recommended V1 Scope

V1 should include a complete but narrow Codex skill for designing and reviewing loop plans. It should not include a scheduler, CLI runner, background daemon, or automatic repository mutation. The first useful milestone is a skill that consistently produces a clear, safe, reviewable loop design package.
