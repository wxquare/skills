# Practice Variant Blueprint

This document describes how a private or project-specific variant can extend the public core without polluting the public skill with organization-specific process.

## Goal

The public core helps write and review technical design documents in a portable, public-safe way.

The practice variant is for real project execution, where a document must also coordinate:

- multiple teams
- rollout ownership
- dependency management
- reviewer expectations by role
- implementation-vs-runbook boundaries

## Extension Model

Keep the public skill as the stable base:

- `SKILL.md`
- `references/methodology.md`
- `references/review-rubric.md`
- `references/output-templates.md`
- `references/input-adapters.md`
- `references/public-case-studies.md`

Add a separate private or project-specific layer with references such as:

- `reviewers-by-role.md`
- `decision-records.md`
- `rollout-readiness.md`
- `design-vs-runbook.md`
- `case-patterns-from-real-projects.md`

## Responsibilities

### Public Core

Use for:

- universal TD structure
- neutral examples
- public-safe review patterns
- generic input normalization

Do not include:

- internal tools
- private URLs
- organization-specific release gates
- team-specific ownership maps

### Practice Variant

Use for:

- reviewer questions by role
- realistic rollout readiness criteria
- multi-team dependency alignment
- design-vs-implementation-vs-runbook guidance
- recurring project patterns from real delivery work

## Recommended Practice-Only Modules

### reviewers-by-role.md

Describe what each reviewer class will challenge:

- product or business
- architect
- implementer
- operator or SRE
- security or compliance when relevant

### decision-records.md

Define how to capture:

- top decisions
- rejected alternatives
- migration notes
- follow-up decisions after review

### rollout-readiness.md

Define a pre-launch checklist around:

- metrics and alerts
- rollback target
- dry run or shadow mode
- dependency confirmation
- manual fallback procedure

### design-vs-runbook.md

Help authors separate:

- design intent
- implementation detail
- deployment or runbook steps

### case-patterns-from-real-projects.md

Summarize recurring patterns from real systems, after removing sensitive details. Good examples:

- config release state machine
- pricing or amount semantic drift
- multi-team data ownership conflicts
- snapshot-based rollback design

## Migration Guidance

If a team starts from the public core and later needs a practice variant:

1. Keep the public structure unchanged.
2. Add role-specific review material only in the private layer.
3. Avoid forking the public methodology unless the structure itself changes.
4. Treat real project cases as pattern libraries, not raw document copies.

## Success Criteria

A healthy separation means:

- the public core still works for outside readers
- the practice layer makes real delivery work easier
- neither layer forces the other to absorb irrelevant detail
