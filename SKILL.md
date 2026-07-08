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

The governance source is `https://github.com/alexsglife-re/multi-agent-working-group`.

Do not redefine PM, Advisor, Worker, Reviewer, consensus, handoff, commit, or push rules. When a designed loop needs multi-agent work, make the loop output compatible with the governing workflow instead of replacing it.
