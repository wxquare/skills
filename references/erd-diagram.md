# ERD Diagram Guide

Use this guide when creating Excalidraw ER diagrams, data model diagrams, database schema diagrams, or table relationship diagrams.

ERDs should explain the model, not dump every column and line. For complex systems, the most important work happens before drawing: classify the model, remove noise, and decide which relationships deserve visual weight.

## Preparation

1. Collect the source of truth: SQL/schema files, docs, existing diagrams, and the user's reference style.
2. Build a table inventory with each table's purpose, lifecycle stage, and key owner domain.
3. Identify the golden path: the core lifecycle a reader must understand first.
4. Separate core lifecycle tables from cross-cutting support tables such as logs, outbox, DLQ, compensation, audit, and metrics.
5. Decide the audience. Review/teaching diagrams should prioritize readability and flow over physical-schema completeness.

## Grouping Strategy

Never auto-layout 20+ tables into a flat graph. Group tables by lifecycle or business domain.

Common lifecycle groups:
- **Input / Task Domain**: draft, task, file, task item, import batch.
- **Validation / Control Domain**: staging, validation result, change request, field ownership, policy.
- **Review / Publish Domain**: review, review item, publish record, snapshot, change log.
- **Governance / Reliability Domain**: object mapping, operation log, outbox event, dead letter, compensation task, quality issue.

Place the golden path across the main reading direction, usually left to right. Put cross-cutting governance tables on the right or bottom so they support the main path without creating a spider web.

## Field Pruning

Show only fields that teach structure or behavior.

Keep by default:
- Primary keys: `id`, `*_id`.
- Important foreign keys: parent IDs and lifecycle join keys.
- Control fields: `status`, `state`, `risk_level`, `policy`, `review_policy`, `qc_policy`.
- Versioning fields: `snapshot_id`, `base_snapshot_id`, `version`, `content_hash`, `checksum`.
- Reliability fields: `retry_count`, `error_code`, `next_retry_at`, `source`, `event_type`.
- Traceability fields: `trace_id`, `supply_trace_id`, `operation_id`, but render them as tags unless they are the focus.

Hide by default:
- Routine audit fields: `created_at`, `updated_at`, `deleted_at`.
- Repeated operator fields unless ownership/audit is the point.
- Large JSON/blob fields unless the content shape matters.

## Relationship Rules

Use line style to encode relationship strength.

Line geometry:
- Use orthogonal polylines for ERD relationships, not curves.
- Keep bends minimal: prefer 0-2 turns, and add more turns only to avoid crossing table bodies.
- Route lines close to rectangle edges and connect from the nearest sensible side of each table.
- Avoid large sweeping arcs, diagonal curves, or lines that float far away from the related tables.
- Keep relationship labels such as `1:N`, `M:N`, `1:1`, and short transition labels near the line segment they describe.

Strong relationships:
- Use solid lines.
- Use for lifecycle parent-child links and true 1:N ownership.
- Examples: `task -> task_item (1:N)`, `task -> file (1:N)`, `review -> review_item (1:N)`, `publish_record -> publish_snapshot (1:N)`.

Golden path:
- Use a thicker blue or green line.
- Connect the main lifecycle from draft/input to published/output.
- Label important transitions such as `create`, `normalize`, `diff`, `review`, `approve`, `snapshot`, `outbox`, and keep cardinality labels like `1:N` or `M:N` when they clarify the data relationship.

Weak or logical relationships:
- Use dashed lines or omit the line.
- Use for trace IDs, operation IDs, optional lookup IDs, and broad audit joins.
- Do not draw global IDs such as `trace_id` across every table. Add a small `trace` tag or field marker inside relevant tables instead.

Exception and governance branches:
- Use thin orange or red dashed lines.
- Hang them below or outside the main path.
- Examples: validation failure, DLQ, compensation, quality issue, replay, manual fix.

## Visual Grammar

Use a restrained ERD style:
- Large pale group boxes for domains, with a clear title in the top-left.
- Table cards with a colored header, field rows, and a type column.
- Mark primary keys with `PK` or a small key marker.
- Mark foreign keys with `FK`.
- Mark nullable fields with `N` only when nullability matters.
- Mark control fields with small `status`, `policy`, `risk`, or `retry` tags.
- Use `Comic Shanns` when requested by the user. In Excalidraw JSON, use `fontFamily: 8` consistently for those diagrams.

Recommended palette:
- Group backgrounds: very pale blue/gray/green/yellow.
- Table headers: muted technology blue, deep teal, slate, amber, or rose by domain.
- Strong relationships: slate or graphite.
- Golden path: vivid but not neon blue/green.
- Exceptions: muted orange/red dashed lines.

## ER Table Template

An ER table should read like a compact database card:

```text
┌──────────────────────────────┐
│ product_supply_task          │  header
├──────────────┬───────────────┤
│ PK id        │ bigint        │
│ FK draft_id  │ bigint        │
│ status       │ enum          │  status tag
│ trace        │ varchar       │  trace tag, no global mesh
└──────────────┴───────────────┘
```

For Excalidraw, build this from rectangles and text:
- One outer rounded rectangle.
- One colored header rectangle.
- Alternating light field rows if the table is tall.
- Separate left field-name text and right type text.
- Small marker text for `PK`, `FK`, `N`, `status`, `trace`.

## Layout Checklist

Before writing JSON:
- Can the reader identify the four or fewer major domains?
- Is the golden path obvious without reading every field?
- Are cross-cutting tables parked outside the main path?
- Are repeated audit fields hidden?
- Are global trace fields shown as tags instead of lines?
- Are exception paths visually secondary?
- Are relationship lines orthogonal polylines with minimal bends, routed along table edges?
- Are cardinality labels such as `1:N` and `M:N` preserved where they matter?

After rendering:
- JSON parses.
- Font family is consistent with the user's requested style.
- No invalid color strings are present.
- No text is clipped or covered by table rows.
- Arrows do not pass through table bodies.
- Relationship lines do not use broad curves or unnecessary detours.
- The diagram does not look like a dense FK spider web.
- A reader can explain the model's lifecycle in under one minute.
