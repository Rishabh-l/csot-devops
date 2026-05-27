#!/usr/bin/env bash
max_attempts=3
delay=1

for i in $(seq 1 $max_attempts); do
    "$@"
    code=$?
    [ $code -eq 0 ] && exit 0
    [ $i -lt $max_attempts ] && sleep $delay
    delay=$((delay * 2))
done

exit $code
