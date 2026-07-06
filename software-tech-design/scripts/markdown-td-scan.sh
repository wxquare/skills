#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "usage: $0 <markdown-file> [more-files...]" >&2
  exit 1
fi

for file in "$@"; do
  if [ ! -f "$file" ]; then
    echo "FILE $file"
    echo "ERROR missing"
    echo
    continue
  fi

  echo "FILE $file"

  title="$(awk 'match($0,/^# /){print substr($0,3); exit}' "$file")"
  if [ -n "$title" ]; then
    echo "TITLE $title"
  fi

  echo "HEADINGS"
  awk 'match($0,/^#{1,6} /){print}' "$file"

  echo "TODO_LINES"
  awk 'BEGIN{IGNORECASE=1} match($0,/(TODO|FIXME|TBD|XXX|\[ \])/) {print NR ":" $0}' "$file"

  echo "CODE_FENCES"
  awk '
    /^```/ {
      if (in_block == 0) {
        in_block = 1
        lang = substr($0, 4)
        if (lang == "") lang = "plain"
        count++
        print "block=" count " lang=" lang
      } else {
        in_block = 0
      }
    }
  ' "$file"

  echo "HTTP_SIGNALS"
  awk 'match($0,/(GET|POST|PUT|DELETE|PATCH)[[:space:]]+\/[A-Za-z0-9_\/\.-]+/){print NR ":" $0}' "$file"

  echo "DECISION_SIGNALS"
  awk 'BEGIN{IGNORECASE=1} match($0,/(decision|tradeoff|option|chosen|fallback|rollback|assumption|risk|dependency|目标|范围|决策|权衡|回滚|假设|风险|依赖)/){print NR ":" $0}' "$file"

  echo
done
