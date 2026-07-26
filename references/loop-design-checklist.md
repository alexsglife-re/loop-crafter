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

- Goal Freeze: record the owner-authorized objective and gate set in force at startup exactly enough that later findings cannot turn into a larger mission or relax the current run's exit gates.
- Completion Predicate: define the condition that ends the loop for this run.
- Phase Boundary: assign one objective category to the phase, such as readiness, metadata, README, release, CI, promotion, implementation, or governance refinement.
- Authorized Objective Continuation: allow PM, Advisor, Leader, or Reviewer next-step recommendations to continue only inside the frozen objective category and only when needed for the completion predicate.
- No Self-Governance Expansion: do not let the loop relax or expand its current-run effective governance; a separately authorized governance-refinement loop may edit future governance artifacts only.
- Next Backlog: capture useful recommendations outside the current target with `item`, `why it matters`, `risk`, `needs owner authorization`, and `recommended priority`.
- Gate Repair Window: if the owner wants fewer interruptions, record a bounded repair window with Declared File Scope, repair-window opened, repair-window expires, repair-cycle cap, wall-clock cap, validation-only budget handling, repair-window forbidden actions, and fresh-review requirement.
- Objective Amendments: if the frozen objective changes, record owner authorization, amendment provenance, and the re-frozen objective before continuing.
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
