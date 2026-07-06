# News Source Digest Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a reusable `news-source-digest` skill with a YAML watchlist example, source-handling instructions, output contract, and validation assets in this repository.

**Architecture:** Create a standalone skill directory with a concise `SKILL.md`, a lightweight `agents/openai.yaml` entry, and focused reference files for watchlist format, fetch strategy, and output template. Drive the content with TDD-style repository validation so the skill structure and required guidance are verified before content is finalized.

**Tech Stack:** Markdown, YAML, repository shell validation via `rg` and `scripts/quick_validate.sh`

---

### Task 1: Scaffold Skill Directory and Validation Test

**Files:**
- Create: `news-source-digest/agents/openai.yaml`
- Create: `news-source-digest/references/watchlist-schema.md`
- Create: `news-source-digest/references/fetching-strategy.md`
- Create: `news-source-digest/references/output-template.md`
- Create: `news-source-digest/references/test-prompts.md`
- Create: `news-source-digest/references/non-goals.md`
- Create: `tests/news-source-digest-structure.sh`

- [ ] **Step 1: Write the failing structure test**

```bash
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
```

- [ ] **Step 2: Run test to verify it fails**

Run: `bash tests/news-source-digest-structure.sh`
Expected: FAIL with `missing required file: news-source-digest/SKILL.md`

- [ ] **Step 3: Write minimal implementation**

```yaml
# news-source-digest/agents/openai.yaml
version: 1
display_name: News Source Digest
short_description: Gather recent updates from mixed stock, person, and site watchlists and summarize them.
default_prompt: Use $news-source-digest to read the configured watchlist, fetch recent items from each source, and produce a grouped digest with failures called out explicitly.
```

```md
# news-source-digest/references/watchlist-schema.md
# placeholder
```

```md
# news-source-digest/references/fetching-strategy.md
# placeholder
```

```md
# news-source-digest/references/output-template.md
# placeholder
```

```md
# news-source-digest/references/test-prompts.md
# placeholder
```

```md
# news-source-digest/references/non-goals.md
# placeholder
```

```md
# news-source-digest/SKILL.md
---
name: news-source-digest
description: Use when gathering recent updates from a mixed watchlist of stocks, people, and sites, and the result should be summarized with source links and fetch failures called out.
---
```

- [ ] **Step 4: Run test to verify it passes**

Run: `bash tests/news-source-digest-structure.sh`
Expected: PASS with no output

### Task 2: Define the Skill Contract and Invocation Flow

**Files:**
- Modify: `news-source-digest/SKILL.md`
- Test: `tests/news-source-digest-content.sh`

- [ ] **Step 1: Write the failing content test**

```bash
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
```

- [ ] **Step 2: Run test to verify it fails**

Run: `bash tests/news-source-digest-content.sh`
Expected: FAIL because `## Workflow` and reference links are missing

- [ ] **Step 3: Write minimal implementation**

```md
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
```

- [ ] **Step 4: Run test to verify it passes**

Run: `bash tests/news-source-digest-content.sh`
Expected: PASS with no output

### Task 3: Write Watchlist, Fetching, and Output References

**Files:**
- Modify: `news-source-digest/references/watchlist-schema.md`
- Modify: `news-source-digest/references/fetching-strategy.md`
- Modify: `news-source-digest/references/output-template.md`
- Modify: `news-source-digest/references/non-goals.md`
- Modify: `news-source-digest/references/test-prompts.md`
- Test: `tests/news-source-digest-references.sh`

- [ ] **Step 1: Write the failing references test**

```bash
#!/usr/bin/env bash
set -euo pipefail

rg -q 'stocks:' news-source-digest/references/watchlist-schema.md
rg -q 'people:' news-source-digest/references/watchlist-schema.md
rg -q 'sites:' news-source-digest/references/watchlist-schema.md
rg -q 'Use RSS or Atom first when available.' news-source-digest/references/fetching-strategy.md
rg -q '## 摘要总览' news-source-digest/references/output-template.md
rg -q 'Automatic scheduling or push notifications.' news-source-digest/references/non-goals.md
rg -q '最近 7 天' news-source-digest/references/test-prompts.md
```

- [ ] **Step 2: Run test to verify it fails**

Run: `bash tests/news-source-digest-references.sh`
Expected: FAIL because the reference placeholders do not contain the required guidance

- [ ] **Step 3: Write minimal implementation**

