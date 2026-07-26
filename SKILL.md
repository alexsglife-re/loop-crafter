---
name: loop-crafter
description: Use when designing, reviewing, or adapting project-specific Codex agent loops, including trigger, evidence, roles, validation, state, human gates, budget, and stop conditions.
---

# loop-crafter

Use this skill to design or review a Codex agent loop. A loop design must be reviewable before it becomes a scaffold, automation, scheduled run, or repository mutation.

V2 adds assisted scaffold proposals, readiness reports, and validation harness designs. These are review outputs by default, not permission to write files or run unattended automation.

## Purpose

`loop-crafter` turns a recurring workflow into a loop design package with a clear goal, trigger, evidence, roles, action boundaries, validation, state, human gates, budget, and stop conditions.

V2 remains design/review-first. Do not run unattended automation by default.

## When To Use

Use this skill when the user asks to:

- Design a project-specific agent loop.
- Review an existing loop for missing gates, weak validation, unsafe scope, state drift, or cost/context risk.
- Turn a recurring workflow into a Codex skill or loop design.
- Turn a mature loop design into a reviewable scaffold proposal.
- Produce a readiness report or validation harness design for a proposed loop.
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
6. Freeze the owner-authorized objective, objective category, completion predicate, and gate set in force at startup for this run.

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

Apply anti-expansion controls before accepting any recommended next step:

- Authorized Objective Continuation: PM, Advisor, Leader, or Reviewer next-step recommendations may continue only when they are necessary to satisfy the current completion predicate, stay inside the frozen objective category, and do not require a default-excluded action.
- Goal Freeze: new findings may refine execution inside the current objective, but they must not automatically become new objectives, new phases, or new deliverables. A loop that edits governance or gate rules must still exit under the gate set in force at startup.
- Completion Predicate: each loop must define a checkable done condition and stop/report when it is satisfied.
- Phase Boundary: each phase must use one objective category, such as readiness, metadata, README, release, CI, promotion, implementation, or governance refinement. Crossing categories requires owner confirmation unless that crossing was explicitly included in the frozen objective.
- No Self-Governance Expansion: a loop may record governance gaps discovered during the run, but it must not relax or expand its current-run effective governance. A separately authorized governance-refinement loop may edit future governance artifacts, but those edits cannot grant authority to the run that produced them. Put out-of-scope gaps into Next Backlog.
- Next Backlog: useful work outside the frozen target must be recorded as backlog instead of executed.
- Gate Repair Window: when the owner grants a repair window, the owner authorizes a bounded set of repairs inside the frozen objective rather than each repair line. PM/Advisor/Reviewer-requested P0/P1 repairs may continue without asking again only when they are necessary for the current completion predicate, stay in the frozen objective category, do not relax current-run effective governance, do not add default-excluded actions, touch only declared files or validation coverage for declared files, and are followed by fresh validation and fresh PM/Advisor review before any git exit. Every Gate Repair Window must state Declared File Scope, repair-window opened, repair-window expires, repair-cycle cap, wall-clock cap, validation-only budget handling, repair-window forbidden actions, and fresh-review requirement. Validation-only repairs do not consume a full repair cycle unless the owner says otherwise.
- Objective Amendments: changing the frozen objective requires explicit owner instruction, recorded amendment provenance, and a new frozen objective for future review. Amendments never retroactively authorize work already performed.

For scaffold or readiness work, convert the seven decisions into concrete output fields:

- Scaffold proposal: proposed files, file content previews, validation before write, validation after write, write authorization needed, and next owner decision.
- Readiness report: current level, target level, missing controls, denylist conflicts, validation strength, state maturity, observability, human gates, and recommendation.
- Validation harness design: verifier command shape or rubric, pass evidence, fail evidence, retry budget, stop conditions, transcript/run-log capture, and secret/copy-content scan expectation.

Stop before writing scaffold files unless the owner explicitly authorizes scaffold creation and all applicable project gates pass.

## Output Contract

Return a loop design package with:

- Loop name
- Project scope
- Non-goals
- Trigger condition
- Frozen objective
- Objective category
- Startup gate-set snapshot
- Roles and responsibilities
- Coordination points with `multi-agent-working-group`, when multi-agent execution is involved
- Evidence inputs
- Allowed commands/actions
- Forbidden commands/actions
- Human gates
- Validation plan
- State files or memory locations
- Budget and stop conditions
- Gate Repair Window, when owner-authorized
- Declared File Scope, when a Gate Repair Window is owner-authorized
- repair-window opened
- repair-window expires
- repair-cycle cap
- wall-clock cap
- validation-only budget handling
- repair-window forbidden actions
- fresh-review requirement
- Failure recovery
- Completion predicate
- Next Backlog for out-of-scope recommendations
- Next owner decision

When the user asks for V2 scaffold assistance, return one or more of:

- Loop Scaffold Proposal
- Loop Readiness Report
- Scaffold Write Packet
- Validation Harness Design

Each output must be reviewable and must identify whether owner authorization is needed before any write.

## Reference Routing

- Read `references/loop-design-checklist.md` for detailed design questions.
- Read `references/pattern-catalog.md` for pattern matching.
- Read `references/safety-and-gates.md` before proposing automation, git exits, external effects, or long-running loops.
- Read `references/scaffold-package.md` before producing a scaffold proposal or write packet.
- Read `references/readiness-model.md` before assigning L0/L1/L2/L3 readiness.
- Read `references/validation-harness.md` before designing deterministic or rubric-based validation.
- Read `references/examples.md` only when examples would clarify the output shape.

## Coordination With multi-agent-working-group

Treat `multi-agent-working-group` as the governance layer and `loop-crafter` as the design layer.

The governance source is `https://github.com/alexsglife-re/multi-agent-working-group`.

Do not redefine PM, Advisor, Worker, Reviewer, consensus, handoff, commit, or push rules. When a designed loop needs multi-agent work, make the loop output compatible with the governing workflow instead of replacing it.
