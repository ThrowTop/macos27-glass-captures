# Wallpaper and sidebar edge probe

This standalone `workflow_dispatch` probe collects controlled AppKit sidebar and inspector captures on the macOS 27 hosted runner. It does not modify the maintained capture harness. Run it only when a manual capture is wanted; one newly launched app process is used for each case.

## Exact case matrix

| Appearance | Desktop stimulus | Tint argument | Aware argument | Cases |
| --- | --- | --- | --- | ---: |
| Light, dark | Black, white | `off` | `native`, `off` | 8 |
| Light, dark | Red, blue | `on`, `off` | `native` | 8 |

`--tint=off` sets the process-scoped `AppleReduceDesktopTinting` default to `true`; `--tint=on` sets it to `false`. `--aware=native` leaves native backdrop state alone. `--aware=off` attempts to set `windowServerAware` false only on already-generated, nonzero sidebar/inspector backdrop layers near 180 by 400 points. It never creates a backdrop. Missing expected layers or other capture problems are recorded as incomplete/failed.

## Files

The workflow uploads `out/wallpaper-edges/` even when a case or build fails. The root contains runner environment, TCC helper output, case exit summary, and a build log only when compilation fails. Each case directory contains its environment and process log, the solid desktop stimulus PNG, `desktop-before-window.png`, `full-display.png`, `window-and-margin.png`, and `metadata.json` when capture reaches those steps. Metadata records screen/window geometry and scale, tint and aware configuration and observed values, generated backdrop properties and native view/layer counts, crop geometry, and every on-screen window intersecting the probe window with owner, name, and rectangle. A failure before metadata is written receives a workflow-generated failure JSON.

The displayed window has a 400 point height, 180 point sidebar and inspector targets, a 300 point body target, transparent side content, and neutral sRGB 0.75 main/window backgrounds. The desktop PNGs are flat sRGB black, white, red, or blue. These are deliberate stimuli. The crop requests 64 points beyond each window edge and is clipped to the display bounds.

## Reading captures and limits

Treat a capture as unobstructed only when metadata reports complete on-screen window enumeration, its obstruction assessment reports no intersecting window above the probe, and the full-display image agrees. Enumeration retains intersecting windows below the probe too, including the desktop; the `aboveProbe` field uses the front-to-back CGWindow list order. Review `desktop-before-window.png` too; consent dialogs or other runner windows can obscure a case. A nonzero process exit, `status: incomplete`, missing expected backdrop, or absent output image is an explicit case limitation, not a native result.

This is a static probe on a macOS 27 hosted runner and is expected to use a 1x display; the recorded scale is authoritative. Settling waits provide no animation timing evidence. The newly written Swift source has not been compiled or run locally as part of preparation. Captures alone make no native behavior or implementation conclusions; interpretation belongs to the MacUIKit owner and requires review of the recorded evidence.
