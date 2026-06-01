# Element Templates

Copy-paste JSON templates for each Excalidraw element type. The `strokeColor` and `backgroundColor` values are placeholders — always pull actual colors from `color-palette.md` based on the element's semantic purpose.

## Free-Floating Text (no container)
```json
{
  "type": "text",
  "id": "label1",
  "x": 100, "y": 100,
  "width": 200, "height": 25,
  "text": "Section Title",
  "originalText": "Section Title",
  "fontSize": 20,
  "fontFamily": 3,
  "textAlign": "left",
  "verticalAlign": "top",
  "strokeColor": "<title color from palette>",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 1,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 11111,
  "version": 1,
  "versionNonce": 22222,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "containerId": null,
  "lineHeight": 1.25
}
```

## Line (structural, not arrow)
```json
{
  "type": "line",
  "id": "line1",
  "x": 100, "y": 100,
  "width": 0, "height": 200,
  "strokeColor": "<structural line color from palette>",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 2,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 44444,
  "version": 1,
  "versionNonce": 55555,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "points": [[0, 0], [0, 200]]
}
```

## Small Marker Dot
```json
{
  "type": "ellipse",
  "id": "dot1",
  "x": 94, "y": 94,
  "width": 12, "height": 12,
  "strokeColor": "<marker dot color from palette>",
  "backgroundColor": "<marker dot color from palette>",
  "fillStyle": "solid",
  "strokeWidth": 1,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 66666,
  "version": 1,
  "versionNonce": 77777,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false
}
```

## Rectangle
```json
{
  "type": "rectangle",
  "id": "elem1",
  "x": 100, "y": 100, "width": 180, "height": 90,
  "strokeColor": "<stroke from palette based on semantic purpose>",
  "backgroundColor": "<fill from palette based on semantic purpose>",
  "fillStyle": "solid",
  "strokeWidth": 2,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 12345,
  "version": 1,
  "versionNonce": 67890,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": [{"id": "text1", "type": "text"}],
  "link": null,
  "locked": false,
  "roundness": {"type": 3}
}
```

## Text (centered in shape)
```json
{
  "type": "text",
  "id": "text1",
  "x": 130, "y": 132,
  "width": 120, "height": 25,
  "text": "Process",
  "originalText": "Process",
  "fontSize": 16,
  "fontFamily": 3,
  "textAlign": "center",
  "verticalAlign": "middle",
  "strokeColor": "<text color — match parent shape's stroke or use 'on light/dark fills' from palette>",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 1,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 11111,
  "version": 1,
  "versionNonce": 22222,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "containerId": "elem1",
  "lineHeight": 1.25
}
```

## Arrow
```json
{
  "type": "arrow",
  "id": "arrow1",
  "x": 282, "y": 145, "width": 118, "height": 0,
  "strokeColor": "<arrow color — typically matches source element's stroke from palette>",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 2,
  "strokeStyle": "solid",
  "roughness": 0,
  "opacity": 100,
  "angle": 0,
  "seed": 33333,
  "version": 1,
  "versionNonce": 44444,
  "isDeleted": false,
  "groupIds": [],
  "boundElements": null,
  "link": null,
  "locked": false,
  "points": [[0, 0], [118, 0]],
  "startBinding": {"elementId": "elem1", "focus": 0, "gap": 2},
  "endBinding": {"elementId": "elem2", "focus": 0, "gap": 2},
  "startArrowhead": null,
  "endArrowhead": "arrow"
}
```

For general diagrams, use 3+ points in `points` array when a routed connector needs bends.

For ER diagrams, prefer orthogonal polylines instead of curves:
- Use horizontal/vertical segments.
- Keep bends minimal and close to table rectangle edges.
- Preserve cardinality labels such as `1:N`, `M:N`, or `1:1` as nearby text elements.
- Avoid sweeping arcs, diagonal curves, and long detours around unrelated tables.

## ERD Table Card Pattern

Use this pattern for database ER diagrams. Do not try to encode a whole table as one multiline text block; rows should have enough vertical spacing to avoid clipping in Excalidraw.

Recommended structure:
- Outer rounded rectangle for the table body.
- Colored header rectangle with the table name.
- One row per important field.
- Left text for field marker/name, right text for type.
- Small markers such as `PK`, `FK`, `N`, `status`, or `trace` rendered as short text labels.

```json
[
  {
    "type": "rectangle",
    "id": "table_task_body",
    "x": 100, "y": 100,
    "width": 260, "height": 210,
    "strokeColor": "<domain stroke from palette>",
    "backgroundColor": "#ffffff",
    "fillStyle": "solid",
    "strokeWidth": 1,
    "strokeStyle": "solid",
    "roughness": 0,
    "opacity": 100,
    "angle": 0,
    "seed": 1001,
    "version": 1,
    "versionNonce": 1002,
    "isDeleted": false,
    "groupIds": ["table_task"],
    "boundElements": null,
    "link": null,
    "locked": false,
    "roundness": {"type": 3}
  },
  {
    "type": "rectangle",
    "id": "table_task_header",
    "x": 100, "y": 100,
    "width": 260, "height": 34,
    "strokeColor": "<domain stroke from palette>",
    "backgroundColor": "<domain header fill from palette>",
    "fillStyle": "solid",
    "strokeWidth": 1,
    "strokeStyle": "solid",
    "roughness": 0,
    "opacity": 100,
    "angle": 0,
    "seed": 1003,
    "version": 1,
    "versionNonce": 1004,
    "isDeleted": false,
    "groupIds": ["table_task"],
    "boundElements": null,
    "link": null,
    "locked": false,
    "roundness": {"type": 3}
  },
  {
    "type": "text",
    "id": "table_task_title",
    "x": 112, "y": 108,
    "width": 230, "height": 20,
    "text": "product_supply_task",
    "originalText": "product_supply_task",
    "fontSize": 15,
    "fontFamily": 8,
    "textAlign": "left",
    "verticalAlign": "middle",
    "strokeColor": "#ffffff",
    "backgroundColor": "transparent",
    "fillStyle": "solid",
    "strokeWidth": 1,
    "strokeStyle": "solid",
    "roughness": 0,
    "opacity": 100,
    "angle": 0,
    "seed": 1005,
    "version": 1,
    "versionNonce": 1006,
    "isDeleted": false,
    "groupIds": ["table_task"],
    "boundElements": null,
    "link": null,
    "locked": false,
    "containerId": null,
    "lineHeight": 1.25
  }
]
```

Field rows should be separate text elements, usually `fontSize: 11-13`. Keep a minimum row height of 20px, and increase table width before shrinking text. For user-requested Comic Shanns diagrams, keep every text element at `fontFamily: 8`.
