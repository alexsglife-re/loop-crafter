# loop-crafter

`loop-crafter` is a review-first Codex skill for designing safe, gated agent loops before they become scaffolds, automation, or repository changes.

It is for developers and maintainers who use Codex on recurring workflows and want the loop's goal, evidence, roles, validation, state, human gates, and stop conditions written down before work starts.

## What It Solves

Long-running agent work often drifts when the workflow is not explicit. A loop can start as "keep going until done" and slowly blur scope, validation, approval, or publication boundaries.

`loop-crafter` helps turn that recurring workflow into a reviewable package:

- what the loop is trying to finish
- what evidence the agent may inspect
- which roles are involved
- what actions are allowed or forbidden
- how success and failure are validated
- where state and run evidence should live
- when a human decision or PM/Advisor gate is required

## Maturity

Current status: early open-source preparation.

- V1 is design/review-first.
- V2 requirements are documented as `v0.1.1`.
- V2 adds scaffold proposals, readiness reports, and validation harness designs.
- V2 remains review-first and does not make scaffold writing the default.

There is no published release, tag, package registry entry, or CI workflow yet.

## Quickstart

Use this repository as a local Codex skill source.

```bash
git clone https://github.com/alexsglife-re/loop-crafter.git
cd loop-crafter
```

The clone command works for users who have repository access now, and for everyone after the owner separately authorizes making the repository public.

To install it into a local Codex skills directory, copy the repository contents into a skill folder named `loop-crafter`.

```bash
mkdir -p "$HOME/.codex/skills/loop-crafter"
cp -R SKILL.md agents references "$HOME/.codex/skills/loop-crafter/"
```

Then ask Codex to use `loop-crafter` when designing or reviewing a recurring workflow.

Example prompt:

```text
Use loop-crafter to design a review-first loop for preparing a release note.
The loop may read git history and validation docs, but it must not tag,
publish, deploy, or push without owner approval.
```

## Typical Outputs

`loop-crafter` can produce:

- loop design packages
- scaffold proposals
- readiness reports
- validation harness designs
- scaffold write packets that stop for owner authorization

These outputs are meant to be reviewed before any file write, commit, push, deployment, release, or publication.

## What It Does Not Do

`loop-crafter` is not an unattended runner.

It does not:

- schedule background work
- run recurring jobs by itself
- mutate source files by default
- commit, push, tag, release, deploy, or publish by default
- read secrets or credentials
- replace project governance or PM/Advisor review

When a loop needs multi-agent governance, `loop-crafter` designs the loop package and `multi-agent-working-group` controls execution governance.

## Repository Map

- `SKILL.md`: Codex skill entrypoint.
- `references/`: loop design, scaffold, readiness, safety, validation, and example references.
- `agents/openai.yaml`: agent-facing metadata.
- `docs/loop-crafter-design.md`: design source for the initial skill.
- `docs/loop-crafter-v2-requirements.md`: V2 requirements package.
- `docs/validation/`: validation evidence and review packets.

## Validation

The current repository uses document and transcript validation rather than CI.

Key validation areas:

- scaffold proposal output
- readiness report output
- validation harness design output
- safety gates for unsafe scaffold or publication requests
- routing multi-agent execution governance back to `multi-agent-working-group`

## Contributing

Contributions should keep the skill review-first, conservative, and easy to inspect. Start with `CONTRIBUTING.md` and avoid adding automation, publishing behavior, or external side effects without a reviewed design and explicit owner authorization.

## Security

Do not include secrets, credentials, tokens, private keys, local machine paths, or private account details in issues, examples, transcripts, or pull requests. See `SECURITY.md`.
