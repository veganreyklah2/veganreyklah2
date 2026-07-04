#!/bin/sh
# session_logs_archive.sh — fold prior days' session logs into archive/YYYYMMDD/.
# Called by tools/session_logs_archive.rish. Convention: ORGANIZING.md.

set -eu
cd session-logs
mkdir -p archive
today=$(date +%Y%m%d)
count=0
for f in 20*.md; do
  [ -e "$f" ] || continue
  day=${f%%-*}
  [ "$day" = "$today" ] && continue
  mkdir -p "archive/$day"
  if git mv "$f" "archive/$day/$f" 2>/dev/null; then
    :
  else
    mv "$f" "archive/$day/$f"
  fi
  sed -i "s|](${f})|](archive/${day}/${f})|g" README.md
  count=$((count + 1))
done
echo "moved=$count"
