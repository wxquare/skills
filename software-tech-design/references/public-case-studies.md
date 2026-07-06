# Public Case Studies

These examples are anonymized and intentionally generic. Use them as writing patterns, not as fixed domain templates.

## 1. Multi-Provider Ticket Booking

### Background

A platform is adding a new booking flow that depends on an upstream provider while keeping the customer-facing API stable.

### Decision Conflict

- Reuse upstream item identifiers directly
- Create platform-owned identifiers and mapping tables

### Recommended Writing Pattern

- Put the identifier strategy in `Key Decisions`
- Explain the tradeoff between implementation speed and abstraction stability
- Group provider dependency and rollback risk in one rollout section

### Common Gaps

- The document becomes a field-mapping dump
- Dependencies are spread across API sections and TODO notes

## 2. Metadata Governance Platform

### Background

A team wants a shared metadata service to reduce duplication across products.

### Decision Conflict

- Build a centralized governance platform
- Keep domain-owned metadata with thin shared conventions

### Recommended Writing Pattern

- Separate technical feasibility from operating cost
- Include ownership, review workflow, and lifecycle cost in the main design

### Common Gaps

- The document proves the architecture can exist but ignores long-term maintenance

## 3. Admin Fee Promotion Rollout

### Background

A platform needs promotional pricing logic while preserving compatibility with legacy settlement flows.

### Decision Conflict

- Keep price adjustments in the upstream billing path
- Move promotional logic into the platform layer

### Recommended Writing Pattern

- Make price semantics explicit
- Describe rollback and verification steps alongside rollout sequencing

### Common Gaps

- Interface details are exhaustive, but price meaning and snapshot rules remain ambiguous

## 4. New Supplier Onboarding

### Background

A system is integrating a new external supplier into an existing catalog and search workflow.

### Decision Conflict

- Add supplier-specific branching quickly
- Introduce a generic adapter layer first

### Recommended Writing Pattern

- State the speed-versus-generality tradeoff explicitly
- Pull all blockers into a single preconditions section

### Common Gaps

- The design doc turns into an onboarding checklist without explaining system behavior
