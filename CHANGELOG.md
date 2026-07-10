# Changelog

All notable public changes to `loop-crafter` are recorded here.

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
