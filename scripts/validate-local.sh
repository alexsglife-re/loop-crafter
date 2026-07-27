#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

require_file() {
  [[ -f "$1" ]] || fail "missing required file: $1"
}

require_match() {
  local pattern="$1"
  shift
  rg -q "$pattern" "$@" || fail "missing pattern '$pattern' in $*"
}

require_match_all() {
  local pattern="$1"
  shift
  [[ "$#" -ge 1 ]] || fail "require_match_all: no files for '$pattern'"
  local file
  for file in "$@"; do
    rg -q "$pattern" "$file" || fail "missing pattern '$pattern' in $file"
  done
}

require_section_match() {
  local file="$1"
  local start="$2"
  local end="$3"
  local pattern="$4"
  local section
  section="$(
    awk -v start="$start" -v end="$end" '
      $0 == start { in_section = 1; saw_start = 1 }
      in_section && $0 == end { saw_end = 1; exit }
      in_section { print }
      END {
        if (!saw_start || !saw_end) {
          exit 2
        }
      }
    ' "$file"
  )" || fail "missing section boundary '$start' -> '$end' in $file"
  printf '%s\n' "$section" | rg -q "$pattern" ||
    fail "missing pattern '$pattern' in section '$start' of $file"
}

require_after_match() {
  local file="$1"
  local start="$2"
  local pattern="$3"
  local tail
  tail="$(
    awk -v start="$start" '
      $0 == start { in_tail = 1; saw_start = 1; next }
      in_tail { print }
      END {
        if (!saw_start) {
          exit 2
        }
      }
    ' "$file"
  )" || fail "missing tail boundary '$start' in $file"
  printf '%s\n' "$tail" | rg -q "$pattern" ||
    fail "missing pattern '$pattern' after '$start' in $file"
}

require_file AGENTS.md
require_file README.md
require_file SKILL.md
require_file agents/openai.yaml
require_file LICENSE
require_file CONTRIBUTING.md
require_file SECURITY.md
require_file CHANGELOG.md
require_file docs/RELEASE_NOTES_v0.1.1.md
require_file docs/RELEASE_NOTES_v0.1.2.md
require_file docs/PUBLICATION_READINESS.md
require_file docs/anti-expansion-governance-refinement-loop.md
require_file docs/loop-crafter-v2-requirements.md
require_file docs/validation/loop-crafter-v2-behavior-validation.md
require_file docs/validation/loop-crafter-v2-installed-live-validation.md
require_file assets/social-preview.png

