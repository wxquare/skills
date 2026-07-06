# News Source Digest Design

- Date: 2026-07-06
- Status: Draft for review
- Working name: `news-source-digest`

## Overview

`news-source-digest` is a reusable skill for on-demand information collection and summarization across mixed source types. The user maintains a local YAML watchlist containing stocks, people, and sites. When invoked, the skill reads that watchlist, fetches recent content from each source, normalizes the results, filters by a requested time window, and produces a short grouped digest.

This first version is intentionally scoped to discovery and summarization. It does not schedule itself, maintain a long-term database, or provide investment advice.

## Goals

- Support mixed input sources in a single watchlist.
- Fetch recent updates directly from each configured site when possible.
- Prefer stable source access methods such as RSS or official news pages.
- Summarize recent items into a readable, grouped digest.
- Expose failures explicitly instead of silently skipping broken sources.
- Allow ad hoc query windows such as `3d`, `7d`, and `14d`.

## Non-Goals

- Automatic scheduling or push notifications.
- Login-protected or paywalled source extraction.
- Full historical indexing or persistent cache storage.
- Trading recommendations, sentiment scoring, or price targets.
- Robust support for every arbitrary website layout in the first version.

## User Inputs

The skill uses one primary local configuration file. The default path is expected to live alongside the skill examples, but callers may override it by passing another YAML path during invocation.

### Invocation Parameters

- `watchlist_path`: optional path to a YAML watchlist file
- `window`: optional time window such as `3d`, `7d`, `14d`; default is `7d`
- `focus`: optional category or tag filter such as `stocks`, `people`, `sites`, `ai`, `systems`
- `limit_per_source`: optional integer cap on items fetched per source

### Watchlist Structure

The watchlist has three top-level groups:

- `stocks`
- `people`
- `sites`

Each record should contain enough information for stable fetching and grouping.

Example shape:

```yaml
stocks:
  - symbol: NVDA
    market: NASDAQ
    aliases: [NVIDIA]
    keywords: [NVIDIA, Blackwell, Jensen Huang]
    preferred_sources:
      - https://nvidianews.nvidia.com/
    tags: [ai, semiconductors]

people:
  - name: Simon Willison
    homepage: https://simonwillison.net/
    rss_url: https://simonwillison.net/atom/everything/
    tags: [ai, llm, tooling]

sites:
  - name: Meituan Tech
    url: https://tech.meituan.com/
    rss_url:
    kind: team-blog
    tags: [backend, ai, systems]
```

## Source Model

The watchlist supports mixed source access modes:

- Stocks: official company news pages, IR pages, and configured stock-relevant media pages
- People: personal homepages, blogs, RSS feeds, column pages
- Sites: technical blogs, category pages, article indexes, team engineering blogs

The skill must not assume a single ingestion method. Instead, it selects the best available method per source.

## Normalized Result Model

All fetched items are converted into a common shape before filtering and summarization.

Required fields:

- `title`
- `url`
- `published_at`
- `source_name`
- `source_type`
- `tags`
- `raw_excerpt`

Optional fields:

- `matched_entity`: stock symbol, person name, or site group that caused the match
- `source_status`
- `alternate_sources`
- `confidence`

`source_type` is expected to distinguish groups such as:

- `stock-news`
- `person-blog`
- `team-blog`
- `category-page`

## Fetching Strategy

### For People and Sites

Fetch order:

1. Use `rss_url` if explicitly configured.
2. If no explicit feed exists, inspect the homepage or article list page for RSS or Atom discovery.
3. If no feed is available, parse the article list page for recent titles, links, and timestamps.
4. If the list page is insufficient, perform a limited site scan of obvious recent-post entry points.

This ordering favors stable feed consumption first and falls back to HTML parsing only when needed.

### For Stocks

Fetch order:

1. Build source candidates from configured `preferred_sources`.
2. Prefer official company newsroom, investor relations, or press-release pages.
3. Expand to configured media or aggregation sources only when explicitly present in the watchlist.
4. Validate that fetched items actually match the stock by symbol, aliases, or configured keywords before inclusion.

This avoids mixing unrelated coverage from broad financial pages.

