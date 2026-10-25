#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
APP="$ROOT/ToolbarPopupFeedback.app"
mkdir -p "$APP/Contents/MacOS" "$ROOT/out/toolbar-popup-feedback"
shasum -a 256 Sources/ToolbarPopupFeedback/main.swift > out/toolbar-popup-feedback/probe-source-sha256.txt
cp Resources/ToolbarPopupFeedback-Info.plist "$APP/Contents/Info.plist"
cp out/ToolbarPopupFeedback "$APP/Contents/MacOS/ToolbarPopupFeedback"
chmod +x "$APP/Contents/MacOS/ToolbarPopupFeedback"
open -W -n "$APP" --args --out="$ROOT/out/toolbar-popup-feedback"
dark="$ROOT/out/toolbar-popup-feedback/dark-events.txt"
for state in idle hover held released; do grep -Fq "SETTLED state=$state " "$dark" || { echo "dark state gate failed: $state"; exit 1; }; done
grep -Fq 'FINAL_GATE PASS ' "$dark" || { echo 'dark screenshot gate failed'; exit 1; }
grep -Fq 'MENU_TRACKING ' "$dark" || { echo 'dark native menu tracking was not recorded'; exit 1; }
open -W -n "$APP" --args --out="$ROOT/out/toolbar-popup-feedback" --light
light="$ROOT/out/toolbar-popup-feedback/light-events.txt"
for state in idle hover held released; do grep -Fq "SETTLED state=$state " "$light" || { echo "light state gate failed: $state"; exit 1; }; done
grep -Fq 'FINAL_GATE PASS ' "$light" || { echo 'light screenshot gate failed'; exit 1; }
grep -Fq 'MENU_TRACKING ' "$light" || { echo 'light native menu tracking was not recorded'; exit 1; }