require_match 'loop-crafter' SKILL.md README.md agents/openai.yaml
require_match 'Design unattended-ready agent loops' README.md
require_match 'owner-authorized autonomous runs' README.md
require_match 'execute unattended runs' README.md
require_match 'Current public release: `v0.1.2`' README.md
require_match 'MIT License' LICENSE
require_match 'secret|credential|token|security' SECURITY.md CONTRIBUTING.md
require_match_all 'v0.1.1' CHANGELOG.md docs/RELEASE_NOTES_v0.1.1.md docs/PUBLICATION_READINESS.md docs/loop-crafter-v2-requirements.md
require_match_all 'v0.1.2' README.md CHANGELOG.md docs/RELEASE_NOTES_v0.1.2.md docs/PUBLICATION_READINESS.md docs/loop-crafter-v2-requirements.md
require_match 'No package-registry release' docs/RELEASE_NOTES_v0.1.1.md
require_match 'No unattended runner' docs/RELEASE_NOTES_v0.1.1.md
require_match 'No package-registry release' docs/RELEASE_NOTES_v0.1.2.md
require_match 'No unattended runner' docs/RELEASE_NOTES_v0.1.2.md
require_match 'No automatic commit, push, tag, release, deployment, or publication' docs/RELEASE_NOTES_v0.1.2.md
require_match 'ungated unattended execution' docs/PUBLICATION_READINESS.md
require_match 'multi-agent-working-group' SKILL.md README.md AGENTS.md
require_match_all 'Goal Freeze' SKILL.md references/loop-design-checklist.md references/readiness-model.md docs/loop-crafter-v2-requirements.md
require_match_all 'Authorized Objective Continuation' SKILL.md references/loop-design-checklist.md references/readiness-model.md docs/loop-crafter-v2-requirements.md
require_match_all 'Completion Predicate' SKILL.md references/loop-design-checklist.md references/readiness-model.md docs/loop-crafter-v2-requirements.md docs/anti-expansion-governance-refinement-loop.md
require_match_all 'Phase Boundary' SKILL.md references/loop-design-checklist.md references/readiness-model.md docs/loop-crafter-v2-requirements.md
require_match_all 'No Self-Governance Expansion' SKILL.md references/loop-design-checklist.md references/readiness-model.md docs/loop-crafter-v2-requirements.md
require_match_all 'Next Backlog' SKILL.md references/loop-design-checklist.md references/safety-and-gates.md references/readiness-model.md docs/loop-crafter-v2-requirements.md docs/anti-expansion-governance-refinement-loop.md
require_match_all 'gate set in force at startup' SKILL.md references/loop-design-checklist.md references/safety-and-gates.md docs/loop-crafter-v2-requirements.md docs/anti-expansion-governance-refinement-loop.md
require_match_all 'Frozen objective' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/scaffold-package.md
require_match_all 'Objective category' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/scaffold-package.md references/examples.md
require_match_all 'Startup gate-set snapshot' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/scaffold-package.md
require_match_all 'Completion predicate' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/scaffold-package.md references/examples.md
require_match_all 'Gate Repair Window' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/loop-design-checklist.md references/readiness-model.md references/safety-and-gates.md references/scaffold-package.md references/examples.md docs/anti-expansion-governance-refinement-loop.md docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Declared File Scope' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/scaffold-package.md references/examples.md docs/anti-expansion-governance-refinement-loop.md docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'repair-window opened' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/scaffold-package.md references/examples.md docs/anti-expansion-governance-refinement-loop.md docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'repair-window expires' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/scaffold-package.md references/examples.md docs/anti-expansion-governance-refinement-loop.md docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'repair-cycle cap' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/loop-design-checklist.md references/scaffold-package.md references/examples.md docs/anti-expansion-governance-refinement-loop.md docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'wall-clock cap' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/loop-design-checklist.md references/scaffold-package.md references/examples.md docs/anti-expansion-governance-refinement-loop.md docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'validation-only budget handling' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/loop-design-checklist.md references/scaffold-package.md references/examples.md docs/anti-expansion-governance-refinement-loop.md docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'repair-window forbidden actions' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/loop-design-checklist.md references/scaffold-package.md references/examples.md docs/anti-expansion-governance-refinement-loop.md docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'fresh-review requirement' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/loop-design-checklist.md references/scaffold-package.md references/examples.md docs/anti-expansion-governance-refinement-loop.md docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Objective Amendments' SKILL.md references/loop-design-checklist.md references/safety-and-gates.md docs/loop-crafter-v2-requirements.md docs/anti-expansion-governance-refinement-loop.md
require_match_all 'Declared File Scope' docs/anti-expansion-governance-refinement-loop.md
require_match_all 'repair-cycle cap and a wall-clock cap' references/safety-and-gates.md
require_match_all 'remain subject to the wall-clock cap' references/safety-and-gates.md references/examples.md
require_match_all 'Validation-coverage repairs must be additive or coverage-preserving' references/safety-and-gates.md
require_match_all 'Next Backlog' SKILL.md docs/loop-crafter-design.md docs/loop-crafter-v2-requirements.md references/scaffold-package.md references/examples.md
require_match_all 'Frozen objective' references/examples.md
require_match_all 'Startup gate-set snapshot' references/examples.md
scaffold_fields=(
  'Loop name'
  'Project scope'
  'Readiness level'
  'Scaffold target'
  'Proposed files'
  'File content previews'
  'Evidence allowlist'
  'Forbidden paths( and actions|/actions)'
  'Validation harness'
  'State contract'
  'Run-log contract'
  'Human gates'
  'Required governance'
  'Next owner decision'
)
for field in "${scaffold_fields[@]}"; do
  require_section_match docs/loop-crafter-v2-requirements.md \
    '### Output A: Scaffold Proposal' '### Output B: Readiness Report' "$field"
  require_section_match references/examples.md \
    '## V2 Scaffold Proposal' '## V2 Readiness Report' "$field"
  require_section_match references/scaffold-package.md \
    '## Required Sections' '## Proposed Files' "$field"
done

