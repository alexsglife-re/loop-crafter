---
validation_date: 2026-07-08
runtime: codex-cli 0.142.4
command: codex exec --ephemeral --sandbox read-only -C <repo-root>
installed_skill: <codex-home>/skills/loop-crafter
prompt: Use loop-crafter to design a report-only daily triage loop for this repo.
---

**Loop Design Package: Daily Repo Triage**

**Loop Name:** `daily-report-only-triage`

**Repository:** `<repo-root>`

**Purpose:** Produce a daily, report-only triage summary for repo health, open work, risks, and next recommended actions without mutating files, committing, pushing, publishing, or triggering automation.

**Loop Level:** L1 report loop

**Operating Mode:** Human-invoked, design/review-first, no unattended execution

**Primary Skill Layer:** `loop-crafter`

**Governance Layer:** `multi-agent-working-group`

**Source Of Truth:** `docs/loop-crafter-design.md`

**Trigger**

A human explicitly asks for daily triage, for example:

```text
Run daily report-only triage for Loop-buider.
```

The loop must not self-schedule, run in the background, or resume automatically.

**Inputs**

The loop may inspect only non-secret, repo-local evidence:

- Current branch and working tree status
- Recent commits
- Relevant project docs
- Open TODOs or known task notes
- Validation metadata, if already present
- Prior triage reports, if explicitly provided or repo-local
- User-stated priorities from the current conversation

The loop must not inspect secrets, credentials, tokens, private auth files, Keychain values, or external account state unless explicitly authorized.

**Roles**

**PM**

- Defines daily triage scope
- Identifies active workstreams
- Flags blockers, stale work, and unclear ownership
- Produces the main report recommendation

**Advisor**

- Independently reviews the PM’s triage interpretation
- Checks for scope creep, unsafe assumptions, and governance violations
- Confirms whether the report stays within L1/report-only behavior

**Worker**

- Collects read-only evidence when authorized
- Summarizes repo state
- Does not edit files, commit, push, scaffold, schedule, deploy, or publish

For this loop, PM and Advisor agreement is required before recommending any next action beyond reporting.

**Allowed Actions**

- Read repo files
- Review docs and local metadata
- Summarize current state
- Identify risks
- Recommend next steps
- Classify work by priority
- Produce a report in chat

**Disallowed Actions**

- Writing files
- Editing docs
- Creating issues, PRs, commits, tags, or releases
- Running deployment or publication steps
- Changing permissions, credentials, secrets, auth, schemas, or automation
- Starting background jobs or scheduled runners
- Treating prior authorization as current authorization

**Daily Triage Flow**

1. **Scope Check**

Confirm the loop is report-only and limited to daily triage.

2. **Evidence Collection**

Gather only read-only repo evidence relevant to:

- Working tree cleanliness
- Recent changes
- Open design or governance work
- Validation freshness
- Known blockers
- Documentation drift
- Any unresolved P0/P1 concerns

3. **PM Assessment**

PM prepares a structured assessment:

- Current repo state
- Active work
- Risk level
- Blockers
- Recommended next action

4. **Advisor Review**

Advisor independently checks:

- Whether conclusions match evidence
- Whether any recommendation exceeds report-only scope
- Whether PM missed high-risk or default-excluded actions
- Whether validation claims are fresh or merely historical

5. **Report Assembly**

Produce a single daily triage report in chat.

6. **Stop Condition**

End after reporting. Do not continue into implementation, edits, commits, pushes, publication, or automation unless the owner gives a new explicit instruction.

**Report Template**

```markdown
# Daily Triage Report

Date: YYYY-MM-DD
Repo: <repo-root>
Mode: Report-only

## Summary

- Status:
- Main risk:
- Recommended next action:

## Evidence Reviewed

- 
- 
- 

## Active Workstreams

- 
- 
- 

## Risks And Blockers

- P0:
- P1:
- P2:

## Validation State

- Fresh validation available:
- Last known validation:
- Validation gap:

## Governance Check

- Report-only boundary preserved:
- PM/Advisor agreement:
- Default-excluded actions avoided:
- Secret/copy-content concerns:

## Recommended Next Actions

1. 
2. 
3. 

## Stop Point

No files were written. No commits, pushes, deployments, publications, or background automation were performed.
```

**Priority Rules**

- `P0`: Blocks safe continuation or risks data loss, secret exposure, unauthorized external effects, destructive action, or governance violation.
- `P1`: Blocks intended development/review quality or creates likely incorrect conclusions.
- `P2`: Useful cleanup, documentation drift, or non-blocking improvement.

**Acceptance Criteria**

The loop is successful when:

- It returns exactly one daily triage report.
- All conclusions are grounded in stated evidence.
- It distinguishes fresh validation from historical validation.
- It preserves the report-only boundary.
- It does not write files or trigger external effects.
- PM and Advisor agreement is explicitly recorded.
- Any recommended implementation work is left for a separate owner-authorized task.

**Failure Conditions**

The loop must stop and report a blocker if:

- Evidence requires secret access.
- The repo state cannot be assessed without mutation.
- PM and Advisor disagree on safety or scope.
- A requested next step is default-excluded without explicit owner authorization.
- The task drifts from report-only triage into execution.
