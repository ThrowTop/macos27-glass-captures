#!/bin/bash
set -u
set -o pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT" || exit 1
mkdir -p out
: > out/log.txt
FILTER="${1:-all}"
EXE="$ROOT/.build/release/GlassCaptures"
APP="$ROOT/GlassCaptures.app"
FAILURES=0

mkdir -p "$APP/Contents/MacOS"
cp "$ROOT/App/Info.plist" "$APP/Contents/Info.plist"
cp "$EXE" "$APP/Contents/MacOS/GlassCaptures"
chmod +x "$APP/Contents/MacOS/GlassCaptures"

# Hosted images currently boot with these accessibility options enabled. Capture
# the normal animated/translucent appearance, and record both original and set values.
{
  echo "original reduceTransparency=$(defaults read com.apple.universalaccess reduceTransparency 2>&1 || true)"
  echo "original reduceMotion=$(defaults read com.apple.universalaccess reduceMotion 2>&1 || true)"
  echo "original increaseContrast=$(defaults read com.apple.universalaccess increaseContrast 2>&1 || true)"
} >> out/log.txt
defaults write com.apple.universalaccess reduceTransparency -bool false
defaults write com.apple.universalaccess reduceMotion -bool false
defaults write com.apple.universalaccess increaseContrast -bool false
killall cfprefsd >/dev/null 2>&1 || true

{
  echo "capture started: $(date -u +%FT%TZ)"
  echo "filter: $FILTER"
  echo '--- sw_vers ---'; sw_vers
  echo '--- uname ---'; uname -a
  echo '--- hw.model ---'; sysctl hw.model
  echo '--- display ---'; system_profiler SPDisplaysDataType
  echo '--- accessibility ---'
  defaults read com.apple.universalaccess reduceTransparency 2>&1 || true
  defaults read com.apple.universalaccess reduceMotion 2>&1 || true
  defaults read com.apple.universalaccess increaseContrast 2>&1 || true
  echo '--- accent ---'; defaults read -g AppleAccentColor 2>&1 || true
  echo '--- screen capture access ---'
  echo 'The app records CGPreflightScreenCaptureAccess in display.json and each app run.'
  echo 'TCC database grant attempt and outcome are recorded below.'
} > out/env.txt

python3 scripts/grant-screen-capture.py com.throwtop.glasscaptures "$APP/Contents/MacOS/GlassCaptures" >> out/env.txt 2>&1

"$EXE" --env-out "$ROOT/out/display.json" >> out/log.txt 2>&1 || true
cat out/display.json >> out/env.txt 2>/dev/null || true

contains_filter() {
  [[ "$FILTER" == all || "$FILTER" == smoke || ",$FILTER," == *",$1,"* ]]
}

run_case() {
  local scenario="$1" appearance="$2" background="$3" size="$4" state="$5" interaction="$6" accent="$7"
  printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
    "$scenario" "$appearance" "$background" "$size" "$state" "$interaction" "$accent" >> out/cases.tsv
}

: > out/cases.tsv

# Completion gate first: regular on switches in both appearances and both backgrounds.
for appearance in light dark; do
  for background in plain grid; do
    run_case nsswitch "$appearance" "$background" regular on hold default
  done
done

if [[ "$FILTER" != smoke ]]; then
  if contains_filter nsswitch; then
    for appearance in light dark; do
      for background in plain grid hstripes rainbow black white; do
        for size in mini small regular large; do
          for state in off on; do
            if [[ "$background" == plain || "$background" == grid || "$size" == regular ]]; then
              run_case nsswitch "$appearance" "$background" "$size" "$state" drag default
            fi
          done
        done
      done
      for accent in green graphite; do
        for state in off on; do
          run_case nsswitch "$appearance" grid regular "$state" hold "$accent"
        done
      done
    done
  fi
  for scenario in swiftui-toggle nsslider nssegmented nsbutton nsglass swiftui-glass-regular swiftui-glass-clear swiftui-glass-interactive; do
    if contains_filter "$scenario"; then
      for appearance in light dark; do
        for background in plain grid hstripes rainbow black white; do
          for size in regular large; do
            if [[ "$scenario" == nsbutton && "$size" == large ]]; then continue; fi
            if [[ "$scenario" == swiftui-toggle && "$size" == large ]]; then continue; fi
            if [[ "$background" != plain && "$background" != grid && \
                  "$scenario" != nsglass && "$scenario" != swiftui-glass-regular && \
                  "$scenario" != swiftui-glass-clear && "$scenario" != swiftui-glass-interactive ]]; then continue; fi
            interaction=hold
            if [[ "$scenario" == nsglass || "$scenario" == swiftui-glass-regular || "$scenario" == swiftui-glass-clear ]]; then interaction=idle; fi
            run_case "$scenario" "$appearance" "$background" "$size" on "$interaction" default
          done
        done
      done
    fi
  done
fi

for accent in default green graphite; do
  python3 - "$accent" "$ROOT/out" <<'PY' > "out/batch-$accent.json"
import csv, json, sys
accent, out = sys.argv[1:]
keys = ['scenario', 'appearance', 'background', 'size', 'state', 'interaction', 'accent']
with open('out/cases.tsv', newline='') as f:
    cases = [dict(zip(keys, row), out=out) for row in csv.reader(f, delimiter='\t') if row[-1] == accent]
