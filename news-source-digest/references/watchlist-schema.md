# Watchlist Schema

Use a single YAML file with top-level `stocks`, `people`, and `sites` groups.

## Top-Level Groups

- `stocks`: stock, ETF, or private-company watch targets
- `people`: individual writers, researchers, or creators
- `sites`: company blogs, team engineering blogs, docs, newsletters, model hubs, and other structured content sources

## Common Fields

These fields are reused across multiple record types:

- `name`: human-readable source name
- `tags`: topic labels used for filtering such as `ai`, `systems`, `startup`
- `group`: optional higher-level grouping label such as `DeepSeek`, `Hermes Agent`, `Engineering Blogs`, `Team Engineering Blogs`

Use `group` when you want to monitor a set of related sources together without relying only on tags.

## Stock Fields

Recommended fields for `stocks` entries:

- `symbol`: ticker or internal identifier
- `market`: exchange or classification such as `NASDAQ`, `NYSEARCA`, `PRIVATE`
- `aliases`: common company or instrument names
- `keywords`: relevance matching terms for news filtering
- `preferred_sources`: official newsroom, IR, or target news pages
- `tags`: topic labels

## People Fields

Recommended fields for `people` entries:

- `name`: author or creator name
- `homepage`: primary landing page
- `rss_url`: optional explicit RSS or Atom feed
- `group`: optional category grouping
- `tags`: topic labels

Use `people` when the source identity is centered on a person, even if the content is hosted on a standalone blog.

## Site Fields

Recommended fields for `sites` entries:

- `name`: source label
- `url`: canonical homepage, blog root, docs root, or listing page
- `kind`: source type
- `group`: optional category grouping
- `tags`: topic labels

### Supported `kind` Values

Use a stable `kind` value to hint how the source should be treated.

- `company-site`: company homepage or official corporate site
- `docs`: documentation site or API documentation
- `github-org`: GitHub organization or repository landing page
- `model-hub`: Hugging Face organization, model collection, or equivalent model distribution hub
- `status-page`: service status page
- `community`: Discord or community landing page
- `social`: X or similar social platform account; treat as a clue source, not a primary confirmation source
- `literature-search`: search page for papers or research outputs
- `personal-blog`: personal blog or individual publishing site
- `team-blog`: engineering or technical team blog
- `analysis-site`: market, strategy, or technical analysis publication
- `newsletter`: newsletter or editorial publication
- `blog`: general content site or long-form publishing site
- `open-course`: educational site, textbook, or tutorial collection
- `curated-site`: curated index,摘抄站, or resource aggregation site

If a source does not fit perfectly, choose the closest stable category rather than inventing a new kind for every site.

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
    group: AI and LLM
    tags: [ai, llm, tooling]

sites:
  - name: Meituan Tech
    url: https://tech.meituan.com/
    kind: team-blog
    group: Team Engineering Blogs
    tags: [backend, ai, systems]

  - name: DeepSeek API Docs
    url: https://api-docs.deepseek.com/
    kind: docs
    group: DeepSeek
    tags: [ai, llm, deepseek, api, official]

  - name: Nous Research X
    url: https://x.com/NousResearch
    kind: social
    group: Hermes Agent
    tags: [ai, llm, hermes, nous, social]
```
