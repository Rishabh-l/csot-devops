#!/usr/bin/env bash
find "$1" -type f -name "*.txt" | while read f; do
    mv "$f" "${f%.txt}.md"
done