```md
# Watchlist Schema

Use a single YAML file with top-level `stocks`, `people`, and `sites` groups.

```yaml
stocks:
  - symbol: NVDA
    market: NASDAQ
    aliases: [NVIDIA]
    keywords: [NVIDIA, Blackwell]
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
    kind: team-blog
    tags: [backend, ai, systems]
```
```

```md
# Fetching Strategy

Use RSS or Atom first when available.

For people and sites:
1. Prefer configured `rss_url`.
2. Discover feed links from the page if none are configured.
3. Fall back to parsing the article list page.
4. If timestamps are unclear, move the item into a low-confidence section.

For stocks:
1. Prefer official newsroom or IR pages.
2. Use configured media pages only when they are present in the watchlist.
3. Validate stock relevance with symbol aliases or keywords before inclusion.
```

```md
# Output Template

## 摘要总览
- 时间窗口：最近 7 天
- 覆盖源：N
- 抓取成功：N
- 有更新源：N

## 按分组展开
- 标题、时间、来源、链接、1-3 句摘要

## 待确认
- 无明确发布时间或匹配置信度低的内容

## 失败源
- `feed_unavailable`
- `page_parse_failed`
- `access_blocked`
- `no_recent_items`
```

```md
# Non-Goals

- Automatic scheduling or push notifications.
- Login-protected or paywalled source extraction.
- Trading recommendations or price targets.
- Full historical indexing or database-backed caching in v1.
```

```md
# Test Prompts

- 用 news-source-digest 看最近 7 天
- 用 news-source-digest 看最近 3 天，只看 stocks
- 用 news-source-digest 看最近 14 天，focus=ai，limit_per_source=5
```

- [ ] **Step 4: Run test to verify it passes**

Run: `bash tests/news-source-digest-references.sh`
Expected: PASS with no output

### Task 4: Add Example Watchlist and Repository Documentation

**Files:**
- Create: `news-source-digest/examples/watchlist.yaml`
- Modify: `README.md`
- Test: `tests/news-source-digest-example.sh`

- [ ] **Step 1: Write the failing example test**

```bash
#!/usr/bin/env bash
set -euo pipefail

rg -q '^stocks:$' news-source-digest/examples/watchlist.yaml
rg -q '^people:$' news-source-digest/examples/watchlist.yaml
rg -q '^sites:$' news-source-digest/examples/watchlist.yaml
rg -q 'news-source-digest' README.md
rg -q 'examples/watchlist.yaml' README.md
```

- [ ] **Step 2: Run test to verify it fails**

Run: `bash tests/news-source-digest-example.sh`
Expected: FAIL because the example file and README entry do not exist yet

- [ ] **Step 3: Write minimal implementation**

```yaml
stocks:
  - symbol: NVDA
    market: NASDAQ
    aliases: [NVIDIA]
    keywords: [NVIDIA, Jensen Huang, Blackwell]
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
    kind: team-blog
    tags: [backend, ai, systems]
```

```md
## Skills

- `news-source-digest`: gather recent updates from a mixed watchlist of stocks, people, and sites. Example watchlist: `news-source-digest/examples/watchlist.yaml`
```

- [ ] **Step 4: Run test to verify it passes**

Run: `bash tests/news-source-digest-example.sh`
Expected: PASS with no output

### Task 5: Run Repository Validation and Final Verification

**Files:**
- Modify: `news-source-digest/SKILL.md`
- Modify: `news-source-digest/references/*`
- Modify: `news-source-digest/examples/watchlist.yaml`
- Modify: `README.md`
- Test: `tests/news-source-digest-structure.sh`
- Test: `tests/news-source-digest-content.sh`
- Test: `tests/news-source-digest-references.sh`
- Test: `tests/news-source-digest-example.sh`

- [ ] **Step 1: Refine content for clarity after tests are green**

```md
Expand the placeholder reference content into concise, reusable documentation without changing the verified structure, required headings, or invocation contract.
```

- [ ] **Step 2: Run targeted tests**

Run: `bash tests/news-source-digest-structure.sh && bash tests/news-source-digest-content.sh && bash tests/news-source-digest-references.sh && bash tests/news-source-digest-example.sh`
Expected: PASS with no output

- [ ] **Step 3: Run repository quick validation**

Run: `bash scripts/quick_validate.sh`
Expected: PASS, or a repository-specific success summary without errors for the new skill

- [ ] **Step 4: Review diff before completion**

Run: `git -C /Users/xianguiwang/github.com/skills diff -- news-source-digest README.md tests docs/superpowers/plans/2026-07-06-news-source-digest-implementation.md`
Expected: Shows only the planned skill, tests, README update, and plan file changes
