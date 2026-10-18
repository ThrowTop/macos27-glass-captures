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
mkdir -p "$APP/Contents/Resources"
cp "$ROOT/Resources/photo.png" "$APP/Contents/Resources/photo.png"

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
defaults write com.apple.universalaccess differentiateWithoutColor -bool false
defaults write -g AppleReduceDesktopTinting -bool true
# Keep the Dock bar off screen and dismiss the stale screen-recording prompt (access is granted
# through TCC above); both otherwise overlap capture windows.
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 1000
killall Dock 2>/dev/null || true
killall UserNotificationCenter 2>/dev/null || true
sleep 3
defaults delete -g AppleAccentColor >/dev/null 2>&1 || true
defaults delete -g AppleHighlightColor >/dev/null 2>&1 || true
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
  defaults read com.apple.universalaccess differentiateWithoutColor 2>&1 || true
  defaults read -g AppleReduceDesktopTinting 2>&1 || true
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
  local accessibility="${8:-default}"
  printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
    "$scenario" "$appearance" "$background" "$size" "$state" "$interaction" "$accent" "$accessibility" >> out/cases.tsv
}

: > out/cases.tsv

# Completion gate first: regular on switches in both appearances and both backgrounds.
for appearance in light dark; do
  for background in plain grid; do
    run_case nsswitch "$appearance" "$background" regular on hold default
  done
done

if [[ "$FILTER" != smoke ]]; then
  if [[ "$FILTER" == accent-smoke ]]; then
    for accent in green graphite; do
      for state in off on; do
        run_case nsswitch light grid regular "$state" hold "$accent"
      done
    done
  fi
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

# Recipe matrix is dispatched by style (or the small "core" gate) to keep a
# hosted run below the workflow time limit. A style filter captures every size,
# shape and background for that recipe; repeated workflows cover all styles.
for style in regular clear identity blue red50 interactive; do
  scenario="swiftui-glass-$style"
  if [[ "$FILTER" == "$scenario" || "$FILTER" == core ]]; then
    for appearance in light dark; do
      for background in plain black white grid hstripes vstripes rainbow checker8 photo; do
        for size in h20 h28 h36 h44 h64 h96 h128 rounded circle container-merged container-separate; do
          if [[ "$FILTER" == core && \
                ( "$style" != regular && "$style" != clear || \
                  "$background" != grid && "$background" != photo || \
                  "$size" != h20 && "$size" != h44 && "$size" != h128 ) ]]; then continue; fi
          run_case "$scenario" "$appearance" "$background" "$size" on idle default
          if [[ "$style" == interactive && "$size" == h44 ]]; then
            run_case "$scenario" "$appearance" "$background" "$size" on hold default
          fi
        done
      done
    done
  fi
done

# Native stage isolation: idle capture plus layer/filter ablations (see nativeAblations).
if [[ "$FILTER" == ablate ]]; then
  for style in regular clear; do
    for appearance in light dark; do
      for background in grid photo; do
        for size in h20 h44; do
          run_case "swiftui-glass-$style" "$appearance" "$background" "$size" on idle default
        done
      done
    done
  done
fi

if [[ "$FILTER" == nsglass-matrix || "$FILTER" == core ]]; then
  for scenario in nsglass-regular nsglass-clear nsglass-blue; do
    for appearance in light dark; do
      for background in plain black white grid hstripes vstripes rainbow checker8 photo; do
        for size in regular-r0 regular-r12 regular-r22 large-r0 large-r12 large-r60; do
          if [[ "$FILTER" == core && ( "$background" != grid && "$background" != photo || \
                "$size" != regular-r22 || "$scenario" == nsglass-blue ) ]]; then continue; fi
          run_case "$scenario" "$appearance" "$background" "$size" on idle default
        done
      done
    done
  done
fi

if [[ "$FILTER" == glass-buttons || "$FILTER" == core ]]; then
  for scenario in nsbutton-glass swiftui-button-glass swiftui-button-prominent; do
    for appearance in light dark; do
      for background in plain grid rainbow photo; do
        for size in regular large; do
          if [[ "$FILTER" == core && ( "$scenario" != swiftui-button-prominent || \
                "$appearance" != light || "$background" != grid || "$size" != regular ) ]]; then continue; fi
          run_case "$scenario" "$appearance" "$background" "$size" on hold default
        done
      done
    done
  done
