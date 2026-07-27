# Changelog

All notable public changes to `loop-crafter` are recorded here.

## v0.1.2 - 2026-07-26

V2 assisted scaffold and validation-design release.

### Added

- Reviewable scaffold proposals with explicit target, file previews, evidence,
  forbidden actions, validation, state, run-log, human-gate, and governance
  fields.
- Complete scaffold write-authorization fields:
  `write_authorization_needed`, `write_authorization_status`,
  `validation_before_write`, and `validation_after_write`.
- Readiness reports, validation harness designs, and bounded Gate Repair Window
  contracts.
- Installed-skill live validation covering scenarios 1-9, with corrective
  reruns limited to scenarios 1 and 9.
- Additive local validator coverage for the V2 scaffold contract and retained
  transcript evidence.

### Changed

- V2 moved from an accepted requirements package to an implemented,
  live-validated local skill capability.
- The installed runtime copy was synchronized and verified byte-identical
  across all nine runtime files during owner-authorized release preparation.

### Validation

- Local syntax, repository validation, whitespace, local-path, and common
  secret-like pattern checks passed during release preparation.
- Scenarios 1 and 9 passed their accepted rerun outputs.
- Initial scenarios 2-8 remain accepted outcome evidence; their original
  per-scenario runtime session IDs and full prompt/runtime provenance were not
  preserved and are not claimed.

### Boundaries

- No package-registry release or hosted service.
- No unattended runner or background scheduler.
- No automatic source mutation, commit, push, tag, release, deployment, or
  publication.
- Scaffold writes and external effects remain subject to explicit owner and
  project governance gates.

## v0.1.1 - 2026-07-10

Public baseline and V2 requirements/readiness release.

### Added

- Public README with unattended-ready loop positioning, quickstart, repository map, validation notes, and boundaries.
- MIT license, contributing guide, and security guidance.
- GitHub social preview asset at `assets/social-preview.png`.
- Lightweight local validation script and GitHub Actions workflow.
- Publication readiness record in `docs/PUBLICATION_READINESS.md`.
- Draft promotion and metadata notes under `docs/promotion/`.
- V2 requirements package in `docs/loop-crafter-v2-requirements.md`.
- V2 reference material for scaffold proposals, readiness reports, validation harness design, and examples.

### Changed

- Replaced concrete local machine paths in validation and transcript evidence with placeholders such as `<repo-root>` and `<codex-home>`.
- Updated public positioning from a defensive "not an unattended runner" framing to unattended-ready loop design with evidence, gates, state, and validated exits.
- Applied loop-focused GitHub topics including `agent-loops` and `loop-design`.

### Validation

- PM and Advisor reviewed the public-readiness and release-preparation work with no unresolved P0/P1 findings before release.
- Local validation checked required files, README positioning, MIT license text, security/contribution guidance, local-path and secret-pattern scans, and whitespace.
- GitHub Actions runs the local validation script.

### Boundaries

- `v0.1.1` does not mean a package-registry release exists.
- `v0.1.1` does not add unattended execution, background scheduling, automatic source mutation, automatic git exits, deployment, publication, or secret access.
- `loop-crafter` designs loop packages; execution governance remains delegated to project rules and `multi-agent-working-group` when multi-agent work is involved.

## v0.1.0 - 2026-07-08

Initial reviewed baseline for the design/review-first `loop-crafter` skill.

### Added

- Initial `SKILL.md` entrypoint.
- Core loop design references.
- V1 validation evidence.
