#!/usr/bin/env bash
set -euo pipefail

TODO_FILE="${TODO_FILE:-$HOME/.todo}"
touch "$TODO_FILE"

case "${1:-list}" in
    add)
        shift
        echo "[ ] $*" >> "$TODO_FILE"
        ;;
    list)
        if [ -s "$TODO_FILE" ]; then
            awk '{ printf "%d: %s\n", NR, $0 }' "$TODO_FILE"
        fi
        ;;
    done)
        n="$2"
        sed -i "${n}s/^\[ \]/[x]/" "$TODO_FILE"
        ;;
    remove)
        n="$2"
        sed -i "${n}d" "$TODO_FILE"
        ;;
    *)
        echo "Usage: $0 {add|list|done|remove} [args]" >&2
        exit 2
        ;;
esac
