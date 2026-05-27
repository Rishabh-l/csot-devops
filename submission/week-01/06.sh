#!/usr/bin/env bash
max_attempts=5
delay=1

for i in $(seq 1 $max_attempts); do
    "$@" && exit 0
    echo "Attempt $i failed. Retrying in ${delay}s..."
    sleep $delay
    delay=$((delay * 2))
done

echo "All $max_attempts attempts failed."
exit 1
