# Publication Readiness

## Status

Current readiness: `v0.1.2` release packet prepared and locally validated.

This document records the current release-preparation state for `loop-crafter`.
Repository visibility and the initial GitHub description/topics were applied by
earlier owner-authorized actions. The owner has authorized the `v0.1.2` tag and
GitHub Release, but neither action is claimed as completed here. External posts,
scheduling, deployment, and other public actions remain separately gated.

## Project Classification

- Type: Codex skill and documentation package.
- Maturity: early documented project.
- Primary audience: developers and maintainers using Codex for recurring or long-running workflows.
- Adoption path: clone the repository and copy the skill files into a local Codex skills directory.
- Current version story: `v0.1.1` remains the first public baseline and V2
  requirements release; `v0.1.2` delivers the implemented and installed-live-
  validated V2 behavior.

## Verified Baseline

Source: read-only `gh repo view` and local git checks on 2026-07-10.

- Repository: `alexsglife-re/loop-crafter`
- Default branch: `master`
- Visibility at latest check: public
- Repository description: `Review-first Codex skill for designing safe, gated agent loops before they become scaffolds or automation.`
- Homepage URL: empty
- Topics: `agent-workflows`, `ai-agents`, `automation-safety`, `codex-skill`, `developer-tools`, `workflow-governance`, `agent-loops`, `loop-design`
- License metadata: MIT
- CI workflow: `.github/workflows/validate.yml`

## Owner Decisions

Confirmed decisions for Phase 1:

- License: MIT.
- Public positioning baseline: `loop-crafter designs unattended-ready agent loops with evidence, gates, state, and validated exits.`
- Public documentation scope: scrub or summarize local-path validation transcripts before public visibility.
- Normal commit/push: allowed after PM/Advisor agreement, fresh validation, and project git gates.

## Readiness Work Completed

- Added first-screen README positioning.
- Added MIT license text.
- Added lightweight contribution guidance.
- Added security and sensitive-content guidance.
- Applied owner-authorized GitHub description and topics from the metadata draft.
- Added draft-only channel copy for later owner review.
- Replaced concrete local machine paths in existing validation and transcript evidence with placeholders such as `<repo-root>` and `<codex-home>`.
- Completed the separately owner-authorized installed-skill sync and verified
  all nine runtime files byte-identical to repository sources.
- Added installed live validation for scenarios 1-9; only scenarios 1 and 9
  were repeated for corrective validation.
- Prepared the `v0.1.2` changelog and release notes.

## Remaining Gates Before Promotion

- Repository visibility is now public by owner action.
- Initial GitHub description and topics have been applied by owner-authorized action.
- `v0.1.2` tag and GitHub Release are owner-authorized for the next release
  gate but are not yet recorded as created.
- Owner must separately authorize any external post or schedule.
- PM and Advisor must review the final public-facing diff.
- Fresh validation must pass.

## Should Improve Before Broader Promotion

- Expand the local validation script as the project gains stable checks.
- Add more release examples and validation notes after the first public release.
- Social preview image now exists at `assets/social-preview.png`; consider setting it in GitHub only after separate owner authorization for that metadata action.
- Validate the install path with a fresh local copy after publication decisions are final.

## Claim Safety

Public copy should not claim:

- ungated unattended execution
- production support
- package-registry availability
- comprehensive CI coverage beyond the lightweight validation workflow
- broad runtime adapter support
- release availability beyond the documented `v0.1.2` release surface
- external adoption, stars, benchmarks, or endorsements

## Authorization State

Allowed in this phase:

- public repository documentation edits
- local draft metadata files
- local draft promotion files
- normal commit and push after PM/Advisor gate and validation
- the owner-authorized `v0.1.2` tag and GitHub Release after all required
  release gates pass

Not authorized in this phase:

- additional repository visibility changes
- additional GitHub metadata edits
- tag or release creation other than the owner-authorized `v0.1.2` release gate
- external posting or scheduling
- deployment
- destructive changes
- credential, secret, auth, permission, or security setting changes
