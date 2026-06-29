#!/usr/bin/env sh
# tame_check_mantra.sh — assert mantra/src/* is TH-2b clean (import-once only).
set -eu

fail=0
for f in mantra/src/main.rye mantra/src/store.rye mantra/src/weave.rye mantra/src/diff.rye; do
  calls=$(grep -c 'std\.debug\.assert(' "$f" 2>/dev/null || true)
  calls=${calls:-0}
  if [ "$calls" -gt 0 ]; then
    echo "FAIL $f unqualified_assert=$calls"
    fail=1
  else
    if ! grep -q '^const assert = std\.debug\.assert;$' "$f"; then
      echo "FAIL $f missing import-once assert binding"
      fail=1
    else
      echo "OK   $f"
    fi
  fi
done
exit "$fail"
