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
