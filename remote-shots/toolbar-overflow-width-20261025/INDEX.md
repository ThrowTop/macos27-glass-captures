# Toolbar overflow width capture index

Status: partial. Branch `luna/toolbar-overflow-width`; runner jobs 40222801477 and 40222955228 (both within the two-job budget). Job 40222801477 failed at build; job 40222955228 built and completed its capture step successfully.

## Source and capture set

- Reference source: `Sources/SwiftUIToolbarPopupOverlap/main.swift`, SHA-256 `5768FAB70D4324CB7E50E7A015C52FD7152EBC4F326A01246A5972F781ED0164`.
- Dedicated probe: `Sources/ToolbarOverflowWidth/main.swift`, SHA-256 `E52AF9FC0E010F45EC6432E19E0C9867D590AD757B7CA397400D0E1ABDE5E1C9`.
- Runner: xcode-27, macOS 27.0.1 (26A434), 1x; dark and light appearances.
- Cases: baseline, ordinary window title (`Ordinary Window Title`), and one plain button. Baseline and title each have 559 width samples per appearance; single-button has 1280 and 820 per appearance. Requested and actual widths match in all 2,240 samples.
- Every per-width record says the app is active, window key and visible, and window/screen scale 1. This passes the state checks only; no image was produced.

## Membership and native inputs

- Compact sample table: `membership.tsv`; compact JSON: `membership.json`. Each row includes requested/actual width, stable AX identifiers, visible native toolbar item order/identifier/default priority, selection state, window state, toolbar/title frames and availability fields.
- Full native/AX input dumps: `run-40222955228/toolbar-overflow-width-20261025/out/toolbar-overflow-width-20261025/{baseline,window-title,single-button}/{dark,light}/width-*.json`. These contain every item’s source order, identifier, default visibility priority, min/max/current size, visibility, partition, priorityIndex, participation, selection, menuFormRepresentation, layoutRect and defaultItemPadding fields, plus AX state.
- Baseline and title membership is identical in dark and light. All native item visibility priorities read `0` (system default). At 1280, source orders `0–7` are visible; at 820, `0–5`; at 600, only `4,5`.
- Exact baseline/title transitions (same in both appearances), with raw source order, item identifier and priority: `920→919`, order `7`, `F47FFBFB-61CD-4FD2-8E68-77631338430D` (Compare menu form), priority `0`; `871→870`, order `6`, `14D7289A-66D7-4B4D-B2CB-7E8448ADD92F` (More image actions menu), priority `0`; `818→817`, order `3`, `NSToolbarFlexibleSpaceItem`, priority `0`; `814→813`, order `2`, `3C671702-600A-4846-98FB-14FDABB66A55` (200-pt diagnostic menu Picker), priority `0`; `610→600`, order `0`, `1B9B988C-E4A4-4E53-AA58-55F71EACE524` (Tools segmented Picker), priority `0`. Every integer in the surrounding sampled intervals is present in `membership.tsv` and the per-width JSON. At 600 the stable AX identifier `tools-segmented` is absent.
- At 1280 the native source-order item sizes are: `0` 213×36 (Tools); `1` fixed space, min 8×36; `2` 200×36 (diagnostic Picker); `3` flexible space, min 8×36/max 20000×36; `4` 36×36; `5` 37×36; `6` 42×36 (More); `7` 92×36 (Compare). The full files retain item UUIDs and all other widths.
- The ordinary title value is present in window-title records, but `titleAXFrame` reads `0,0,0,0`. `toolbarAXFrame` is readable (for example `70,40,1280,52` at 1280). `availableSectionWidths` is unavailable. The recorded overflow candidate frame is `0,768,0,0`, not a usable viewer frame.
- `partition`, `priorityIndex`, `participation`, `selection`, and `defaultItemPadding` are unavailable for native toolbar items. `layoutRect` returns opaque `_NSViewAlignmentLayoutRect` object descriptions, not readable geometry. Swift selection stays tools `0`, diagnostic `0`, export format `0`, Compare false in width samples.

## Menus, images and exclusions

- Pre-open AX dumps exist for dark and light at `run-40222955228/toolbar-overflow-width-20261025/out/toolbar-overflow-width-20261025/baseline/dark/ax-overflow-before-baseline-dark.json` and `run-40222955228/toolbar-overflow-width-20261025/out/toolbar-overflow-width-20261025/baseline/light/ax-overflow-before-baseline-light.json` (165 nodes each). Each contains an `AXPopUpButton` titled `more toolbar items`, frame `845,47,38,38` at 820. The probe matcher only accepts `AXMenuButton` for overflow; no post-open tree or menu row/action record was produced. The saved pre-open tree shows why the intended overflow target was missed.
- No open-overflow/menu-picker/Menu submenu images, selection actions or action counter updates were captured. Per-width `actionCounts` remain `{}`. AX enabled/selected/value attributes are preserved where available in the pre-open tree; no menu rows/checks were opened.
- Recursive artifact scan found **0 PNG files** (no full-screen captures or window crops). The screenshot state gates passed in JSON, but screenshot exit/path/dimensions gates are absent; the runner did not retain the probe’s stdout. `screen-capture-grant.txt` records grant-helper exit 0, which does not establish a saved screen image.
- First-run raw compiler failure: `run-40222801477/toolbar-overflow-width-20261025/build.log` and `run-40222801477/failed.log`. The CGFloat width, accessibilityIdentifier call and SafeKVC key bridge were fixed; second-run build passed.
- Second-run workflow log: `run-40222955228/runner.log`. Raw artifact total was 120,794,852 bytes; 2,240 width JSON records, six per-case TSVs, and two pre-open AX JSONs. No capture images were uploaded.

## Paths

- Raw run artifacts: `remote-shots/toolbar-overflow-width-20261025/run-40222801477/` and `remote-shots/toolbar-overflow-width-20261025/run-40222955228/`.
- Compact membership: `remote-shots/toolbar-overflow-width-20261025/membership.tsv` and `membership.json`.
- Open-menu PNGs: unavailable. Remaining gaps: screenshot exit/path evidence; opening the discovered `AXPopUpButton` overflow control; all menu/submenu rows, checks, disabled states and action outcomes; readable title frame, section widths, overflow viewer frame, and native private fields listed above.
