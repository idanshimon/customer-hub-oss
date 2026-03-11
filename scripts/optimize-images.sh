#!/usr/bin/env bash
# Optimize PNG images using pngquant (lossless-ish, text stays sharp)
# Usage: ./scripts/optimize-images.sh [file1.png file2.png ...]
# No args = optimize all PNGs in repo (excluding .git)

set -euo pipefail

if ! command -v pngquant &>/dev/null; then
  echo "❌ pngquant not found. Install: brew install pngquant"
  exit 1
fi

total_before=0
total_after=0
count=0

optimize_file() {
  local f="$1"
  local before after saved pct
  before=$(stat -f%z "$f" 2>/dev/null || stat -c%s "$f" 2>/dev/null)
  
  pngquant --quality=85-100 --speed 1 --force --output "${f}.opt" "$f" 2>/dev/null || return 0
  after=$(stat -f%z "${f}.opt" 2>/dev/null || stat -c%s "${f}.opt" 2>/dev/null)
  
  if [ "$after" -lt "$before" ]; then
    mv "${f}.opt" "$f"
    saved=$((before - after))
    pct=$((saved * 100 / before))
    echo "✓ $(basename "$f"): $((before/1024))KB → $((after/1024))KB (-${pct}%)"
    total_before=$((total_before + before))
    total_after=$((total_after + after))
    count=$((count + 1))
  else
    rm "${f}.opt"
    total_before=$((total_before + before))
    total_after=$((total_after + before))
  fi
}

if [ $# -gt 0 ]; then
  for f in "$@"; do
    [[ "$f" == *.png ]] && optimize_file "$f"
  done
else
  while IFS= read -r -d '' f; do
    optimize_file "$f"
  done < <(find . -not -path './.git/*' -iname '*.png' -print0)
fi

if [ "$count" -gt 0 ]; then
  echo "---"
  echo "Optimized $count files: $((total_before/1024))KB → $((total_after/1024))KB (-$(( (total_before - total_after) * 100 / total_before ))%)"
fi
