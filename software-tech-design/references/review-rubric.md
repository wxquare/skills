# Review Rubric

Use this rubric to review a technical design document. Report findings before summaries.

## Severity

- `P0`: Missing information that blocks safe implementation or review
- `P1`: Important design gap or ambiguity that could cause rework, ownership confusion, or rollout risk
- `P2`: Secondary structure or clarity issue that reduces review quality

## Categories

### 1. Goal and Scope

Look for:

- Objective is missing or vague
- Scope and non-goals are not explicit
- Success criteria are unclear

Typical finding:

- The document explains context but does not define what outcome it is trying to achieve

### 2. Problem Definition

Look for:

- Current state is absent
- No evidence that the existing solution is insufficient
- Problem statement is mixed with implementation details

### 3. Decision Quality

Look for:

- Options are listed without evaluation criteria
- Chosen option is implied rather than stated
- Tradeoffs are missing
- Fallback or migration path is absent when needed

### 4. Responsibility Boundaries

Look for:

- Unclear ownership between systems or teams
- Hidden dependencies
- End-to-end flow cannot be reconstructed from the doc

### 5. Interface and Data Semantics

Look for:

- Fields are listed without semantics
- Validation and compatibility rules are missing
- Idempotency, ordering, or lifecycle assumptions are unstated
- Amount, status, version, or state fields drift in meaning across sections

### 6. Rollout and Risk

Look for:

- No rollout strategy
- No rollback or mitigation plan
- Blockers and preconditions are scattered
- Operational risks are not grouped and surfaced

### 7. Open Questions and Assumptions

Look for:

- Important uncertainty is hidden in narrative text
- Assumptions are not called out explicitly
- Reviewers would have to infer unresolved items themselves

### 8. Document Structure

Look for:

- Design and implementation guide are mixed together
- Review-critical sections are buried deep in the document
- Repeated content obscures the main argument

### 9. Reviewer Coverage

Look for:

- The document does not serve business, architect, implementer, and operator readers equally
- Key reviewer questions can only be answered by inference
- The top decisions are not visible early enough

## Review Output Shape

Use this structure:

1. Findings ordered by severity
2. Open questions or assumptions
3. Optional short summary

Each finding should include:

- Severity
- Category
- What is missing or unclear
- Why it matters
- A concrete rewrite suggestion

When useful, group findings under these reviewer-facing buckets:

- decision gaps
- risk gaps
- responsibility gaps
- semantic gaps
