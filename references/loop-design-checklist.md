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
