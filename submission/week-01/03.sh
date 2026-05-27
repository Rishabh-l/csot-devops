#!/usr/bin/env bash
find "$1" -type f -exec sed -i 's/\t/    /g' {} +
