#!/usr/bin/env bash
set -euo pipefail

rg -q 'stocks:' news-source-digest/references/watchlist-schema.md
rg -q 'people:' news-source-digest/references/watchlist-schema.md
rg -q 'sites:' news-source-digest/references/watchlist-schema.md
rg -q 'Use RSS or Atom first when available.' news-source-digest/references/fetching-strategy.md
rg -q '## 摘要总览' news-source-digest/references/output-template.md
rg -q 'Automatic scheduling or push notifications.' news-source-digest/references/non-goals.md
rg -q '最近 7 天' news-source-digest/references/test-prompts.md
