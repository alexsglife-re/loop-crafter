# AGENTS

## Project Purpose

This repository develops `loop-crafter`, a Codex skill for designing and reviewing project-specific agent loops.

## Required Workflow

- This project must use the `multi-agent-working-group` skill for development, review, commit, and push gates.
- Governance source: `https://github.com/alexsglife-re/multi-agent-working-group`.
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
