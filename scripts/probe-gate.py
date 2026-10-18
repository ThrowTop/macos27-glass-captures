#!/usr/bin/env python3
import json
import pathlib
import sys

catalog = json.loads(pathlib.Path("probe-catalog.json").read_text())
sizes = catalog["sizes"]
expected = set()
for size in catalog["fontSizes"]:
    expected.add(f"font.systemFontSize.{size}")
for metric in catalog["globalFontMetrics"]:
    expected.add(f"font.{metric}")
for size in catalog["scrollerSizes"]:
    for style in catalog["scrollerStyles"]:
        expected.add(f"scroller.width.{size}.{style}")
for color in catalog["colors"]:
    expected.add(f"color.{color}")
base_fields = catalog["controlFields"]
for size in sizes:
    for kind, suffixes in catalog["controlKinds"].items():
        for suffix in suffixes:
            base = f"control.{kind}.{size}{suffix}"
            expected.update(f"{base}.{field}" for field in base_fields)
            if kind in ("popup", "pulldown"):
                expected.update(f"{base}.{field}" for field in catalog["popupFields"])
            if kind == "searchfield":
                for field in catalog["searchFields"]:
                    for width in catalog["searchWidths"]:
                        expected.add(f"{base}.{field}.w{width}")
            if kind == "slider":
                expected.update(f"{base}.{field}" for field in catalog["sliderFields"])
                for variant in catalog["sliderTickVariants"]:
                    for position in catalog["tickPositions"]:
                        tick = f"{base}.{variant}.{position}"
                        expected.update(f"{tick}.{field}" for field in catalog["sliderTickFields"])
                        expected.update(f"{tick}.rectOfTickMark.{i}" for i in catalog["tickIndexes"])
                for field in catalog["verticalSliderFields"]:
                    expected.add(f"control.slider.vertical.{size}.{field}")
                for variant in catalog["verticalSliderVariants"]:
                    for position in catalog["tickPositions"]:
                        tick = f"control.slider.vertical.{size}.{variant}.{position}"
                        expected.update(f"{tick}.{field}" for field in catalog["sliderTickFields"])
                        expected.update(f"{tick}.rectOfTickMark.{i}" for i in catalog["tickIndexes"])
                expected.update(f"control.slider.circular.{size}.{field}"
                                for field in catalog["circularSliderFields"])
            if kind == "segmented":
                expected.update(f"{base}.widthForSegment.{i}" for i in catalog["segmentIndexes"])
for name, fields in catalog["scrollers"].items():
    sid = f"scroller.{name}"
    expected.update(f"{sid}.{field}" for field in fields)
for name in catalog["menus"]:
    expected.update(f"menu.{name}.{field}" for field in catalog["menuFields"])
for style in catalog["windowStyles"]:
    expected.update(f"window.{style}.{field}" for field in catalog["windowFields"])
for style in catalog["tableStyles"]:
    for row_size in catalog["tableRowSizes"]:
        expected.update(f"table.{style}.{row_size}.{field}" for field in catalog["tableFields"])
expected.add(catalog["outlineProbe"])

passes = ["light", "dark", "light-contrast", "dark-contrast"]
missing = []
counts = []
for pass_name in passes:
    folder = pathlib.Path(sys.argv[1]) / pass_name
    probe_path, env_path = folder / "probes.json", folder / "env.json"
    if not probe_path.is_file() or not env_path.is_file():
        missing.append(f"{pass_name}: missing probes.json or env.json")
        continue
    try:
        probes = json.loads(probe_path.read_text())
        env = json.loads(env_path.read_text())
    except Exception as exc:
        missing.append(f"{pass_name}: invalid JSON: {exc}")
        continue
    for key in sorted(expected - probes.keys()):
        missing.append(f"{pass_name}: missing {key}")
    for key in sorted(probes.keys() - expected):
        missing.append(f"{pass_name}: uncatalogued {key}")
    for key, record in probes.items():
        if not isinstance(record, dict) or "value" not in record or "error" not in record:
            missing.append(f"{pass_name}: malformed record {key}")
        elif record["value"] is None and not isinstance(record["error"], str):
            missing.append(f"{pass_name}: null without explicit error {key}")
    for field in ("osBuild", "effectiveAppearance", "increaseContrast", "accent", "backingScale"):
        if field not in env:
            missing.append(f"{pass_name}: env missing {field}")
    errs = sum(1 for v in probes.values() if v.get("error") is not None)
    counts.append(f"{pass_name}: {len(probes)} probes, {errs} errors")

if missing:
    print("FAIL")
    print("\n".join(missing))
else:
    print("PASS")
    print("\n".join(counts))
