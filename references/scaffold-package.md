# Scaffold Package

Use this reference when a loop design is mature enough to become a reviewable scaffold proposal.

Scaffold output is a design artifact by default. It does not write files, update state, run commands, commit, push, deploy, publish, schedule jobs, or create unattended automation.

## Required Sections

Every scaffold proposal should include:

- Loop name
- Project scope
- Readiness level
- Scaffold target
- Proposed files
- File content previews
- Evidence allowlist
- Forbidden paths and actions
- Validation harness
- State contract
- Run-log contract
- Human gates
- Required governance
- Next owner decision

## Proposed Files

Separate path planning from content:

```text
proposed_files:
  - path:
    purpose:
    new_or_existing:
    denylist_check:

file_contents_preview:
  - path:
    preview:
```

Use `proposed_files` for paths and purposes only. Use `file_contents_preview` only when draft content would help the owner review the scaffold before writing.

## Write Authorization

A scaffold proposal must state:

```text
write_authorization_needed: yes | no
write_authorization_status: not requested | requested | granted | blocked
```

Default: `write_authorization_needed: yes` when any file creation or modification is proposed.

The skill must stop before file writes unless the owner explicitly authorizes scaffold creation and the applicable project gates pass.

## Validation Before Write

Field name: `validation_before_write`.

Before any owner-approved write, identify:

- Current git status and dirty files
- Exact files to create or modify
- Whether any file is in a denylisted path or domain
- Secret/copy-content scan expectation
- PM/Advisor/Reviewer requirements when project rules require them
- Rollback or cleanup plan if a write fails

## Validation After Write

Field name: `validation_after_write`.

After owner-approved scaffold creation, identify:

- File existence checks
- Content checks for required sections
- Secret/copy-content scan result
- Any deterministic verifier command or rubric result
- PM/Advisor/Reviewer follow-up if required
- Whether commit/push remains a separate gate

## Forbidden Defaults

Do not default to:

- Automatic writes
- Source mutation outside the scoped scaffold
- Background runners or schedulers
- Commit, push, tag, release, deployment, or publication
- Credential, secret, auth, permission, payment, schema, production, or destructive actions

If a requested scaffold would require any of those actions, produce a write packet that stops for explicit owner authorization and governing workflow review.
