#!/usr/bin/env bash
find "$1" -type f -size +1M -exec du -h {} + | sort -rh