fi

if [[ "$FILTER" == structural-glass || "$FILTER" == core ]]; then
  for scenario in toolbar-window sidebar-window popover menu; do
    for appearance in light dark; do
      for background in grid photo; do
        if [[ "$FILTER" == core && ( "$scenario" != toolbar-window || \
              "$appearance" != light || "$background" != grid ) ]]; then continue; fi
        run_case "$scenario" "$appearance" "$background" regular on idle default
      done
    done
  done
fi

# Control references for MacUIKit's non-glass controls: pop-up and pull-down buttons (static and
# held with the menu open), the context menu, the linear progress bar, checkboxes and radios.
if [[ "$FILTER" == controls-extra ]]; then
  for appearance in light dark; do
    for scenario in popup pulldown; do
      for size in mini small regular large; do
        run_case "$scenario" "$appearance" plain "$size" off idle default
      done
      run_case "$scenario" "$appearance" plain regular off hold default
    done
    run_case menu "$appearance" plain regular on idle default
    run_case menu "$appearance" grid regular on idle default
    for size in small regular large; do
      run_case progress "$appearance" plain "$size" on idle default
    done
    for state in off on mixed; do
      run_case checkbox "$appearance" plain regular "$state" hold default
    done
    for state in off on; do
      run_case radio "$appearance" plain regular "$state" hold default
    done
  done
fi

if [[ "$FILTER" == regular-accessibility ]]; then
  for accessibility in contrast transparency; do
    for appearance in light dark; do
      for background in grid photo; do
        run_case swiftui-glass-regular "$appearance" "$background" h44 on idle default "$accessibility"
      done
    done
  done
  for appearance in light dark; do
    for background in grid photo; do
      run_case swiftui-glass-regular-inactive "$appearance" "$background" h44 on idle default
    done
  done
fi

for batch_key in default-default green-default graphite-default default-contrast default-transparency; do
  accent="${batch_key%-*}"
  accessibility="${batch_key#*-}"
  python3 - "$accent" "$accessibility" "$ROOT/out" "$FILTER" <<'PY' > "out/batch-$batch_key.json"
import csv, json, sys
accent, accessibility, out, filter_name = sys.argv[1:]
keys = ['scenario', 'appearance', 'background', 'size', 'state', 'interaction', 'accent', 'accessibility']
with open('out/cases.tsv', newline='') as f:
    cases = [dict(zip(keys, row), out=out) for row in csv.reader(f, delimiter='\t')
             if row[6] == accent and row[7] == accessibility]
if filter_name == 'ablate':
    for case in cases:
        case['ablate'] = '1'
if accent != 'default' and cases:
    # A fresh accent process can show a WindowServer consent overlay during its
    # first window. Keep that real attempt in the artifact, then capture the
    # scheduled cases after the app has settled.
    warmup = dict(cases[0])
    warmup['out'] = out + '/warmup-' + accent
    cases.insert(0, warmup)
json.dump(cases, sys.stdout)
PY
  count="$(python3 -c 'import json,sys; print(len(json.load(open(sys.argv[1]))))' "out/batch-$batch_key.json")"
  if [[ "$count" == 0 ]]; then continue; fi
  case "$accent" in
    default) defaults delete -g AppleAccentColor >/dev/null 2>&1 || true; defaults delete -g AppleHighlightColor >/dev/null 2>&1 || true ;;
    green) defaults write -g AppleAccentColor -int 3 ;;
    graphite) defaults write -g AppleAccentColor -int -1 ;;
  esac
  defaults write com.apple.universalaccess increaseContrast -bool false
  defaults write com.apple.universalaccess reduceTransparency -bool false
  case "$accessibility" in
    contrast) defaults write com.apple.universalaccess increaseContrast -bool true ;;
    transparency) defaults write com.apple.universalaccess reduceTransparency -bool true ;;
  esac
  killall cfprefsd >/dev/null 2>&1 || true
  echo "BATCH accent=$accent accessibility=$accessibility cases=$count accent_value=$(defaults read -g AppleAccentColor 2>&1 || true)" >> out/log.txt
  sleep 2
  if ! perl -e 'alarm shift; exec @ARGV' 1450 /usr/bin/open -W -n -a "$APP" --args \
      --batch "$ROOT/out/batch-$batch_key.json" --out "$ROOT/out" >> out/log.txt 2>&1; then
    FAILURES=$((FAILURES + 1))
    echo "BATCH FAILED accent=$accent accessibility=$accessibility" >> out/log.txt
  fi
