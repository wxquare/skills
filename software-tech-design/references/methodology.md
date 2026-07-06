# Technical Design Writing Methodology

This reference defines the default structure and the reasoning standard for a strong technical design document.

## What Good Looks Like

A strong design document does four things well:

1. Defines the problem and why it matters
2. Makes the key decisions easy to find and evaluate
3. Explains how responsibilities, interfaces, and rollout fit together
4. Leaves reviewers with a short list of real open questions instead of hidden ambiguity

For real project use, there is a fifth expectation:

5. It allows different reviewers to answer different questions without rereading the whole document

## Recommended Section Order

Use this section order by default:

1. `Background / Objective / Scope`
2. `Current State / Problem Statement`
3. `Key Decisions`
4. `End-to-End Flow / Responsibility Split`
5. `API / Data Contract`
6. `Dependency / Rollout / Risk / Rollback`
7. `Open Questions / Assumptions`
8. `Work Breakdown / Owner / Timeline`

Before expanding the full document, prepare a short **Top Decisions** list. In a healthy design review, a reviewer should be able to find the 2-5 most important decisions in under one minute.

## Section Intent

### 1. Background / Objective / Scope

State:

- Why this work exists now
- What success looks like
- What is intentionally out of scope

Common failure:

- Background is long, but the objective is vague
- Scope is implied rather than stated

### 2. Current State / Problem Statement

Describe:

- The current system or workflow
- The concrete pain points
- Why the existing path is insufficient

Common failure:

- Jumps straight into solution details without proving the problem

### 3. Key Decisions

List the decisions that reviewers must agree with. For each decision, capture:

- Options considered
- Chosen option
- Why it was chosen
- Tradeoffs
- Fallback or migration path if relevant

Common failure:

- Documents list option A and B but never define the selection criteria
- The chosen option is implied by examples but never stated directly

### 4. End-to-End Flow / Responsibility Split

Explain:

- What happens from input to output
- Which subsystem owns which step
- Where validation, transformation, retries, or async boundaries happen

Common failure:

- Architecture diagram exists, but responsibility boundaries remain unclear

### 5. API / Data Contract

Include:

- Request and response shape
- Field semantics
- Compatibility expectations
- Validation rules
- Idempotency or ordering rules if relevant
- Field semantics and units
- Whether names such as `amount`, `status`, `snapshot`, `version`, or `state` mean the same thing across the document

Common failure:

- Interface fields are listed, but their meaning and lifecycle are not
- Different sections use the same field name with different meanings

### 6. Dependency / Rollout / Risk / Rollback

Group operational concerns in one place:

- Upstream or downstream dependencies
- Blockers and preconditions
- Rollout sequencing
- Risk scenarios
- Rollback or mitigation plan

Common failure:

- Dependencies are scattered across the doc and hidden in implementation notes
- Rollout and rollback are present only as placeholders rather than executable plans

### 7. Open Questions / Assumptions

Make uncertainty explicit. Use this section to avoid accidental hidden decisions.

Common failure:

- Important assumptions are buried in prose and never reviewed directly

### 8. Work Breakdown / Owner / Timeline

Capture:

- Workstreams
- Owners or role types
- Critical sequencing
- Validation milestones

Common failure:

- Delivery plan exists, but design readiness is unclear

## Design vs. Implementation Boundary

Default rule:

- A design document should explain what is being built, why, and how the system behaves.
- It should not become a setup manual unless the user explicitly asks for that.

Signals that a draft has drifted too far into implementation:

- Large blocks of commands before the decisions are explained
- File-by-file edits without a system model
- SQL, config, or curl examples dominating the document
- Rollout concerns embedded in unrelated sections

## Reviewer Lenses

A strong design should survive at least four reviewer lenses:

- **Business / product**: why now, for whom, and what is not in scope
- **Architect**: decisions, tradeoffs, boundary quality, long-term shape
- **Implementer**: responsibilities, APIs, data flow, state transitions
- **Operator**: rollout, rollback, observability, failure handling

If one of these lenses cannot extract what it needs quickly, the document is structurally weak even if technically correct.

## Review Heuristics

If you need a quick judgment, ask:

- Can a reviewer find the top 3 decisions in under one minute?
- Can an implementer tell what is in scope and out of scope?
- Can another team tell what they need to provide?
- Can an operator tell how rollout and rollback work?
- Can the author point to unresolved questions without rereading the whole doc?
- Can a reader tell whether the document is still a design or has become an implementation runbook?
