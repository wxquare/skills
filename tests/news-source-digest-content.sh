#!/usr/bin/env bash
set -euo pipefail

skill_file="news-source-digest/SKILL.md"

rg -q '^name: news-source-digest$' "$skill_file"
rg -q '^description: Use when gathering recent updates from a mixed watchlist' "$skill_file"
rg -q '^## Workflow$' "$skill_file"
rg -q 'watchlist-schema.md' "$skill_file"
rg -q 'fetching-strategy.md' "$skill_file"
rg -q 'output-template.md' "$skill_file"
rg -q 'non-goals.md' "$skill_file"
