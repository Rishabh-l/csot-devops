#!/usr/bin/env bash
du -h --max-depth=1 "$1" | sort -rh | head -10
