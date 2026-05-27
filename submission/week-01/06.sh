#!/usr/bin/env bash
set -uo pipefail

if [ $# -lt 4 ]; then
    echo "Usage: $0 <max_attempts> <initial_delay_sec> -- <command> [args...]" >&2
    exit 1
fi

MAX_ATTEMPTS="$1"
DELAY="$2"
shift 2

if [ "$1" = "--" ]; then
    shift
else
    echo "Error: missing -- separator" >&2
    exit 1
fi

ATTEMPT=0
RC=1

while [ "$ATTEMPT" -lt "$MAX_ATTEMPTS" ]; do
    ATTEMPT=$((ATTEMPT + 1))

    "$@"
    RC=$?

    if [ "$RC" -eq 0 ]; then
        exit 0
    fi

    if [ "$ATTEMPT" -lt "$MAX_ATTEMPTS" ]; then
        sleep "$DELAY"
        DELAY=$((DELAY * 2))
    fi
done

exit "$RC"
