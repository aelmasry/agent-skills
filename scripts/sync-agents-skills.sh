#!/usr/bin/env bash
# Compatibility wrapper. All tool dirs are now installed from the repo by install.sh.
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
exec "$REPO_ROOT/install.sh"