done

# Runtime AppKit probes are separate from image scenarios. Keep the four required
# NSSwitch captures above first for every filter, including probes.
if [[ "$FILTER" == all || "$FILTER" == probes || ",$FILTER," == *,probes,* ]]; then
  mkdir -p out/probes
  defaults write -g AppleShowScrollBars -string WhenScrolling
  killall cfprefsd >/dev/null 2>&1 || true
  echo "probe scroller preference=$(defaults read -g AppleShowScrollBars 2>&1 || true)" >> out/log.txt
  for pass in light dark light-contrast dark-contrast; do
    appearance="${pass%%-*}"
    contrast=false
    [[ "$pass" == *-contrast ]] && contrast=true
    defaults write com.apple.universalaccess increaseContrast -bool "$contrast"
    killall cfprefsd >/dev/null 2>&1 || true
    pass_dir="$ROOT/out/probes/$pass"
    mkdir -p "$pass_dir"
    echo "PROBE PASS name=$pass appearance=$appearance increaseContrast=$contrast" >> out/log.txt
    if ! perl -e 'alarm shift; exec @ARGV' 1450 /usr/bin/open -W -n -a "$APP" --args \
        --out "$ROOT/out" --probe-mode --probe-appearance "$appearance" --probe-out "$pass_dir" >> out/log.txt 2>&1; then
      echo "PROBE PASS FAILED name=$pass" >> out/log.txt
      FAILURES=$((FAILURES + 1))
    fi
    if [[ ! -s "$pass_dir/probes.json" || ! -s "$pass_dir/env.json" ]]; then
      echo "PROBE PASS MISSING OUTPUT name=$pass" >> out/log.txt
      FAILURES=$((FAILURES + 1))
    fi
  done
  defaults write com.apple.universalaccess increaseContrast -bool false
  killall cfprefsd >/dev/null 2>&1 || true
  defaults delete -g AppleShowScrollBars >/dev/null 2>&1 || true
  killall cfprefsd >/dev/null 2>&1 || true
  python3 scripts/probe-gate.py out/probes > out/probes-gate.txt
fi

mkdir -p out/crashes
for crash_dir in "$HOME/Library/Logs/DiagnosticReports" /Library/Logs/DiagnosticReports; do
  if [[ -d "$crash_dir" ]]; then
    find "$crash_dir" -maxdepth 1 -type f -name 'GlassCaptures*' \
      -exec cp {} out/crashes/ \;
  fi
done

python3 - "$FILTER" <<'PY'
import csv, glob, json, os, sys
filter_name = sys.argv[1]
parts = []
for path in glob.glob('out/**/manifest-part.json', recursive=True):
    if '/warmup-' in path:
        continue
    with open(path) as f:
        parts.extend(json.load(f))
keys = ['scenario', 'appearance', 'background', 'size', 'state', 'interaction', 'accent', 'accessibility']
with open('out/cases.tsv', newline='') as f:
    scheduled = [dict(zip(keys, row)) for row in csv.reader(f, delimiter='\t')]
incomplete = []
for case in scheduled:
    matching = [e for e in parts if all(e.get('accessibility_axis' if key == 'accessibility' else key, 'default') == case[key] for key in keys)]
    expected = {'idle'} if case['interaction'] == 'idle' else {
        'idle', 'held-0100ms', 'held-0250ms', 'held-1000ms',
        'released-0050ms', 'released-0100ms', 'released-0200ms',
        'released-0350ms', 'released-0600ms',
        'drag-held-0500ms' if case['interaction'] == 'drag' else 'held-0500ms'
    }
    got = {e['phase'] for e in matching if e.get('success') and not e.get('obstructed')
           and e.get('background_image') and os.path.isfile(e['background_image'])
           and (e.get('phase') not in ('idle', 'held-0500ms', 'drag-held-0500ms')
                or e.get('layers') and os.path.isfile(e['layers']))}
    missing_phases = sorted(expected - got)
    if missing_phases:
        label = '/'.join(case[key] for key in keys)
        incomplete.append(f'{label}: missing {missing_phases}')
        parts.append({**case, 'phase': 'incomplete', 'success': False,
                      'missing_phases': missing_phases,
                      'error': 'scheduled case did not finish'})
