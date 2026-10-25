# Toolbar popup feedback capture — 2026-10-25

Status: PARTIAL. Two runner jobs consumed; no image state passed. Runner: `xcode-27`, workflow run [40221992870](https://github.com/ThrowTop/macos27-glass-captures/actions/runs/40221992870) and [40222166695](https://github.com/ThrowTop/macos27-glass-captures/actions/runs/40222166695).

## Source and harness
- Capture branch source commit: `38e9d41591be8eac295a81e69d58385be3dee709`; probe SHA-256: `8b7708a202e723e0f8f3ea0b47da9d2366ebd9a0a46680501ec69b39d323b200` (recorded in run 2 artifact).
- Base fixture read from the original checkout (absent from `origin/main` worktree): SHA-256 `5768FAB70D4324CB7E50E7A015C52FD7152EBC4F326A01246A5972F781ED0164`.
- Run 1 failed dedicated compilation (`@main` required `-parse-as-library`; `frame` helper collided with `NSView.frame`; `CGDisplayCreateImage` unavailable). Raw log: `run-40221992870/compiler-failed.log`; its uploaded artifact contains `macos27-captures/build.log` only.
- Run 2 compiled successfully. Capture failed after the dark idle attempt and hover attempt. Raw workflow log: `run-40222166695/capture-failed.log`; downloaded artifact: `run-40222166695/macos27-captures/`.

## Gate matrix
| Appearance | idle away | hover | held | released | menu-open | accepted |
|---|---|---|---|---|---|---|
| dark | excluded: no screenshot; sentinel stability only | failed: `HOVER_SIGNAL` remained false | not reached | not reached | not reached | none |
| light | not launched | not launched | not launched | not launched | not launched | none |

ScreenCaptureKit preflight returned `screen-recording-access-unavailable (preflight; no prompt requested)`. The idle `SETTLED` marker is explicitly excluded because all crop reads returned the same unavailable sentinel. The workflow then stopped at `dark state gate failed: hover`. No permission prompt was interacted with.

## Raw input and dump excerpts
- Display reported `1024x768` points at scale `1.0`; window was active/key/visible with frame `{{80, 60}, {1280, 677}}`.
- Popup AX identifier `toolbar-diagnostic-popup`; AX frame `x=810,y=39,w=200,h=36`. Sent pointer-away to `(24,24)` and hover-target event to AX-frame center `(910,57)`. No mouse down/up was sent; no popup menu tracking observed.
- Fixture composition retained: separate principal segmented Picker, fixed principal spacer, 200 pt menu Picker, 260 pt sidebar, 300 pt inspector, Compare `.glassProminent` tint/style.
- Source-level raw options: popup/viewer `controlSize`, glass behavior, variant, subvariant, subdued and glass context all unspecified; picker modifiers `PickerStyle.menu`, width `200`, labels hidden.
- Runtime excerpt: `AX role=AXPopUpButton ... desc=Glass diagnostic view id=toolbar-diagnostic-popup frame=x=810.0,y=39.0,w=200.0,h=36.0`. Runtime hierarchy contains `NSGlassEffectView` sidebar/inspector hosts (260×677 and 300×677); no popup platter was opened.
- KVC key checks are in `dark-events.txt`: `glassBehavior`, `variant`, `subvariant`, `subdued`, `glassContext` report `available=false`; `controlSize` is unavailable on most views and returns `Optional(0)` on some hosting views. No hosted label/button metrics were exposed as `NSButton`/`NSTextField` nodes. These are raw runtime observations, not defaults.

## Files and missing evidence
- Runtime/AX dump and event log: `run-40222166695/macos27-captures/out/toolbar-popup-feedback/dark-events.txt`.
- Probe hash record: `run-40222166695/macos27-captures/out/toolbar-popup-feedback/probe-source-sha256.txt`.
- Full-screen PNGs, popup crops, unchanged crops, pixel-delta summaries, light logs and held/released/menu dumps: absent. Screenshot call reported `SCREENSHOT_FAIL state=idle`; no accepted screenshots exist.
- No image delta or appearance comparison is possible. No Apple defaults or parity conclusions are drawn.