write_fields=(
  'write_authorization_needed'
  'write_authorization_status'
  'validation_before_write'
  'validation_after_write'
)
for field in "${write_fields[@]}"; do
  require_section_match docs/loop-crafter-v2-requirements.md \
    '### Output A: Scaffold Proposal' '### Output B: Readiness Report' "$field"
  require_section_match references/examples.md \
    '## V2 Scaffold Proposal' '## V2 Readiness Report' "$field"
  require_match_all "$field" references/scaffold-package.md
done

accepted_scenario_one=docs/validation/transcripts/live-v2-installed-20260726-rerun-s1-s9/scenario-01-output-v2.md
accepted_scenario_one_fields=(
  'Loop name:'
  'Project scope:'
  'Readiness level:'
  'Scaffold target:'
  'Frozen objective:'
  'Objective category:'
  'Startup gate-set snapshot:'
  'Completion predicate:'
  'Gate Repair Window:'
  'Declared File Scope:'
  'repair-window opened:'
  'repair-window expires:'
  'repair-cycle cap:'
  'wall-clock cap:'
  'validation-only budget handling:'
  'repair-window forbidden actions:'
  'fresh-review requirement:'
  'Proposed files:'
  'File content previews:'
  'Evidence allowlist:'
  'Forbidden paths/actions:'
  'Validation harness:'
  'State contract:'
  'Run-log contract:'
  'Human gates:'
  'Required governance:'
  'write_authorization_needed:'
  'write_authorization_status:'
  'validation_before_write:'
  'validation_after_write:'
  'Next Backlog:'
  'Next owner decision:'
)
for field in "${accepted_scenario_one_fields[@]}"; do
  require_after_match "$accepted_scenario_one" '## Output' "^${field}"
done
require_match_all 'current-run effective governance' SKILL.md references/loop-design-checklist.md references/safety-and-gates.md docs/loop-crafter-v2-requirements.md docs/anti-expansion-governance-refinement-loop.md
require_match_all 'future governance artifacts' SKILL.md references/loop-design-checklist.md references/safety-and-gates.md docs/loop-crafter-v2-requirements.md docs/anti-expansion-governance-refinement-loop.md docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Startup Gate-Set Snapshot' docs/anti-expansion-governance-refinement-loop.md
require_match_all 'PM/Advisor recovery' docs/anti-expansion-governance-refinement-loop.md
require_match_all 'Same-Objective Continuation' docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Unnecessary Polish Backlog' docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Category Crossing Stop' docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Governance Refinement Cannot Rewrite Active Rules' docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Gate Repair Window' docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Do not ask for owner confirmation merely because the next step came from PM, Advisor, Leader, or Reviewer' docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Stop/report because the Completion Predicate is satisfied' docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Classify release as a new objective category and a default-excluded action' docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Do not apply newly edited gate text as current-run authority' docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Do not consume a full repair cycle for validation-only repairs unless the owner says otherwise' docs/validation/loop-crafter-v2-behavior-validation.md
require_match_all 'Stop if the repair would cross objective categories, relax current-run effective governance, add a default-excluded action, or exceed the Gate Repair Window' docs/validation/loop-crafter-v2-behavior-validation.md
require_section_match references/examples.md '## Anti-Expansion Governance Refinement' '## V2 Scaffold Proposal' 'Gate Repair Window'
require_section_match references/examples.md '## Anti-Expansion Governance Refinement' '## V2 Scaffold Proposal' 'Declared File Scope'
require_section_match references/examples.md '## Anti-Expansion Governance Refinement' '## V2 Scaffold Proposal' 'repair-window opened'
require_section_match references/examples.md '## Anti-Expansion Governance Refinement' '## V2 Scaffold Proposal' 'repair-window expires'
require_section_match references/examples.md '## Anti-Expansion Governance Refinement' '## V2 Scaffold Proposal' 'repair-cycle cap'
require_section_match references/examples.md '## Anti-Expansion Governance Refinement' '## V2 Scaffold Proposal' 'wall-clock cap'
require_section_match references/examples.md '## Anti-Expansion Governance Refinement' '## V2 Scaffold Proposal' 'validation-only budget handling'
require_section_match references/examples.md '## Anti-Expansion Governance Refinement' '## V2 Scaffold Proposal' 'repair-window forbidden actions'
require_section_match references/examples.md '## Anti-Expansion Governance Refinement' '## V2 Scaffold Proposal' 'fresh-review requirement'
require_match_all 'repair-window opened:' docs/anti-expansion-governance-refinement-loop.md
require_match_all 'repair-window expires:' docs/anti-expansion-governance-refinement-loop.md
require_match_all 'Scenarios 1-9 coverage: complete' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'Scenarios 1 and 9 were the only scenarios repeated after the initial run' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'Scenario 1 required two corrective reruns' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'Skill target: installed `loop-crafter`' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'Provenance-backed accepted reruns: OpenAI `codex-auto-review`' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'No extra live repeats were performed' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'No commit, push, tag, release, or installed-skill sync was performed' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'does not claim a public `v0.1.2` release' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'exact per-scenario runtime session IDs were' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'task/thread ID and exact per-scenario' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'are therefore not claimed here' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'prompt text,' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'post-processing details were not preserved' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'cannot now be independently' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'normalized only by removing trailing whitespace' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'Repository `references/examples.md` was later synchronized byte-identically' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'All nine installed runtime files matched after that sync' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'Release Target Fingerprint Recipe' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all 'standard `shasum -a 256` lines' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all '`README.md`' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all '`CHANGELOG.md`' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all '`docs/PUBLICATION_READINESS.md`' docs/validation/loop-crafter-v2-installed-live-validation.md
require_match_all '`docs/RELEASE_NOTES_v0.1.2.md`' docs/validation/loop-crafter-v2-installed-live-validation.md