json.dump(cases, sys.stdout)
PY
  count="$(python3 -c 'import json,sys; print(len(json.load(open(sys.argv[1]))))' "out/batch-$accent.json")"
  if [[ "$count" == 0 ]]; then continue; fi
  case "$accent" in
    default) defaults delete -g AppleAccentColor >/dev/null 2>&1 || true ;;
    green) defaults write -g AppleAccentColor -int 3 ;;
    graphite) defaults write -g AppleAccentColor -int -1 ;;
  esac
  echo "BATCH accent=$accent cases=$count accent_value=$(defaults read -g AppleAccentColor 2>&1 || true)" >> out/log.txt
  sleep 2
  if ! perl -e 'alarm shift; exec @ARGV' 1450 /usr/bin/open -W -n -a "$APP" --args \
      --batch "$ROOT/out/batch-$accent.json" --out "$ROOT/out" >> out/log.txt 2>&1; then
    FAILURES=$((FAILURES + 1))
    echo "BATCH FAILED accent=$accent" >> out/log.txt
  fi
done

mkdir -p out/crashes
for crash_dir in "$HOME/Library/Logs/DiagnosticReports" /Library/Logs/DiagnosticReports; do
  if [[ -d "$crash_dir" ]]; then
    find "$crash_dir" -maxdepth 1 -type f -name 'GlassCaptures*' \
      -exec cp {} out/crashes/ \;
  fi
done

python3 - <<'PY'
import csv, glob, json, os
parts = []
for path in glob.glob('out/**/manifest-part.json', recursive=True):
    with open(path) as f:
        parts.extend(json.load(f))
keys = ['scenario', 'appearance', 'background', 'size', 'state', 'interaction', 'accent']
with open('out/cases.tsv', newline='') as f:
    scheduled = [dict(zip(keys, row)) for row in csv.reader(f, delimiter='\t')]
incomplete = []
for case in scheduled:
    matching = [e for e in parts if all(e.get(key) == case[key] for key in keys)]
    expected = {'idle'} if case['interaction'] == 'idle' else {
        'idle', 'held-0100ms', 'held-0250ms', 'held-1000ms',
        'released-0050ms', 'released-0100ms', 'released-0200ms',
        'released-0350ms', 'released-0600ms',
        'drag-held-0500ms' if case['interaction'] == 'drag' else 'held-0500ms'
    }
    got = {e['phase'] for e in matching if e.get('success')}
    missing_phases = sorted(expected - got)
    if missing_phases:
        label = '/'.join(case[key] for key in keys)
        incomplete.append(f'{label}: missing {missing_phases}')
        parts.append({**case, 'phase': 'incomplete', 'success': False,
                      'missing_phases': missing_phases,
                      'error': 'scheduled case did not finish'})
with open('out/incomplete.txt', 'w') as f:
    f.write('\n'.join(incomplete) + ('\n' if incomplete else ''))
with open('out/manifest.json', 'w') as f:
    json.dump(parts, f, indent=2, sort_keys=True)
required = {(a, b) for a in ('light', 'dark') for b in ('plain', 'grid')}
phases = {'idle', 'held-0100ms', 'held-0250ms', 'held-0500ms', 'held-1000ms'}
missing = []
for appearance, background in required:
    entries = [e for e in parts if e['scenario'] == 'nsswitch' and e['size'] == 'regular'
               and e['state'] == 'on' and e['appearance'] == appearance
               and e['background'] == background and e['accent'] == 'default'
               and e['phase'] in phases and e['success'] and e.get('window_is_key')
               and e.get('control_frame_window_points', {}).get('width') == 54]
    got = {e['phase'] for e in entries}
    if got != phases:
        missing.append(f'{appearance}/{background}: missing {sorted(phases - got)}')
    if got == phases:
        stem = f'out/nsswitch/{appearance}-default-regular-on-hold/{background}/'
        import hashlib
        def digest(name):
            with open(stem + name, 'rb') as f:
                return hashlib.sha256(f.read()).digest()
        if digest('idle-crop.png') == digest('held-0500ms-crop.png'):
            missing.append(f'{appearance}/{background}: held switch pixels match idle')
    layer = f'out/nsswitch/{appearance}-default-regular-on-hold/{background}/layers-held-0500ms.json'
    if not os.path.isfile(layer):
        missing.append(f'{appearance}/{background}: missing held layer dump')
with open('out/gate.txt', 'w') as f:
    f.write('PASS\n' if not missing else 'FAIL\n' + '\n'.join(missing) + '\n')
print(open('out/gate.txt').read())
print(f'scheduled cases: {len(scheduled)}; incomplete cases: {len(incomplete)}')
PY

if [[ -s out/incomplete.txt ]]; then
  log show --last 10m --style compact \
    --predicate 'process == "GlassCaptures" OR process == "ReportCrash" OR eventMessage CONTAINS[c] "GlassCaptures"' \
    2>&1 | tail -n 500 > out/system-log.txt || true
fi

echo "case failures: $FAILURES" >> out/env.txt
echo "capture finished: $(date -u +%FT%TZ)" >> out/env.txt
if grep -q '^PASS' out/gate.txt; then exit 0; else exit 1; fi
