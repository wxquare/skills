#!/usr/bin/env bash
set -euo pipefail

base="news-source-digest"

for path in \
  "$base/SKILL.md" \
  "$base/agents/openai.yaml" \
  "$base/references/watchlist-schema.md" \
  "$base/references/fetching-strategy.md" \
  "$base/references/output-template.md" \
  "$base/references/test-prompts.md" \
  "$base/references/non-goals.md"
do
  [[ -f "$path" ]] || {
    echo "missing required file: $path" >&2
    exit 1
  }
done
