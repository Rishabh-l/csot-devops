#!/usr/bin/env bash
max_attempts=3
delay=1

for i in $(seq 1 $max_attempts); do
    "$@"
    code=$?
    if [ $code -eq 0 ]; then
        exit 0
    fi
    if [ $i -lt $max_attempts ]; then
        sleep $delay
        delay=$((delay * 2))
    fi
done

exit $code
