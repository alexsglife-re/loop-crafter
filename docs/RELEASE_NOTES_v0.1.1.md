# Release Notes: v0.1.1

`v0.1.1` is the first public baseline release for `loop-crafter`.

It packages the current Codex skill, public README, MIT license, community files, publication-readiness notes, and the accepted V2 requirements/readiness documentation.

## What This Release Is

`loop-crafter` is a Codex skill for designing unattended-ready agent loops with evidence, gates, state, and validated exits.

This release makes the project understandable and reusable as a local skill source. It is meant for developers and maintainers who want recurring agent workflows to be explicit before they become scaffolds, automation, or repository changes.

## What Is Included

- `SKILL.md` for the Codex skill entrypoint.
- `references/` for loop design, safety, scaffold package design, readiness scoring, validation harness design, and examples.
- `agents/openai.yaml` metadata.
- `README.md` with quickstart and public positioning.
- `LICENSE`, `CONTRIBUTING.md`, and `SECURITY.md`.
- `docs/loop-crafter-v2-requirements.md` documenting the accepted V2 requirements package.
- `docs/PUBLICATION_READINESS.md` documenting public-readiness state and remaining gates.
- `assets/social-preview.png` for repository/README visual identity.

## What Is Intentionally Not Included

- No package-registry release.
- No CI workflow.
- No hosted service or deployment.
- No unattended runner.
- No background scheduler.
- No automatic commit, push, tag, release, deployment, or publication behavior.
- No secret, credential, auth, permission, payment, schema, production, or destructive actions.

## How To Try It

Clone the repository and copy the skill into a local Codex skills directory:

```bash
git clone https://github.com/alexsglife-re/loop-crafter.git
cd loop-crafter
mkdir -p "$HOME/.codex/skills/loop-crafter"
cp -R SKILL.md agents references "$HOME/.codex/skills/loop-crafter/"
```

Then ask Codex:

```text
Use loop-crafter to design an unattended-ready loop for a recurring repository task.
Define the goal, evidence, state, validation, budget, stop conditions, and owner gates.
```

## Validation Status

Before this release:

- Public-readiness docs and metadata were reviewed by PM and Advisor gates.
- README positioning and social preview asset were reviewed by PM and Advisor gates.
- Release packet was reviewed by PM and Advisor gates.
- Local path and common secret-pattern scans passed.
- `git diff --check` passed.

No CI workflow exists yet.

## Recommended Next Steps

- Add a lightweight local validation script.
- Add examples that show full loop design packets for common recurring tasks.
- Validate a fresh install path from the public repository.
- Prepare external launch posts only after exact owner authorization for each platform and content.
