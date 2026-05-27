#!/usr/bin/env bash
du --max-depth=1 "$1" | sort -rn | head -10
