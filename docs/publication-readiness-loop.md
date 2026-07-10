# loop-crafter Public Readiness Loop

## Purpose

Prepare `loop-crafter` for open-source visibility and later promotion without accidentally publishing, changing public metadata, creating releases, or posting externally before owner approval.

This loop uses:

- `open-source-project-promotion` for repository readiness, positioning, and launch asset preparation.
- `loop-crafter` for loop structure, gates, validation, state, and stop conditions.
- `multi-agent-working-group` for PM/Advisor review, commit, push, and publication gates.

## Current Baseline

- Repository: `https://github.com/alexsglife-re/loop-crafter`
- Local path: `<repo-root>`
- Current repo visibility: private
- Current branch: `master`
- Current HEAD at loop creation: `e1edcc4efe542d412746f76c1efe252c5f02785c`
- CI state: no `.github/workflows` currently present
- Current public-readiness gaps:
  - no `README.md`
  - no `LICENSE`
  - no `CONTRIBUTING.md`
  - no `SECURITY.md`
  - no public release/version story
  - GitHub description, topics, homepage, and license metadata are empty
  - tracked validation docs and transcripts include local path provenance

## Non-Goals

This loop does not authorize:

- changing repository visibility from private to public
- editing GitHub description, topics, homepage, social preview, settings, Discussions, Wiki, Pages, labels, templates, or branch protection
- creating tags or GitHub Releases
- posting to Hacker News, Reddit, X, LinkedIn, Product Hunt, blogs, newsletters, or other external platforms
- scheduling any post
- deployment or public publication outside the separately authorized gates
- reading, printing, or storing secrets, tokens, credentials, Keychain values, or browser data

## Owner Decisions Needed Before Work Starts

The loop can draft recommendations for these items, but it should not finalize or publish them until the owner decides.

### License

Owner must choose the license before the project can be meaningfully open-sourced.

Recommended default: `MIT`, because this is a small developer workflow/skill package intended for broad reuse.

Decision needed:

```text
Use MIT license for loop-crafter.
```

### Public Repository Name And Positioning

Current name is `loop-crafter`. Public positioning should stay narrow and factual.

Recommended positioning:

```text
loop-crafter is a review-first Codex skill for designing safe, gated agent loops before they become scaffolds, automation, or repository changes.
```

Decision needed:

```text
Use this public positioning as the README and GitHub description baseline.
```

### Public Documentation Scope

The owner should decide whether detailed local validation transcripts remain tracked publicly or are moved, summarized, or scrubbed.

Recommended default: keep concise validation summaries public, but move or scrub detailed local transcripts before making the repo public.

Decision needed:

```text
Scrub or summarize local-path validation transcripts before public visibility.
```

## Preauthorization Boundaries

The owner may preauthorize low-risk repository documentation work, but not external effects.

Recommended preauthorization for this loop:

```text
Authorize Codex to create or edit README.md, LICENSE, CONTRIBUTING.md, SECURITY.md, docs/PUBLICATION_READINESS.md, and draft metadata/promotion files in this private repo, with PM/Advisor review and normal git gates before commit/push.
```

`LICENSE` may only be created after the owner chooses the license. The recommended `MIT` default is a recommendation, not authorization.

Every Phase 1 implementation milestone must use `multi-agent-working-group` governance from the start. PM/Advisor review is required for milestone acceptance and for any normal commit/push gate.

This does not authorize:

- making the repo public
- editing GitHub metadata
- creating tags/releases
- publishing or scheduling posts
- deleting tracked validation evidence
- moving local transcripts out of git history

Those require later explicit owner authorization naming the action.

## State, Budget, And Recovery

Loop state:

- Active plan: `docs/publication-readiness-loop.md`
- Readiness run log and current state: `docs/PUBLICATION_READINESS.md`
- Draft promotion assets, if created: `docs/promotion/*.md`
- Current baseline must be refreshed before each milestone with `git status`, current `HEAD`, and read-only GitHub metadata.

Stale-state rule:

- If `HEAD`, repository visibility, GitHub metadata, or public-facing files change outside this loop, stop and refresh the readiness baseline before continuing.

Budget:

- One repair cycle is allowed for a failed validation or PM/Advisor P1 before rerunning review.
- Stop and ask the owner if the same P1 recurs after one repair cycle, if a license/public-positioning decision is missing, or if cleanup requires deleting/moving tracked evidence.
- Follow the owner rollover rule after five completed loop/spec milestones if the work has not finished.

Recovery:

- On validation failure, preserve evidence, fix only the scoped issue, and rerun the full validation block.
- On PM/Advisor disagreement, stop and resolve the disagreement in the plan before implementation.
- On suspected secret exposure, stop immediately; do not print the suspected value; report only the file path and pattern category.

## Evidence Inputs

Allowed evidence:

- `AGENTS.md`
- `SKILL.md`
- `agents/openai.yaml`
- `references/*.md`
- `docs/loop-crafter-design.md`
- `docs/loop-crafter-v2-requirements.md`
- `docs/validation/*.md`
- `docs/validation/transcripts/*.md`
- `.gitignore`
- `git status`, `git log`, `git ls-files`, `git diff`, `git show`
- GitHub metadata read via `gh repo view`

Forbidden evidence:

- secrets, tokens, credentials, Keychain values, browser data
- unrelated local projects
- private personal notes not explicitly needed for this repo

## Output Files

Expected files for Phase 1:

- `README.md`
- `LICENSE`
- `CONTRIBUTING.md`
- `SECURITY.md`
- `docs/PUBLICATION_READINESS.md`
- optional `docs/promotion/metadata-draft.md`
- optional `docs/promotion/channel-drafts.md`

Do not create release notes, tag files, or platform posting packets unless the owner asks for them.

## Milestones

