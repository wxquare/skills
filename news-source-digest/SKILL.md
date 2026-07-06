---
name: news-source-digest
description: Use when gathering recent updates from a mixed watchlist of stocks, people, and sites, and the result should be summarized with source links and fetch failures called out.
---

# News Source Digest

Use this skill to read a local YAML watchlist, fetch recent content from mixed sources, normalize the results, and return a concise digest.

## Workflow

1. Read the watchlist and resolve the requested `window`, `focus`, and `limit_per_source`.
2. Classify each source as a stock source, person source, or site source.
3. Fetch recent items using the strategy in [references/fetching-strategy.md](references/fetching-strategy.md).
4. Normalize, time-filter, and deduplicate the items.
5. Summarize the results using [references/output-template.md](references/output-template.md).
6. Explicitly list failed or low-confidence sources.

## Required References

- [references/watchlist-schema.md](references/watchlist-schema.md)
- [references/fetching-strategy.md](references/fetching-strategy.md)
- [references/output-template.md](references/output-template.md)
- [references/non-goals.md](references/non-goals.md)
