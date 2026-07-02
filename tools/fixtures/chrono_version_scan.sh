#!/usr/bin/env sh
# chrono_version_scan.sh — flag semver **Version:** marks on authored .md surfaces.
# Chronological stamps (YYYYMMDD…) are lawful; vN.N semver on authored pages are drift.
set -eu

scan_file() {
  f="$1"
  # Semver-shaped Version line: **Version:** `0.x` or `v0.x` — not YYYYMMDD stamps.
  hits=$(grep -nE '^\*\*Version:\*\*.*`v?[0-9]{1,2}\.[0-9]+' "$f" 2>/dev/null || true)
  if [ -n "$hits" ]; then
    echo "FAIL $f semver Version line"
    echo "$hits" | sed 's/^/      /'
  else
    echo "OK   $f"
  fi
}

# Scan top-level authored .md surfaces (skip yonder/archive).
for f in \
  manual/*.md manual/reference/*.md manual/tutorials/*.md \
  context/*.md context/specs/*.md \
  active-designing/*.md \
  foundations/*.md \
  work-in-progress/*.md \
  external-research/*.md \
  pond/README.md linengrow/*.md \
  classical-vedic-astrology/*.md classical-vedic-astrology/studies/*.md \
  CLAUDE.md ORGANIZING.md
do
  [ -f "$f" ] || continue
  case "$f" in */yonder/*|*/archive/*) continue ;; esac
  scan_file "$f"
done
