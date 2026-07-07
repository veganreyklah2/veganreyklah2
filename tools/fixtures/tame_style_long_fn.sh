#!/bin/sh
# tame_style_long_fn.sh — >70-line function ledger for tame_style_scan advise.
FILES=$(find mantra caravan linengrow comlink rishi/src tally aurora pond brushstroke rye/src \
    -name "*.rye" ! -type l 2>/dev/null)
for f in $FILES; do
    awk -v F="$f" '
        /^( *)?(pub )?fn /{ if (infn && n > 70) printf "  %s: %s = %d lines\n", F, name, n;
            infn = 1; n = 0; name = $0; sub(/\(.*/, "", name); sub(/.*fn /, "", name) }
        infn { n++ }
        /^}$|^    }$/{ if (infn && n > 70) printf "  %s: %s = %d lines\n", F, name, n; infn = 0 }
    ' "$f"
done 2>/dev/null | sort -t= -k2 -rn | head -10
