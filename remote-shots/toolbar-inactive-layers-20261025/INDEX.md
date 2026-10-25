# Toolbar inactive platter layers — partial capture record

## Sources

- Required fixture read in the original capture checkout: `C:\custom\code\macos27-glass-captures\Sources\SwiftUIToolbarPopupOverlap\main.swift`; SHA-256 `5768fab70d4324cb7e50e7a015c52fd7152ebc4f326a01246a5972f781ed0164`.
- Dedicated probe: [`Sources/ToolbarInactiveLayers/main.swift`](../../Sources/ToolbarInactiveLayers/main.swift); runner SHA-256 at commit `e0083cc40e17f792f13b071836e1e23b2b2dbc54`: `d6dd2fc61a0dea7cbd96061fdc3fae0124cc47919e82b61d28a7667a85fc910e`.
- Probe/helper/workflow commit: [`e0083cc`](https://github.com/ThrowTop/macos27-glass-captures/commit/e0083cc40e17f792f13b071836e1e23b2b2dbc54). The second build error demonstrates the source still does not compile; no captures are claimed.

## Runner jobs

| Run | Result | Environment | Raw compiler log |
|---|---|---|---|
| [40224468513](https://github.com/ThrowTop/macos27-glass-captures/actions/runs/40224468513) | Build failed; capture skipped | [environment.txt](run-40224468513/macos27-glass-captures/macos27-glass-captures/out/toolbar-inactive-layers/environment.txt) | [build.log](run-40224468513/macos27-glass-captures/macos27-glass-captures/out/toolbar-inactive-layers/build.log) |
| [40224600361](https://github.com/ThrowTop/macos27-glass-captures/actions/runs/40224600361) | Build failed; capture skipped | [environment.txt](run-40224600361/macos27-glass-captures/macos27-glass-captures/out/toolbar-inactive-layers/environment.txt) | [build.log](run-40224600361/macos27-glass-captures/macos27-glass-captures/out/toolbar-inactive-layers/build.log) |

Runner: macOS 27.0.1 (26A434), Xcode 27.1, ARM64. Both jobs uploaded only environment, compiler log and app Info.plist. The first failed on Swift type-check complexity in capture-state/view records, NSString/String bridge, and CGColor cast. The second failed on nonexistent `NSWindow.keyView` and obsolete `CGColorGetTypeID()`; exact diagnostics are in the logs above. Retry budget exhausted at the same build step.

## State gates and outputs

| Appearance/state | App active | Window key/main/visible | Other app frontmost | Frame/scale | PNG / JSON |
|---|---|---|---|---|---|
| Dark — target active before Finder | Not run | Not run | Not run | Not measured | Not produced |
| Dark — Finder active | Not run | Not run | Not run | Not measured | Not produced |
| Dark — target reactivated | Not run | Not run | Not run | Not measured | Not produced |
| Light — target active before Finder | Not run | Not run | Not run | Not measured | Not produced |
| Light — Finder active | Not run | Not run | Not run | Not measured | Not produced |
| Light — target reactivated | Not run | Not run | Not run | Not measured | Not produced |

No screen images, control crops, input/dump JSON, AX focus data, visibility/occlusion records, or layer identities were produced. The executable did not launch, so there are no active or inactive records and no settled-frame equivalence evidence.

## Changed-field table and composition gaps

| Item | Exact changed fields | Evidence |
|---|---|---|
| Navigation / sidebar | N/A — not captured | No JSON or PNG |
| Segmented Picker | N/A — not captured | No JSON or PNG |
| Menu Picker | N/A — not captured | No JSON or PNG |
| More | N/A — not captured | No JSON or PNG |
| Compare (fixture tint retained in source) | N/A — not captured | No JSON or PNG |

Unavailable/unmeasured for all requested items and platter layers: active/key/main gates, view-root/key appearance and semantic context, `glassBehavior`, `variant`, `effectiveVariant`, `subdued`, tint, opacity-reduced, corner radius; layer identity and geometry, transforms, opacity, hidden, fills/contents, borders, filters/background filters and filter inputs, masks, and sublayer order. No values were inferred. Retained versus replaced native objects and geometry remain unknown.