## Filtering Rules

### Time Window

- Filter items to the requested `window`.
- Default window is `7d`.
- Items without a reliable `published_at` do not enter the main digest.
- Items without a reliable `published_at` are placed into a low-confidence section when they appear relevant.

### Focus Filter

If `focus` is provided, keep only items that match:

- a top-level group such as `stocks`, `people`, `sites`, or
- a tag such as `ai`, `systems`, `startup`

### Limit Per Source

If `limit_per_source` is provided, keep the newest N items per source after time filtering.

## Deduplication Rules

- Exact same URL means the item is duplicated.
- Highly similar titles with close publication times should be merged.
- When merging, preserve:
  - the primary source
  - alternate sources when relevant
  - the strongest available timestamp

Deduplication exists to reduce noisy cross-posts and repeated syndicated announcements.

## Failure Handling

Failures must be explicit. Every source should produce a visible status:

- `ok`
- `no_recent_items`
- `feed_unavailable`
- `page_parse_failed`
- `access_blocked`

The final output includes a failure section so the watchlist can be corrected over time.

## Output Format

The digest output uses four sections.

### 1. Summary

This section includes:

- query window
- number of configured sources
- number of successful fetches
- number of sources with recent updates
- main topics or matched tags

### 2. Grouped Results

Results are grouped by the relevant watchlist area, such as stocks or followed sites. Each item includes:

- title with link
- publication date
- source name
- one to three sentences of summary
- short note on why it is relevant to the watched stock or topic, when that relevance is non-obvious

### 3. Low-Confidence or Needs-Review

This section holds:

- items with unclear timestamps
- borderline matches with weak keyword confidence
- content worth manual review but not safe enough for the main digest

### 4. Failed Sources

This section lists sources by status so the user can adjust the watchlist or accept that a source had no recent updates.

## Summary Rules

- Keep each item summary to one to three sentences.
- Summaries must state what the content is about.
- Summaries should note why the content matters to the user's watchlist when possible.
- Do not invent claims that are not present in the source content.
- For stock-related items, do not turn summaries into investment advice.

## Example Invocation Phrases

- `用 news-source-digest 看最近 7 天`
- `用 news-source-digest 看最近 3 天，只看 stocks`
- `用 news-source-digest 看最近 14 天，focus=ai，limit_per_source=5`

## Example Output Skeleton

```md
# News Digest

## 摘要总览
- 时间窗口：最近 7 天
- 覆盖源：23
- 抓取成功：18
- 有更新源：11
- 主要主题：AI 工程、系统设计、NVIDIA、TSMC

## 股票相关
### NVDA
- [标题](链接)
  - 时间：2026-07-05
  - 来源：NVIDIA Newsroom
  - 摘要：...

## 关注站点
### Simon Willison
- [标题](链接)
  - 时间：2026-07-04
  - 摘要：...

## 待确认
- 某条内容没有明确发布时间，但主题与 AI agent 相关，值得人工复核。

## 失败源
- `feed_unavailable`: XXX
- `page_parse_failed`: YYY
- `no_recent_items`: ZZZ
```

## Validation Plan

The first version should be validated with an example watchlist containing:

- one blog with working RSS
- one site without RSS but with a stable article list page
- one team engineering blog
- two or three stock-related official or media sources

Minimum checks:

- `7d` and `3d` queries both work
- time filtering behaves correctly
- failed sources are reported explicitly
- summaries remain concise and readable
- mixed source categories appear in the correct output groups

## Risks and Constraints

- HTML parsing will be brittle for some sites; this is expected in v1.
- Some sources may omit timestamps or present them in inconsistent formats.
- Broad stock news pages may create false positives if keyword matching is too loose.
- Query quality depends heavily on the quality of the watchlist configuration.

## Implementation Direction

The first implementation should be split into clear units:

- watchlist loader
- source classifier
- feed fetcher
- page parser fallback
- stock relevance matcher
- normalizer
- deduplicator
- summarizer
- markdown formatter

These boundaries keep the skill evolvable if it later grows from pure skill orchestration into a small local tool plus skill wrapper.
