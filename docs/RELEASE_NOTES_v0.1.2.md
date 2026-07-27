# Release Notes: v0.1.2

`v0.1.2` delivers the implemented and installed-live-validated V2 behavior for
`loop-crafter`.

## What Is Included

- `Loop Scaffold Proposal` output with explicit project scope, readiness,
  scaffold target, proposed files, content previews, evidence allowlist,
  forbidden paths/actions, validation harness, state and run-log contracts,
  human gates, required governance, and next owner decision.
- The complete scaffold write-authorization contract:
  `write_authorization_needed`, `write_authorization_status`,
  `validation_before_write`, and `validation_after_write`.
- `Loop Readiness Report`, `Scaffold Write Packet`, and
  `Validation Harness Design` outputs.
- Gate Repair Window handling with Declared File Scope, opened and expiry
  timestamps, repair-cycle and wall-clock caps, validation-only budget
  handling, forbidden actions, and fresh-review requirements.
- Anti-expansion controls covering frozen objectives, completion predicates,
  phase boundaries, current-run governance, and Next Backlog routing.

## Installed Live Validation

The installed skill has retained outcome evidence across scenarios 1-9.
Scenarios 2-8 were accepted from the initial run and were not repeated.
Provenance-backed accepted reruns for scenarios 1 and 9 used OpenAI
`codex-auto-review` in read-only ephemeral CLI sessions and passed the expected
behavior.

The validation record preserves transcript files and SHA-256 bindings. For the
initial scenarios 2-8, exact per-scenario runtime session IDs, full prompt text,
sandbox and approval metadata, and post-processing details were not preserved.
Their exact provider, model, sandbox, approval, and session configuration cannot
now be independently reconstructed. Those files are outcome evidence, not
complete runtime provenance, and this release does not claim otherwise.
During release preparation, the nine initial transcript files were normalized
only by removing trailing whitespace and extra end-of-file blank lines; their
non-whitespace answer text was not changed, and the evidence hashes were
recomputed.

The owner-authorized installed-skill sync completed during release preparation.
All nine runtime files were verified byte-identical to the repository sources.

## Validation

- `bash -n scripts/validate-local.sh`
- `./scripts/validate-local.sh`
- `git diff --check`
- Local-path and common secret-like pattern scans
- Byte-for-byte comparison of `SKILL.md`, `agents/openai.yaml`, and all seven
  files under `references/` against the installed `loop-crafter` copy

## Boundaries

- No package-registry release.
- No hosted service or deployment.
- No unattended runner or background scheduler.
- No automatic source mutation.
- No automatic commit, push, tag, release, deployment, or publication.
- No credential, secret, authentication, permission, payment, schema,
  production, destructive, or irreversible action.
- Scaffold writing remains a separate owner-authorized action and must pass
  applicable project validation and governance gates.
- `loop-crafter` designs loop packages; `multi-agent-working-group` and project
  rules govern multi-agent execution and git exits.
