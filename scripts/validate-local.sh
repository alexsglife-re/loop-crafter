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
require_file docs/loop-crafter-v2-requirements.md
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

path = Path("agents/openai.yaml")
text = path.read_text(encoding="utf-8")
required = ["display_name:", "short_description:", "default_prompt:"]
missing = [field for field in required if field not in text]
if missing:
    raise SystemExit(f"{path}: missing fields: {', '.join(missing)}")
PY
fi

git diff --check

printf 'validate-local: ok\n'