command -v python3 >/dev/null 2>&1 ||
  fail 'python3 is required for evidence-manifest verification'
python3 - <<'PY'
from hashlib import sha256
from pathlib import Path
import re

manifest = Path("docs/validation/loop-crafter-v2-installed-live-validation.md")
base = manifest.parent
expected_paths = {
    *{
        f"transcripts/live-v2-installed-20260726/scenario-{number:02d}-output.md"
        for number in range(1, 10)
    },
    "transcripts/live-v2-installed-20260726-rerun-s1-s9/scenario-01-output.md",
    "transcripts/live-v2-installed-20260726-rerun-s1-s9/scenario-01-output-v2.md",
    "transcripts/live-v2-installed-20260726-rerun-s1-s9/scenario-09-output.md",
}
rows = re.findall(
    r"^\| `([^`]+)` \| `([0-9a-f]{64})` \|$",
    manifest.read_text(encoding="utf-8"),
    re.MULTILINE,
)
if not rows:
    raise SystemExit(f"{manifest}: no evidence hash rows found")
paths = [relative for relative, _ in rows]
if len(paths) != len(set(paths)):
    raise SystemExit(f"{manifest}: duplicate evidence paths")
if set(paths) != expected_paths:
    missing = sorted(expected_paths - set(paths))
    unexpected = sorted(set(paths) - expected_paths)
    raise SystemExit(
        f"{manifest}: evidence path set mismatch; "
        f"missing={missing}, unexpected={unexpected}"
    )
actual_paths = {
    str(path.relative_to(base))
    for directory in (
        base / "transcripts/live-v2-installed-20260726",
        base / "transcripts/live-v2-installed-20260726-rerun-s1-s9",
    )
    for path in directory.glob("*.md")
}
if actual_paths != expected_paths:
    missing = sorted(expected_paths - actual_paths)
    unexpected = sorted(actual_paths - expected_paths)
    raise SystemExit(
        f"{manifest}: transcript directory set mismatch; "
        f"missing={missing}, unexpected={unexpected}"
    )
accepted = base / (
    "transcripts/live-v2-installed-20260726-rerun-s1-s9/"
    "scenario-01-output-v2.md"
)
accepted_text = accepted.read_text(encoding="utf-8")
prompt_headings = list(re.finditer(r"^## Prompt$", accepted_text, re.MULTILINE))
output_headings = list(re.finditer(r"^## Output$", accepted_text, re.MULTILINE))
if len(prompt_headings) != 1 or len(output_headings) != 1:
    raise SystemExit(f"{accepted}: expected exactly one Prompt and one Output heading")
if prompt_headings[0].start() > output_headings[0].start():
    raise SystemExit(f"{accepted}: Prompt must precede Output")
