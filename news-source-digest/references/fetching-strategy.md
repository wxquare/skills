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