with open('out/incomplete.txt', 'w') as f:
    f.write('\n'.join(incomplete) + ('\n' if incomplete else ''))
quality_warnings = []
for case in scheduled:
    if case['interaction'] == 'idle':
        continue
    matching = [e for e in parts if all(e.get('accessibility_axis' if key == 'accessibility' else key, 'default') == case[key] for key in keys)]
    idle = next((e for e in matching if e.get('phase') == 'idle'), None)
    if idle is not None and idle.get('held_differs_from_idle') is False:
        label = '/'.join(case[key] for key in keys)
        quality_warnings.append(f'{label}: held crop matches idle')
        parts.append({**case, 'phase': 'quality-warning', 'success': False,
                      'error': 'held crop matches idle'})
with open('out/quality-warnings.txt', 'w') as f:
    f.write('\n'.join(quality_warnings) + ('\n' if quality_warnings else ''))
with open('out/manifest.json', 'w') as f:
    json.dump(parts, f, indent=2, sort_keys=True)
required = {(a, b) for a in ('light', 'dark') for b in ('plain', 'grid')}
phases = {'idle', 'held-0100ms', 'held-0250ms', 'held-0500ms', 'held-1000ms'}
missing = []
for appearance, background in required:
    entries = [e for e in parts if e['scenario'] == 'nsswitch' and e['size'] == 'regular'
               and e['state'] == 'on' and e['appearance'] == appearance
               and e['background'] == background and e['accent'] == 'default'
               and e['phase'] in phases and e['success'] and not e.get('obstructed')
               and e.get('background_image') and os.path.isfile(e['background_image'])
               and e.get('window_is_key')
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
recipe_missing = []
if filter_name == 'core':
    required_recipes = []
    for style in ('regular', 'clear'):
        for appearance in ('light', 'dark'):
            for background in ('grid', 'photo'):
                for size in ('h20', 'h44', 'h128'):
                    required_recipes.append((f'swiftui-glass-{style}', appearance, background, size))
    required_recipes += [('nsglass-regular', 'light', 'grid', 'regular-r22'),
                         ('nsglass-clear', 'light', 'grid', 'regular-r22'),
                         ('toolbar-window', 'light', 'grid', 'regular'),
                         ('swiftui-button-prominent', 'light', 'grid', 'regular')]
    for scenario, appearance, background, size in required_recipes:
        found = [e for e in parts if e.get('scenario') == scenario and
                 e.get('appearance') == appearance and e.get('background') == background and
                 e.get('size') == size and e.get('phase') == 'idle' and e.get('success') and
                 e.get('window_is_key') and not e.get('obstructed') and
                 e.get('background_image') and os.path.isfile(e['background_image']) and
                 e.get('layers') and os.path.isfile(e['layers'])]
        if not found:
            recipe_missing.append(f'{scenario}/{appearance}/{background}/{size}: incomplete')
with open('out/recipe-gate.txt', 'w') as f:
    f.write('PASS\n' if not recipe_missing else 'FAIL\n' + '\n'.join(recipe_missing) + '\n')
print(open('out/gate.txt').read())
if filter_name == 'core': print('recipe ' + open('out/recipe-gate.txt').read())
print(f'scheduled cases: {len(scheduled)}; incomplete cases: {len(incomplete)}')
print(f'held-crop quality warnings: {len(quality_warnings)}')
PY

if [[ -s out/incomplete.txt ]]; then
  log show --last 10m --style compact \
    --predicate 'process == "GlassCaptures" OR process == "ReportCrash" OR eventMessage CONTAINS[c] "GlassCaptures"' \
    2>&1 | tail -n 500 > out/system-log.txt || true
fi

echo "case failures: $FAILURES" >> out/env.txt
echo "capture finished: $(date -u +%FT%TZ)" >> out/env.txt
if grep -q '^PASS' out/gate.txt && grep -q '^PASS' out/recipe-gate.txt; then
  if [[ "$FILTER" == probes || ",$FILTER," == *,probes,* ]]; then
    grep -q '^PASS' out/probes-gate.txt && exit 0
    exit 1
  fi
  exit 0
fi
exit 1
