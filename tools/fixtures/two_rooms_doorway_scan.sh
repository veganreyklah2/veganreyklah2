#!/usr/bin/env sh
# two_rooms_doorway_scan.sh — forward-facing pages name their room at the door.
# Applies to external-research/*.md and active-designing/*.md whose one-clock
# filename stamp is on or after TWO_ROOMS seating (see context/TWO_ROOMS.md).
set -eu

SEATING_STAMP="${TWO_ROOMS_SEATING_STAMP:-20260705-203144}"

room_named() {
  # Status line must name checkable, vision, mixed, or an honored companion register.
  echo "$1" | grep -qiE 'checkable|vision|mixed|research for understanding'
}

scan_file() {
  f="$1"
  base=$(basename "$f")
  # One-clock prefix YYYYMMDD-HHMMSS_
  file_stamp=$(echo "$base" | sed -n 's/^\([0-9]\{8\}-[0-9]\{6\}\).*/\1/p')
  if [ -z "$file_stamp" ]; then
    echo "OK   $f (no one-clock stamp — grandfathered)"
    return 0
  fi
  if [ "$file_stamp" \< "$SEATING_STAMP" ]; then
    echo "OK   $f (before seating $SEATING_STAMP)"
    return 0
  fi
  status=$(head -25 "$f" | grep '^\*\*Status:\*\*' | head -1 || true)
  if [ -z "$status" ]; then
    echo "FAIL $f missing Status line (stamp $file_stamp)"
    return 1
  fi
  if room_named "$status"; then
    echo "OK   $f"
    return 0
  fi
  echo "FAIL $f Status does not name a room: $status"
  return 1
}

fail=0
for f in external-research/*.md active-designing/*.md; do
  [ -f "$f" ] || continue
  case "$f" in */README.md) continue ;; esac
  scan_file "$f" || fail=1
done

if [ "$fail" -ne 0 ]; then
  echo "FAIL doorway scan"
  exit 1
fi
echo "OK   doorway scan complete (seating $SEATING_STAMP)"
