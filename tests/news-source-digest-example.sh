#!/usr/bin/env bash
set -euo pipefail

rg -q '^stocks:$' news-source-digest/examples/watchlist.yaml
rg -q '^people:$' news-source-digest/examples/watchlist.yaml
rg -q '^sites:$' news-source-digest/examples/watchlist.yaml
rg -q 'news-source-digest' README.md
rg -q 'examples/watchlist.yaml' README.md
