# macOS 27 glass captures

This private repository runs a native AppKit and SwiftUI capture harness on GitHub's `xcode-27` hosted runner. It does not depend on MacUIKit.

Open **Actions → macOS 27 glass captures → Run workflow**. Use `smoke` first for the four required NSSwitch combinations, or `all` for the broader matrix. A comma-separated list of scenario IDs limits the optional matrix; the required switch cases always run first. The job uploads the `macos27-captures` artifact even when capture fails.

`out/env.txt` and `out/display.json` report the OS, display modes, backing scale, accent values, and screen capture access. `out/log.txt` records injected events, capture methods, and errors. `out/manifest.json` lists every capture with its phase, geometry, method, and success. PNGs and live layer-tree JSON are below `out/<scenario>/<appearance>-<accent>-<size>-<state>-<interaction>/<background>/`. `out/gate.txt` reports whether the four required regular-on NSSwitch combinations have idle and all held captures plus a held layer dump.

The app tries ScreenCaptureKit, then the window-server `screencapture -l` command. It does not use offscreen view rendering. Missing captures remain explicit failures. The optional matrix is best effort within a 23-minute capture budget; rerun a scenario filter to collect more cases.
