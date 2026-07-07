#!/bin/sh
# tame_style_scan.sh — textual TAME lint over authored .rye, in tidy.zig's spirit.
#
# Bans (any hit = nonzero exit, file:line printed):
#   ) == error. / ) != error.   call-result compared to an error (silent anyerror upcast);
#                               a captured |err| compared inside assert stays welcome — the
#                               trap lives at the call seam, and the refined form bans it there.
#   std.debug.assert(           qualified assert; import once, call bare.
#   Self = @This()              the alias takes the real type name.
#   usingnamespace              banned outright, as upstream.
#   !comptime                   ! belongs inside the comptime expression.
#   copyForwards / copyBackwards  reach for tally copy_disjoint (or an explicit loop).
#   FIXME / dbg(                welcome while iterating; gone before a bundle ships.
#   assert( ... and ...         split compound asserts so the failing half is named.
#
# Advisories (counts printed, never fatal — the ratchet, tracked downward):
#   @memcpy( sites remaining    migrate to tally copy_disjoint as files are touched.
#   camelCase fn declarations   snake_case is the seated law; elder names migrate on touch.
#   functions past 70 lines     split at the natural seam when next touched.
#   zero assert( sites          core modules should import assert; honest exempt list below.
#
# Scan roster: mantra caravan linengrow comlink rishi/src tally aurora pond brushstroke rye/src.
# tools/ is its own counted season (counsel 20260707.175312). Intentional-violation fixtures
# (e.g. tools/fixtures/width_check_authored_usize.rye) stay exempt — see context/TAME_GUIDANCE.md.

set -u
MODE="${1:-bans}"
FILES=$(find mantra caravan linengrow comlink rishi/src tally aurora pond brushstroke rye/src \
    -name "*.rye" ! -type l 2>/dev/null)

if [ "$MODE" = "bans" ]; then
    fail=0
    for pat in ") == error." ") != error." "std.debug.assert(" "Self = @This()" \
               "usingnamespace" "!comptime" "copyForwards" "copyBackwards" \
               "FIXME" "dbg("; do
        hits=$(grep -Hn -F "$pat" $FILES 2>/dev/null)
        if [ -n "$hits" ]; then
            echo "BAN [$pat]:"
            echo "$hits" | head -8
            fail=1
        fi
    done
    compound=$(grep -Hn "assert(.* and .*)" $FILES 2>/dev/null)
    if [ -n "$compound" ]; then
        echo "BAN [compound assert — split so the failing half is named]:"
        echo "$compound" | head -8
        fail=1
    fi
    exit $fail
fi

if [ "$MODE" = "advise" ]; then
    memcpy_total=$(grep -h "@memcpy(" $FILES 2>/dev/null | wc -l | tr -d ' ')
    memcpy_app=$((memcpy_total - $(grep -c "@memcpy(" tally/copy.rye 2>/dev/null || echo 0)))
    camel_total=$(grep -hE "^( *)?(pub )?fn [a-z]+[A-Z]" $FILES 2>/dev/null | wc -l | tr -d ' ')
    echo "ratchet: @memcpy application sites = ${memcpy_app} (migrate to copy_disjoint on touch)"
    echo "ratchet: @memcpy canonical in tally/copy.rye = 1 (intentional inside copy_disjoint)"
    echo "ratchet: camelCase fn declarations = ${camel_total} (snake_case on touch)"
    echo "ratchet: functions past 70 lines —"
    zero_assert_total=0
    for f in $FILES; do
        if grep -qE '\bassert\(' "$f" 2>/dev/null; then
            continue
        fi
        case "$f" in
            comlink/guest_*|aurora/src/*|brushstroke/font8x8_data.rye|\
            caravan/supervisor_signal.rye|caravan/supervisor_exit.rye|pond/apps/window_input.rye)
                continue ;;
        esac
        zero_assert_total=$((zero_assert_total + 1))
        echo "  $f (zero assert — review on touch)"
    done
    echo "ratchet: zero assert( files remaining = ${zero_assert_total} (honest exempt: virtio guests, aurora freestanding, signal handler, font table, thin line editor, exit constants)"
    for f in $FILES; do
        awk -v F="$f" '
            /^( *)?(pub )?fn /{ if (infn && n > 70) printf "  %s: %s = %d lines\n", F, name, n;
                infn = 1; n = 0; name = $0; sub(/\(.*/, "", name); sub(/.*fn /, "", name) }
            infn { n++ }
            /^}$|^    }$/{ if (infn && n > 70) printf "  %s: %s = %d lines\n", F, name, n; infn = 0 }
        ' "$f"
    done 2>/dev/null | sort -t= -k2 -rn | head -10
    exit 0
fi

echo "usage: tame_style_scan.sh [bans|advise]" >&2
exit 2
