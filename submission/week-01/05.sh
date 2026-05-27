#!/usr/bin/env bash
jq -r '.users[] | select(.active == true) | .email' "$1"
