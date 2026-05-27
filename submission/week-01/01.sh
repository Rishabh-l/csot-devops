#!/usr/bin/env bash
find "$1" -type f -size +1M -printf "%s\t%P\n" | sort -rn
