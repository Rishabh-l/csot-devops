#!/usr/bin/env bash
set -euo pipefail

[ -z "${1:-}" ] && { echo "Usage: $0 <dir>" >&2; exit 1; }

du -k "$1" 2>/dev/null | sort -rn | head -10
