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
  awk -v start="$start" -v end="$end" '
    $0 == start { in_section = 1 }
    in_section { print }
    in_section && $0 == end { exit }
  ' "$file" | rg -q "$pattern" || fail "missing pattern '$pattern' in section '$start' of $file"
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
require_file docs/PUBLICATION_READINESS.md
require_file docs/anti-expansion-governance-refinement-loop.md
require_file docs/loop-crafter-v2-requirements.md
require_file docs/validation/loop-crafter-v2-behavior-validation.md
require_file assets/social-preview.png

require_match 'loop-crafter' SKILL.md README.md agents/openai.yaml
require_match 'Design unattended-ready agent loops' README.md
require_match 'owner-authorized autonomous runs' README.md
require_match 'execute unattended runs' README.md
require_match 'Current public release: `v0.1.1`' README.md
require_match 'MIT License' LICENSE
require_match 'secret|credential|token|security' SECURITY.md CONTRIBUTING.md
require_match 'v0.1.1' CHANGELOG.md docs/RELEASE_NOTES_v0.1.1.md docs/PUBLICATION_READINESS.md
require_match 'No package-registry release' docs/RELEASE_NOTES_v0.1.1.md
require_match 'No unattended runner' docs/RELEASE_NOTES_v0.1.1.md
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

placeholder_scan_paths=(README.md CHANGELOG.md CONTRIBUTING.md SECURITY.md SKILL.md agents references docs/PUBLICATION_READINESS.md docs/RELEASE_NOTES_v0.1.1.md)
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
from datetime import datetime, timedelta

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
