# Publication Readiness

## Status

Current readiness: private repository preparation.

This document records the first open-source readiness pass for `loop-crafter`. It does not authorize repository visibility changes, GitHub metadata edits, tags, releases, external posts, scheduling, deployment, or any other public action.

## Project Classification

- Type: Codex skill and documentation package.
- Maturity: early documented project.
- Primary audience: developers and maintainers using Codex for recurring or long-running workflows.
- Adoption path: clone the repository and copy the skill files into a local Codex skills directory.
- Current version story: V2 requirements are documented as `v0.1.1`; no public release or tag has been created.

## Verified Baseline

Source: read-only `gh repo view` and local git checks on 2026-07-10.

- Repository: `alexsglife-re/loop-crafter`
- Default branch: `master`
- Visibility at readiness check: private
- Repository description: empty
- Homepage URL: empty
- Topics: none reported
- License metadata: none reported before adding `LICENSE`
- CI workflow: none present

## Owner Decisions

Confirmed decisions for Phase 1:

- License: MIT.
- Public positioning baseline: `loop-crafter is a review-first Codex skill for designing safe, gated agent loops before they become scaffolds, automation, or repository changes.`
- Public documentation scope: scrub or summarize local-path validation transcripts before public visibility.
- Normal commit/push: allowed after PM/Advisor agreement, fresh validation, and project git gates.

## Readiness Work Completed

- Added first-screen README positioning.
- Added MIT license text.
- Added lightweight contribution guidance.
- Added security and sensitive-content guidance.
- Added draft-only GitHub metadata recommendations.
- Added draft-only channel copy for later owner review.
- Replaced concrete local machine paths in existing validation and transcript evidence with placeholders such as `<repo-root>` and `<codex-home>`.

## Must Fix Before Public Visibility

- Owner must separately authorize changing repository visibility to public.
- Owner must separately authorize GitHub metadata edits.
- Owner must separately authorize any external post or schedule.
- PM and Advisor must review the final public-facing diff.
- Fresh validation must pass.

## Should Improve Before Broader Promotion

- Add a CI or local validation script when the project has stable checks.
- Add a changelog or release note before creating any tag or GitHub Release.
- Consider a simple social preview image after the README stabilizes.
- Validate the install path with a fresh local copy after publication decisions are final.

## Claim Safety

Public copy should not claim:

- unattended execution
- production support
- package-registry availability
- CI coverage
- broad runtime adapter support
- public release availability
- external adoption, stars, benchmarks, or endorsements

## Authorization State

Allowed in this phase:

- private repository documentation edits
- local draft metadata files
- local draft promotion files
- normal commit and push after PM/Advisor gate and validation

Not authorized in this phase:

- repository visibility change
- GitHub metadata edit
- tag or release creation
- external posting or scheduling
- deployment
- destructive changes
- credential, secret, auth, permission, or security setting changes
