#!/usr/bin/env sh
# rs1_args_max.sh — more than max_args (64) must fail friendly.
set -eu
words=""
i=0
while [ "$i" -lt 65 ]; do
  words="$words arg$i"
  i=$((i + 1))
done
# shellcheck disable=SC2086
exec rishi/bin/rishi run tools/fixtures/rs1_args_empty.rish $words
