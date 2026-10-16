#!/bin/bash
set -u
set -o pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT" || exit 1
mkdir -p out
: > out/log.txt
FILTER="${1:-all}"
START=$SECONDS
MAX_SECONDS=1380
EXE="$ROOT/.build/release/GlassCaptures"
FAILURES=0

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
  echo 'No TCC database grant attempted initially; failures are retained in log and manifest.'
} > out/env.txt

"$EXE" --env-out "$ROOT/out/display.json" >> out/log.txt 2>&1 || true
cat out/display.json >> out/env.txt 2>/dev/null || true

contains_filter() {
  [[ "$FILTER" == all || "$FILTER" == smoke || ",$FILTER," == *",$1,"* ]]
}

run_case() {
  local scenario="$1" appearance="$2" background="$3" size="$4" state="$5" interaction="$6" accent="$7"
  if (( SECONDS - START >= MAX_SECONDS )); then
    echo "time budget reached; skipped $*" >> out/log.txt
    return 0
  fi
  case "$accent" in
    default) defaults delete -g AppleAccentColor >/dev/null 2>&1 || true ;;
    green) defaults write -g AppleAccentColor -int 3 ;;
    graphite) defaults write -g AppleAccentColor -int -1 ;;
  esac
  echo "CASE $* accent_value=$(defaults read -g AppleAccentColor 2>&1 || true)" >> out/log.txt
  if ! perl -e 'alarm shift; exec @ARGV' 65 "$EXE" \
      --scenario "$scenario" --appearance "$appearance" --background "$background" \
      --size "$size" --state "$state" --interaction "$interaction" --accent "$accent" \
      --out "$ROOT/out" >> out/log.txt 2>&1; then
    FAILURES=$((FAILURES + 1))
    echo "CASE FAILED $*" >> out/log.txt
  fi
}

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

python3 - <<'PY'
import glob, json, os
parts = []
for path in glob.glob('out/**/manifest-part.json', recursive=True):
    with open(path) as f:
        parts.extend(json.load(f))
with open('out/manifest.json', 'w') as f:
    json.dump(parts, f, indent=2, sort_keys=True)
required = {(a, b) for a in ('light', 'dark') for b in ('plain', 'grid')}
phases = {'idle', 'held-0100ms', 'held-0250ms', 'held-0500ms', 'held-1000ms'}
missing = []
for appearance, background in required:
    entries = [e for e in parts if e['scenario'] == 'nsswitch' and e['size'] == 'regular'
               and e['state'] == 'on' and e['appearance'] == appearance
               and e['background'] == background and e['accent'] == 'default'
               and e['phase'] in phases and e['success']]
    got = {e['phase'] for e in entries}
    if got != phases:
        missing.append(f'{appearance}/{background}: missing {sorted(phases - got)}')
    layer = f'out/nsswitch/{appearance}-default-regular-on-hold/{background}/layers-held-0500ms.json'
    if not os.path.isfile(layer):
        missing.append(f'{appearance}/{background}: missing held layer dump')
with open('out/gate.txt', 'w') as f:
    f.write('PASS\n' if not missing else 'FAIL\n' + '\n'.join(missing) + '\n')
print(open('out/gate.txt').read())
PY

echo "case failures: $FAILURES" >> out/env.txt
echo "capture finished: $(date -u +%FT%TZ)" >> out/env.txt
if grep -q '^PASS' out/gate.txt; then exit 0; else exit 1; fi
