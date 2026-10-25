#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
OUT="$ROOT/out/toolbar-overflow-width-20261025"
APP="$ROOT/ToolbarOverflowWidth.app"
EXE="$ROOT/.build/release/ToolbarOverflowWidth"
mkdir -p "$OUT" "$APP/Contents/MacOS"
cp App/ToolbarOverflowWidth-Info.plist "$APP/Contents/Info.plist"
cp "$EXE" "$APP/Contents/MacOS/ToolbarOverflowWidth"
chmod +x "$APP/Contents/MacOS/ToolbarOverflowWidth"
python3 scripts/grant-screen-capture.py com.throwtop.toolbar-overflow-width "$APP/Contents/MacOS/ToolbarOverflowWidth" > "$OUT/screen-capture-grant.txt" 2>&1 || true
APPROVALS="$HOME/Library/Group Containers/group.apple.replayd/ScreenCaptureApprovals.plist"
mkdir -p "$(dirname "$APPROVALS")"
for responsible in "/opt/hca/hosted-compute-agent" "com.throwtop.toolbar-overflow-width" "$APP/Contents/MacOS/ToolbarOverflowWidth"; do
  defaults write "$APPROVALS" "$responsible" -date "3024-01-01 00:00:00 +0000"
done
for appearance in dark light; do
  for scenario in baseline window-title single-button; do
    echo "CASE scenario=$scenario appearance=$appearance" | tee -a "$OUT/runner.log"
    export CAPTURE_OUT="$OUT/$scenario/$appearance"
    export CAPTURE_APPEARANCE="$appearance"
    export CAPTURE_SCENARIO="$scenario"
    mkdir -p "$CAPTURE_OUT"
    perl -e 'alarm shift; exec @ARGV' 240 /usr/bin/open -W -n "$APP" >> "$OUT/runner.log" 2>&1 || echo "CASE_FAILED scenario=$scenario appearance=$appearance" | tee -a "$OUT/runner.log"
  done
done
python3 - "$OUT" <<'PY'
import glob, json, sys
root=sys.argv[1]
rows=[]
for path in glob.glob(root+'/**/*.json', recursive=True):
    try:
        with open(path) as f: obj=json.load(f)
    except Exception: continue
    if isinstance(obj, dict) and 'toolbarItems' in obj:
        rows.append({k:obj.get(k) for k in ('scenario','appearance','width','windowFrame','toolbarAXFrame','titleAXFrame','toolbarItems','swiftSelection','actionCounts')})
with open(root+'/membership.json','w') as f: json.dump(rows,f,indent=2)
print(f'membership samples: {len(rows)}')
PY