### Milestone 0: Readiness Baseline

Goal: capture current public-readiness state.

Steps:

1. Verify git state and current GitHub metadata.
2. List missing public-facing files.
3. Identify local path/provenance risks.
4. Record claim safety and publication authorization state.

Acceptance:

- `docs/PUBLICATION_READINESS.md` states what is verified, unverified, missing, and blocked.
- No public action is taken.

### Milestone 1: Public README

Goal: make the first screen understandable to a new visitor.

Required content:

- project name
- one-sentence pitch
- who it is for
- what problem it solves
- quickstart or install path
- minimal usage examples
- what it does not do
- maturity and validation status

Acceptance:

- README avoids hype and unsupported claims.
- README clearly says `loop-crafter` is not an unattended runner.

### Milestone 2: License And Community Basics

Goal: add basic reuse and contributor trust signals.

Files:

- `LICENSE`
- `CONTRIBUTING.md`
- `SECURITY.md`

Acceptance:

- license matches owner decision.
- contribution guidance is lightweight and honest.
- security guidance tells users not to disclose secrets in issues.

### Milestone 3: Public Evidence Cleanup

Goal: remove or summarize material that should not be exposed in a public repo.

Checks:

- local paths such as `<local-home>/...`
- detailed transcript provenance
- private workflow internals not useful to users
- secret-pattern false positives

Acceptance:

- public docs do not expose unnecessary local machine paths.
- validation evidence remains useful without exposing private environment details.

### Milestone 4: Metadata And Promotion Drafts

Goal: prepare owner-reviewed draft assets without changing public metadata or posting externally.

Drafts:

- GitHub description
- GitHub topics
- README social/share blurb
- Show HN draft
- Reddit draft
- short X/LinkedIn draft

Acceptance:

- every draft is labeled `draft only`.
- every external action lists the exact owner authorization required.

### Milestone 5: PM/Advisor Review And Git Gate

Goal: review and commit/push the private repo readiness work when safe.

Acceptance:

- PM and Advisor find no unresolved P0/P1.
- validation is fresh.
- secret/copy-content scan passes.
- normal commit/push gates pass if the owner has authorized git exit.

## Validation Commands

Run before review and git gates. Use `bash` for this block. Blocking checks must fail closed; advisory discovery scans must be labeled separately.

```bash
set -euo pipefail

git status --short --branch --untracked-files=all
test -f README.md
test -f LICENSE
test -f CONTRIBUTING.md
test -f SECURITY.md
test -f docs/PUBLICATION_READINESS.md
rg -q "loop-crafter|review-first|Codex|agent loops|not an unattended runner|multi-agent-working-group" README.md
rg -q "not an unattended runner" README.md
rg -q "MIT License|Permission is hereby granted" LICENSE
rg -q "secret|credential|token|security" SECURITY.md
rg -q "secret|credential|token|security" CONTRIBUTING.md
rg -q "requires owner authorization|repository visibility|GitHub metadata|external posting" docs/PUBLICATION_READINESS.md
public_files=(README.md LICENSE CONTRIBUTING.md SECURITY.md docs/PUBLICATION_READINESS.md)
promotion_files=()
if test -d docs/promotion; then
  shopt -s nullglob
  promotion_files=(docs/promotion/*.md)
  shopt -u nullglob
  if ((${#promotion_files[@]})); then
    public_files+=("${promotion_files[@]}")
  fi
fi
home_path_pattern="/Users/[^[:space:]/]+|/home/[^[:space:]/]+"
secret_env_pattern="(GITHUB_PAT_TOKEN|OPENAI_API_KEY|ANTHROPIC_API_KEY)="
private_key_pattern="BEGIN (RSA|OPENSSH|PRIVATE) KEY"
password_pattern="password[[:space:]]*="
if rg -l "$home_path_pattern|$secret_env_pattern|$private_key_pattern|$password_pattern" "${public_files[@]}"; then
  exit 1
else
  rg_status=$?
  if ((rg_status > 1)); then
    exit "$rg_status"
  fi
fi
for promotion_file in "${promotion_files[@]}"; do
  rg -q "draft only" "$promotion_file"
  rg -q "requires owner authorization|external posting" "$promotion_file"
done
git diff --check
```

Advisory discovery before Milestone 3 may scan existing private validation evidence for local-path provenance, but the result is evidence for cleanup planning rather than a pass condition:

```bash
rg -n "/Users/[^[:space:]/]+|/home/[^[:space:]/]+|<local-home>|<legacy-home>|<repo-root>|<codex-home>" docs/validation docs/publication-readiness-loop.md
```

Expected:

- required files exist
- README has clear positioning and boundary language
- license is present
- security/contribution docs warn against secret disclosure
- draft promotion assets are labeled as draft-only if created
- local path scan has no output in public-facing files, except explicitly retained private validation evidence before cleanup
- no whitespace errors

## Stop Conditions

Stop before proceeding when:

- owner has not chosen a license
- owner has not accepted public positioning
- public docs still expose unnecessary local paths
- PM or Advisor reports unresolved P0/P1
- validation fails
- a proposed action would change repo visibility, GitHub metadata, create a tag/release, publish externally, or schedule a post without exact owner authorization
- secret/copy-content scan finds suspected real secrets or copied external content

## Authorization State

Current authorization:

- allowed: prepare this loop plan and draft public-readiness repo work
- not yet authorized: repository visibility change, GitHub metadata edit, tag/release, external posting, scheduling, deployment, destructive changes

Owner confirmation needed before Phase 1 implementation:

1. License choice, recommended `MIT`.
2. Public positioning baseline, recommended wording above.
3. Whether to scrub/summarize tracked validation transcripts before publication.
4. Whether normal commit/push is authorized after PM/Advisor review and validation.