for relative, expected in rows:
    evidence = base / relative
    if not evidence.is_file():
        raise SystemExit(f"{manifest}: missing evidence file: {relative}")
    actual = sha256(evidence.read_bytes()).hexdigest()
    if actual != expected:
        raise SystemExit(
            f"{manifest}: SHA-256 mismatch for {relative}: "
            f"expected {expected}, got {actual}"
        )
PY

if command -v file >/dev/null 2>&1; then
  file assets/social-preview.png | rg -q 'PNG image data' || fail 'social preview is not a PNG'
fi

if command -v sips >/dev/null 2>&1; then
  width="$(sips -g pixelWidth assets/social-preview.png | awk '/pixelWidth:/ { print $2 }')"
  height="$(sips -g pixelHeight assets/social-preview.png | awk '/pixelHeight:/ { print $2 }')"
  [[ "$width" == "1280" && "$height" == "640" ]] || fail "social preview must be 1280x640, got ${width}x${height}"
fi

if command -v python3 >/dev/null 2>&1; then
  python3 - <<'PY'
from pathlib import Path
import struct

path = Path("assets/social-preview.png")
data = path.read_bytes()
if data[:8] != b"\x89PNG\r\n\x1a\n":
    raise SystemExit(f"{path}: not a PNG file")
width, height = struct.unpack(">II", data[16:24])
if (width, height) != (1280, 640):
    raise SystemExit(f"{path}: expected 1280x640, got {width}x{height}")
PY
fi

home_path_pattern='/Users/(alex|haoning)'
secret_env_pattern='(GITHUB_PAT_TOKEN|OPENAI_API_KEY|ANTHROPIC_API_KEY)='
private_key_pattern='BEGIN (RSA|OPENSSH|PRIVATE) KEY'
password_pattern='password[[:space:]]*='
secret_scan_paths=(README.md CHANGELOG.md CONTRIBUTING.md SECURITY.md SKILL.md AGENTS.md agents references docs)
if rg -n "$home_path_pattern|$secret_env_pattern|$private_key_pattern|$password_pattern" \
  "${secret_scan_paths[@]}"; then
  fail 'local path or secret-like assignment pattern found'
else
  status=$?
  (( status <= 1 )) || fail 'local path or secret-like scan failed'
fi

placeholder_scan_paths=(README.md CHANGELOG.md CONTRIBUTING.md SECURITY.md SKILL.md agents references docs/PUBLICATION_READINESS.md docs/RELEASE_NOTES_v0.1.1.md docs/RELEASE_NOTES_v0.1.2.md)
if rg -n 'TODO|FIXME|TBD|fill in|coming soon' \
  "${placeholder_scan_paths[@]}"; then
  fail 'placeholder text found'
else
  status=$?
  (( status <= 1 )) || fail 'placeholder scan failed'
fi

if command -v python3 >/dev/null 2>&1; then
  python3 - <<'PY'
from pathlib import Path

path = Path("agents/openai.yaml")
text = path.read_text(encoding="utf-8")
required = ["display_name:", "short_description:", "default_prompt:"]
missing = [field for field in required if field not in text]
if missing:
    raise SystemExit(f"{path}: missing fields: {', '.join(missing)}")
PY
fi

if command -v python3 >/dev/null 2>&1; then
  python3 - <<'PY'
from datetime import datetime, timedelta
from pathlib import Path
import re

path = Path("docs/anti-expansion-governance-refinement-loop.md")
text = path.read_text(encoding="utf-8")

def extract(label: str) -> str:
    match = re.search(rf"^- {re.escape(label)}: ([0-9]{{4}}-[0-9]{{2}}-[0-9]{{2}}T[0-9]{{2}}:[0-9]{{2}}:[0-9]{{2}}[+-][0-9]{{4}})\.$", text, re.MULTILINE)
    if not match:
        raise SystemExit(f"{path}: missing timezone-qualified '{label}' timestamp")
    return match.group(1)

opened = datetime.strptime(extract("repair-window opened"), "%Y-%m-%dT%H:%M:%S%z")
expires = datetime.strptime(extract("repair-window expires"), "%Y-%m-%dT%H:%M:%S%z")
if expires <= opened:
    raise SystemExit(f"{path}: repair-window expires must be after opened")
if expires - opened > timedelta(minutes=90):
    raise SystemExit(f"{path}: repair-window duration exceeds 90 minutes")
PY
fi

git diff --check

printf 'validate-local: ok\n'
