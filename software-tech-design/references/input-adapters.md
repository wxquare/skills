# Input Adapters

This reference explains how to normalize different source materials into the same design information card.

## Markdown Draft

Best when the user already has a structured draft.

How to process:

- Extract headings first
- Identify sections that map to the standard design structure
- Detect missing sections and mixed abstraction levels

Watch for:

- Long implementation sections before key decisions
- TODO-heavy drafts with no central decision summary
- Repeated field names whose meaning changes across sections

## Plain Text Notes

Best when the user has meeting notes, chat summaries, or rough bullets.

How to process:

- Separate facts from decisions
- Group similar bullets into problem, decision, dependency, and risk buckets
- Turn unresolved bullets into explicit open questions

Watch for:

- Many statements that sound like assumptions but are not labeled as such
- Facts, proposals, and action items mixed together without separation

## Requirement Summary

Best when the user has a product or business request but no design draft yet.

How to process:

- Extract objective, scope, constraints, and key disputes
- Draft the decision section early
- Leave placeholders for unknown interface or rollout details

Watch for:

- Pressure to over-specify details that are not yet known
- Missing top-level design decisions before the outline is expanded

## User-Provided URL Summary

Best when the user pastes a summary of a web page or external document.

How to process:

- Treat it like plain text unless the page content is available locally
- Avoid assuming the structure of the original page

Watch for:

- Hidden reliance on inaccessible source material

## Normalized Design Information Card

All input types should be normalized into:

- Background
- Objective
- Scope and non-goals
- Current state or problem
- Key decisions
- End-to-end flow
- API or data contract
- Dependencies and constraints
- Risks and rollback
- Open questions and assumptions
- Work breakdown and owners

After normalization, produce a **Top Decisions** list before writing or reviewing the full structure.
