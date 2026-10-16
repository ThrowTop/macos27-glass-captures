# macOS 27 glass captures

This private repository runs a native AppKit and SwiftUI capture harness on GitHub's `xcode-27` hosted runner. It does not depend on MacUIKit.

Open **Actions → macOS 27 glass captures → Run workflow**. Use `smoke` first for the four required NSSwitch combinations, or `all` for the broader matrix. A comma-separated list of scenario IDs limits the optional matrix; the required switch cases always run first. The job uploads the `macos27-captures` artifact even when capture fails.

`out/env.txt` and `out/display.json` report the OS, display modes, backing scale, accent values, and screen capture access. `out/log.txt` records injected events, capture methods, and errors. `out/manifest.json` lists every capture with its phase, geometry, method, and success. `out/incomplete.txt` lists scheduled cases that lack frames, and `out/quality-warnings.txt` lists held crops identical to idle. PNGs and live layer-tree JSON are below `out/<scenario>/<appearance>-<accent>-<size>-<state>-<interaction>/<background>/`. `out/gate.txt` reports whether the four required regular-on NSSwitch combinations have idle and all held captures plus a held layer dump.

The app uses ScreenCaptureKit's display composite cropped to the test window. AppKit lifts pressed Solarium controls into a separate overlay window, so a filter for only the original window loses the held control. If ScreenCaptureKit fails, the app tries a composited screen region with `/usr/sbin/screencapture -R` and records that fallback. It does not use offscreen view rendering. Missing captures remain explicit failures. The optional matrix is best effort; rerun a scenario filter to collect more cases.

Green and graphite accent batches include a preliminary window capture under `out/warmup-<accent>/`. Hosted WindowServer consent overlays have obscured the first window of a fresh accent process. The warm-up files remain in the artifact; the scheduled cases and manifest start after that window.
