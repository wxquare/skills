# Output Templates

Use these templates as response shapes. Adapt wording to the user's context.

## Review Report

```md
## Review Report: <document name>

### Findings

1. `[P0] <short title>`
   - Issue: <what is missing or unclear>
   - Impact: <why this blocks review or implementation>
   - Suggested rewrite: <how to fix it>

2. `[P1] <short title>`
   - Issue: <...>
   - Impact: <...>
   - Suggested rewrite: <...>

### Open Questions / Assumptions

- <question or assumption>

### Summary

- <optional short summary>
```

## Common Pattern Summary

```md
## Common Patterns Across Documents

- Repeated issue: <pattern>
  - Why it recurs: <cause>
  - Recommended standard: <team-level writing rule>
```

## Authoring Template

```md
## Top Decisions

1. <decision>
   - Chosen option: <...>
   - Why: <...>
   - Tradeoff: <...>
```

## Full Authoring Template

```md
# <Title>

## 1. Background / Objective / Scope

## 2. Current State / Problem Statement

## 3. Key Decisions

## 4. End-to-End Flow / Responsibility Split

## 5. API / Data Contract

## 6. Dependency / Rollout / Risk / Rollback

## 7. Open Questions / Assumptions

## 8. Work Breakdown / Owner / Timeline
```

## Pre-Review Checklist

```md
- [ ] The top 2-5 decisions are visible before the detailed sections
- [ ] The top decisions are easy to find
- [ ] Scope and non-goals are explicit
- [ ] Dependencies and blockers are grouped in one place
- [ ] Rollout and rollback are described
- [ ] Open questions are listed explicitly
- [ ] Design sections are not buried under implementation detail
- [ ] Fields such as amount, status, version, and snapshot keep one meaning throughout the document
```
