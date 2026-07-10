# Contributing

Thanks for considering a contribution to `loop-crafter`.

This project is a Codex skill for designing and reviewing gated agent loops. Contributions should preserve the core boundary: `loop-crafter` designs reviewable loop packages; it is not an unattended runner.

## Good First Contributions

- clarify README or reference wording
- add compact examples
- improve validation rubrics
- tighten safety and gate language
- report confusing behavior with a minimal reproduction prompt

## Before Opening A Pull Request

Please check that your change:

- keeps generated outputs reviewable before writes or external effects
- does not add background scheduling or unattended execution by default
- does not bypass owner decisions, PM/Advisor review, or project git gates
- does not introduce new required external services
- does not include secrets, credentials, tokens, private keys, local machine paths, or private account details

## Validation

There is no CI workflow yet. For documentation changes, run the relevant local checks manually:

```bash
git status --short --branch --untracked-files=all
git diff --check
rg -n "not an unattended runner" README.md SKILL.md docs references
rg -n "secret|credential|token|security" SECURITY.md CONTRIBUTING.md
```

If you add validation evidence, keep it concise and scrub local paths before committing.

## Reporting Issues

When reporting a bug or unclear behavior, include:

- what you asked Codex to do
- which files or docs you expected it to use
- what output was missing, unsafe, or unclear
- whether the issue is about design, scaffold proposal, readiness, validation, or governance handoff

Do not include secrets, credentials, tokens, private keys, private transcripts, or sensitive local environment details.
