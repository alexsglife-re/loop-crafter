# loop-crafter V2 Installed Live Validation

## Result

- Scenarios 1-9 coverage: complete through the initial nine live calls.
- Scenarios 2-8 were accepted from the initial run and were not repeated.
- Scenarios 1 and 9 were the only scenarios repeated after the initial run.
- Scenario 9 passed its single rerun on 2026-07-26 PDT.
- Scenario 1 required two corrective reruns after review found incomplete
  scaffold-field coverage; the final raw-answer output is the accepted
  Scenario 1 evidence.
- Skill target: installed `loop-crafter` at `~/.codex/skills/loop-crafter/SKILL.md`.
- Provenance-backed accepted reruns: OpenAI `codex-auto-review`, read-only
  ephemeral Codex CLI sessions.
- No extra live repeats were performed.
- No commit, push, tag, release, or installed-skill sync was performed by that validation closeout.
- This record does not claim a public `v0.1.2` release.
- Repository `references/examples.md` was later synchronized byte-identically
  to the installed copy during separately owner-authorized `v0.1.2` release
  preparation. All nine installed runtime files matched after that sync.

## Source Evidence

The initial run established that all nine live calls completed. Scenarios 2-8
remain the accepted outputs from that run and were not repeated. The source
task/thread ID and exact per-scenario runtime session IDs were not preserved and
are therefore not claimed here. Their exact prompt text, sandbox, approval mode,
and post-processing details were not preserved either; the initial files are
outcome evidence, not complete runtime provenance. Their exact provider, model,
sandbox, approval, and session configuration cannot now be independently
reconstructed.

During `v0.1.2` release preparation, the nine initial transcript files were
normalized only by removing trailing whitespace and extra end-of-file blank
lines so the full staged diff passes whitespace validation. Their
non-whitespace answer text was not changed, and the SHA-256 table below was
recomputed from the normalized files.

The first Scenario 1 rerun identifies itself as superseded audit evidence. The
intermediate corrective rendering was replaced because it was incomplete and
not raw. The
raw-answer `scenario-01-output-v2.md` and the single Scenario 9 rerun are the
accepted outputs. The original Scenario 9 transcript was sanitized only by
replacing an absolute local link with its repository-relative target.

| Evidence | SHA-256 |
| --- | --- |
| `transcripts/live-v2-installed-20260726/scenario-01-output.md` | `415f37eea19d7675e3f7a17133da83f68a6422336ce0a6f4a9c86bd05d1d890b` |
| `transcripts/live-v2-installed-20260726/scenario-02-output.md` | `cf3396785cf8d296519b819d69ccc284c1dcdab344d4a62f5cce442694be1856` |
| `transcripts/live-v2-installed-20260726/scenario-03-output.md` | `43cdfa7e985458633b258e982fd6ccd655abd852d808475791b8f6311ae55087` |
| `transcripts/live-v2-installed-20260726/scenario-04-output.md` | `e238a93ad701d23b69d8db43ceda3eb0ebeb1d79dd10307d85551a4586a0257b` |
| `transcripts/live-v2-installed-20260726/scenario-05-output.md` | `07d55d81e98eccb9d81cc99da342eca8dcf3aec313ebcbd54da367e480edbd16` |
| `transcripts/live-v2-installed-20260726/scenario-06-output.md` | `1f908c5f938739b42d3a8cde3fa140314a6a06a187a07945d6fe1b506145cbbf` |
| `transcripts/live-v2-installed-20260726/scenario-07-output.md` | `daa18fe5b3a3063a60e44ceb67d228256ddcac698ea4abf03911f29caa73bc7b` |
| `transcripts/live-v2-installed-20260726/scenario-08-output.md` | `7d0a27f2fda6317b276b94bb5a32c0067d32455ee2558bf12fd8fb2268b579e5` |
| `transcripts/live-v2-installed-20260726/scenario-09-output.md` | `ed3261ef34854646be3f24cc33416043c3cc5abbbbdb3a483d82bb833474689d` |
| `transcripts/live-v2-installed-20260726-rerun-s1-s9/scenario-01-output-v2.md` | `ed11a955893e8ea32fd668269413f60e78b5f4ca263088b6b58174019ae2e335` |
| `transcripts/live-v2-installed-20260726-rerun-s1-s9/scenario-01-output.md` | `5263551ab61e89b6a637fc17cbf09f32633cbcc769a2b9f32f82f1be67fa4113` |
| `transcripts/live-v2-installed-20260726-rerun-s1-s9/scenario-09-output.md` | `5a4d1251d8cce191602a2cdeab077e5de16f35b8c2a3385084228ae185863238` |

## Release Target Fingerprint Recipe

The `v0.1.2` release-review target is reproducible from repository bytes. Emit
standard `shasum -a 256` lines for these 21 files in repository-relative
lexicographic order, then SHA-256 the emitted text:

1. `CHANGELOG.md`
2. `README.md`
3. `docs/PUBLICATION_READINESS.md`
4. `docs/RELEASE_NOTES_v0.1.2.md`
5. `docs/loop-crafter-v2-requirements.md`
6. `docs/validation/loop-crafter-v2-behavior-validation.md`
7. `docs/validation/loop-crafter-v2-installed-live-validation.md`
8. `docs/validation/transcripts/live-v2-installed-20260726-rerun-s1-s9/scenario-01-output-v2.md`
9. `docs/validation/transcripts/live-v2-installed-20260726-rerun-s1-s9/scenario-01-output.md`
10. `docs/validation/transcripts/live-v2-installed-20260726-rerun-s1-s9/scenario-09-output.md`
11. `docs/validation/transcripts/live-v2-installed-20260726/scenario-01-output.md`
12. `docs/validation/transcripts/live-v2-installed-20260726/scenario-02-output.md`
13. `docs/validation/transcripts/live-v2-installed-20260726/scenario-03-output.md`
14. `docs/validation/transcripts/live-v2-installed-20260726/scenario-04-output.md`
15. `docs/validation/transcripts/live-v2-installed-20260726/scenario-05-output.md`
16. `docs/validation/transcripts/live-v2-installed-20260726/scenario-06-output.md`
17. `docs/validation/transcripts/live-v2-installed-20260726/scenario-07-output.md`
18. `docs/validation/transcripts/live-v2-installed-20260726/scenario-08-output.md`
19. `docs/validation/transcripts/live-v2-installed-20260726/scenario-09-output.md`
20. `references/examples.md`
21. `scripts/validate-local.sh`

The digest is intentionally reported in the independent review record rather
than embedded here, because embedding it in an input file would change the
digest itself.
