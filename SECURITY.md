# Security

`loop-crafter` is a workflow-design skill. It should not require secrets, credentials, tokens, private keys, browser data, Keychain data, production access, or private account data.

## Please Do Not Disclose Secrets

Do not put secrets, credentials, tokens, private keys, passwords, private local paths, or private account details in:

- GitHub issues
- pull requests
- examples
- validation transcripts
- discussion posts
- copied prompts

If a report requires sensitive detail, first open a minimal issue asking for a private reporting channel. Do not include the sensitive detail in the public issue.

## What To Report

Please report cases where `loop-crafter` appears to:

- encourage reading or exposing secrets
- bypass owner approval or PM/Advisor gates
- authorize commit, push, tag, release, deployment, or publication without explicit approval
- blur the boundary between loop design and unattended execution
- include private local paths or account details in public-facing output

## Current Security Posture

This project is early and document-driven. It has no production service, hosted backend, package registry release, or CI workflow yet.

Security-sensitive changes should be reviewed conservatively and should include clear validation evidence.
