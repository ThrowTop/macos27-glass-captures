#!/usr/bin/env python3
"""Measure RGB/luminance around captured menu and window frames."""
import json
import sys
from pathlib import Path

from PIL import Image


def lum(rgb):
    r, g, b = rgb[:3]
    return .2126 * r + .7152 * g + .0722 * b


def rgb_text(rgb):
    return "(" + ",".join(str(int(x)) for x in rgb[:3]) + ")"


def profile_metrics(values):
    outside = values[:8]  # distances -8 through -1
    reference = lum(outside[0])
    outside_delta = [abs(lum(v) - reference) for v in outside]
    alpha_reach = max((8 - i for i, v in enumerate(outside) if v[3] >= 8), default=0)
    rim_lift = sum(lum(v) for v in values[8:12]) / 4 - sum(lum(v) for v in values[13:17]) / 4
    return {
        "outside_count": sum(delta >= 6 for delta in outside_delta),
        "outside_max_delta": max(outside_delta, default=0),
        "edge_rgb": values[7],
        "edge_luma": lum(values[7]),
        "alpha_reach": alpha_reach,
        "edge_alpha": values[7][3],
        "rim_lift": rim_lift,
    }


def image_map(info, case, image, case_path):
    if isinstance(info.get("shapePixels"), dict):
        r = info["shapePixels"]
        return (float(r["x"]), float(r["y"]), float(r["width"]), float(r["height"]))
    frame = info.get("shapeFrame") or case.get("windowFrame") or case.get("shapeFrame") or {}
    if "cropScreenRect" in info:
        crop = info["cropScreenRect"]
        scale = float(info.get("scale", info.get("pixelScale", case.get("pixelScale", 1))))
        x = (frame["x"] - crop["x"]) * scale
        y = (crop["y"] + crop["height"] - frame["y"] - frame["height"]) * scale
        return x, y, frame["width"] * scale, frame["height"] * scale
    scale = float(info.get("pixelScale", case.get("pixelScale", 1)))
    width, height = frame["width"] * scale, frame["height"] * scale
    vertical_offset = 0.0
    runtime_name = info.get("runtime") or case.get("runtime")
    if runtime_name:
        try:
            runtime = json.loads((case_path.parent / runtime_name).read_text(encoding="utf-8"))
            parameters = runtime.get("shadowParameters", {})
            state = "Inactive" if info.get("windowState", case.get("windowState")) == "inactive" else "Active"
            vertical_offset = float(parameters.get(f"com.apple.WindowShadowVerticalOffset{state}", 0))
        except Exception:
            pass
    return ((image.width - width) / 2,
            (image.height - height) / 2 - vertical_offset * scale,
            width, height)


def inspect_capture(path, info, case, crop_root):
    if info.get("error"):
        return [f"Capture failed: `{info['error']}`"], [], None
    file_name = info.get("file")
    if not file_name:
        return ["Capture metadata has no image file."], [], None
    image_path = path.parent / file_name
    if not image_path.is_file():
        return [f"Image missing: `{image_path}`"], [], None
    im = Image.open(image_path).convert("RGBA")
    x, y, width, height = image_map(info, case, im, path)
    composite_only = im.getchannel("A").getextrema() == (255, 255)
    left, top = int(round(x)), int(round(y))
    right, bottom = int(round(x + width)), int(round(y + height))

    def pixel(px, py):
        px = max(0, min(im.width - 1, int(round(px))))
        py = max(0, min(im.height - 1, int(round(py))))
        return im.getpixel((px, py))

    lines = [f"Image `{file_name}`: {im.width}×{im.height}; shape box=({x:.2f},{y:.2f},{width:.2f},{height:.2f}) px."]
    profiles = {}
    metrics = {}
    for side in ("top", "right", "bottom", "left"):
        values = []
        for distance in range(-8, 9):
            if side == "top": c = pixel(x + width / 2, y + distance)
            elif side == "bottom": c = pixel(x + width / 2, y + height - 1 - distance)
            elif side == "left": c = pixel(x + distance, y + height / 2)
            else: c = pixel(x + width - 1 - distance, y + height / 2)
            values.append(c)
        profiles[side] = values
        metric = profile_metrics(values)
        metrics[side] = metric
        affected = [i - 8 for i, delta in enumerate(
            [abs(lum(v) - lum(values[0])) for v in values[:8]]) if delta >= 6]
        rim_values = [lum(v) for v in values[8:12]]
        interior_values = [lum(v) for v in values[13:17]]
        rim_lift = metric["rim_lift"]
        alpha_summary = ("composited" if composite_only else
                         f"α≥8 reaches {metric['alpha_reach']} px; α at −1={metric['edge_alpha']}")
        lines.append(f"- {side}: RGB distances −8..+8: `{' '.join(rgb_text(v) for v in values)}`; "
                     f"luma: `{','.join(f'{lum(v):.1f}' for v in values)}`; "
                     f"alpha: `{','.join(str(v[3]) for v in values)}`; "
                     f"outside pixels differing ≥6 luma from the −8 px backdrop sample: {len(affected)}/8 "
                     f"({affected or 'none'} px; max ΔY={metric['outside_max_delta']:.1f}); "
                     f"edge at −1 RGB={rgb_text(metric['edge_rgb'])}, Y={metric['edge_luma']:.1f}; "
                     f"{alpha_summary}; inner 0–3 px mean lift over 5–8 px={rim_lift:+.1f} Y.")

    crop_root.mkdir(parents=True, exist_ok=True)
    case_slug = "-".join(part for part in path.parent.parts[-4:] if part not in ("", "."))
    for side, values in profiles.items():
        strip = Image.new("RGBA", (17, 1))
        strip.putdata(values)
        enlarged = strip.resize((17 * 8, 8), Image.Resampling.NEAREST)
        enlarged.save(crop_root / f"{case_slug}-{file_name[:-4]}-{side}-8x.png")

    corner_notes = []
    for label, ox, oy, sx, sy in (
        ("top-left", left, top, 1, 1),
        ("bottom-right", right - 8, bottom - 8, 1, 1),
    ):
        matrix = []
        for row in range(8):
            matrix.append(" ".join(rgb_text(pixel(ox + sx * col, oy + sy * row)) for col in range(8)))
        corner_notes.append(f"**{label} 8×8 RGB:**\n\n```text\n" + "\n".join(matrix) + "\n```")
    lines.extend(corner_notes)
    rim_sides = [side for side, metric in metrics.items() if metric["rim_lift"] >= 5]
    if composite_only:
        outside_note = ", ".join(
            f"{side} {metrics[side]['outside_count']}/8 (max ΔY {metrics[side]['outside_max_delta']:.1f})"
            for side in metrics
        )
    else:
        outside_note = ", ".join(
            f"{side} {metrics[side]['alpha_reach']} px, α−1 {metrics[side]['edge_alpha']}"
            for side in metrics
        )
    evidence = {
        "file": file_name,
        "method": info.get("method", "unknown"),
        "window": info.get("window", "normal"),
        "composite": composite_only,
        "outside": outside_note,
        "rim_sides": rim_sides,
        "rim_values": {side: round(m["rim_lift"], 1) for side, m in metrics.items()},
        "metrics": metrics,
    }
    return lines, [str(crop_root / f"{case_slug}-{file_name[:-4]}-{side}-8x.png") for side in profiles], evidence


def captures(case):
    if isinstance(case.get("captures"), list):
        return [(item.get("window", "shape"), item.get("method", "unknown"), item)
                for item in case["captures"]]
    return [("normal", method, case.get(key, {})) for key, method in (
        ("display", "display"), ("singleWindow", "single-window"), ("cgWindow", "cgwindow"))]


def main(root):
    root = Path(root)
    parts = ["# Menu and window outline measurements", "",
             "Profiles sample 8 pixels outside through 8 pixels inside each captured frame. Luminance uses Rec. 709 weights.",
             "The nearest-neighbour crops enlarge each 17-pixel side profile by 8×; corner blocks list the first 8×8 pixels at the top-left and bottom-right of the frame.", ""]
    crop_root = root / "menu-outline-edge-crops"
    crop_paths = []
    findings = []
    cases = sorted(root.rglob("case.json"))
    for path in cases:
        try:
            case = json.loads(path.read_text(encoding="utf-8"))
        except Exception as error:
            parts.extend([f"## {path.parent.relative_to(root)}", "", f"Could not read case metadata: {error}", ""])
            continue
        rel = path.parent.relative_to(root)
        parts.extend([f"## {rel}", "", f"Case: {case.get('source', case.get('shape', case.get('stage', 'unknown')))}; "
                      f"appearance={case.get('appearance', 'unknown')}; background={case.get('background', case.get('backdrop', 'unknown'))}; "
                      f"opened={case.get('opened', 'n/a')}.", ""])
        if case.get("openError"):
            parts.append(f"Menu-open result: `{case['openError']}`; attempts={case.get('attempts', [])}.")
            parts.append("")
        if case.get("menuWindows"):
            parts.append(f"Visible captured menu windows: {len(case['menuWindows'])}.")
            parts.append("")
        runtime_names = set()
        if case.get("runtime"):
            runtime_names.add(case["runtime"])
        if case.get("hostRuntime") and isinstance(case["hostRuntime"], str):
            runtime_names.add(case["hostRuntime"])
        for _, _, info in captures(case):
            if info.get("runtime"):
                runtime_names.add(info["runtime"])
        if runtime_names:
            parts.append("Runtime dumps: " + ", ".join(f"`{name}`" for name in sorted(runtime_names)) + ".")
            parts.append("")
        for window_name, method, info in captures(case):
            parts.extend([f"### {window_name} — {method}", ""])
            info = dict(info)
            info.setdefault("method", method)
            info.setdefault("window", window_name)
            lines, images, evidence = inspect_capture(path, info, case, crop_root)
            parts.extend(lines)
            crop_paths.extend(images)
            if evidence:
                evidence.update({"case": str(rel), "appearance": case.get("appearance", "unknown"),
                                 "background": case.get("background", case.get("backdrop", "unknown")),
                                 "source": case.get("source", case.get("shape", case.get("stage", "unknown")))})
                findings.append(evidence)
            parts.append("")
    if not cases:
        parts.extend(["No `case.json` files found.", ""])
    findings_block = ["## Numerical findings", "",
        "Display composites compare each exterior sample with the sample 8 px out; a ≥6 Y difference marks a changed pixel. "
        "Single-window and CG images report the transparent shadow extent where alpha is at least 8. "
        "Inner lift compares the mean of distances 0–3 with distances 5–8; sides at +5 Y or more are flagged as a light rim.", "",
        "| Case / appearance / backdrop | Window, method | Exterior evidence by side | Light rim sides (mean ΔY) |",
        "|---|---|---|---|"]
    for item in findings:
        rim = ", ".join(f"{side} +{value:.1f}" for side, value in item["rim_values"].items()
                         if value >= 5) or "none ≥5"
        findings_block.append(
            f"| `{item['case']}` | {item['window']}, {item['method']} | {item['outside']} | {rim} |")
    menu_sources = [item for item in findings if item["source"] not in ("normal titled NSWindow", "window-contour")]
    if menu_sources:
        findings_block.extend(["", "### Menu source comparison", "",
            "Compare each source within the same appearance and backdrop. `display` gives exterior RGB change against the 8 px sample; "
            "single-window and CG entries give alpha reach. The raw side profiles below preserve exact RGB, luminance, and alpha values.", ""])
        for item in menu_sources:
            findings_block.append(f"- {item['source']} / {item['appearance']} / {item['background']} / "
                                  f"{item['method']}: outside {item['outside']}; inner rim "
                                  f"{', '.join(f'{s} +{v:.1f} Y' for s, v in item['rim_values'].items() if v >= 5) or 'none ≥5 Y'}.")
    step1 = [item for item in findings if "/step1/" in item["case"].replace("\\", "/")]
    if step1:
        step1_display = [item for item in step1 if item["method"] == "display"]
        step1_window = [item for item in step1 if item["method"] in ("single-window", "cgwindow")]
        any_window_shadow = any(metric["alpha_reach"] > 0
                                for item in step1_window for metric in item["metrics"].values())
        display_changed = sum(metric["outside_count"]
                              for item in step1_display for metric in item["metrics"].values())
        findings_block.extend(["", "## Step 1: runner window-server effects", "",
            "The display composites show whether the shadow survives in the desktop capture. "
            "The single-window and CG outputs retain alpha, so their exterior alpha values report the isolated window-server shadow.", ""])
        findings_block.append(
            f"Runner result: **{'yes' if any_window_shadow else 'no measurable alpha shadow'}** in isolated window captures; "
            f"display composites have {display_changed} exterior side samples with ≥6 Y change from their −8 px sample. "
            "Treat the near-edge color and alpha values below as raw contour data; they do not identify the private renderer's line type.")
        findings_block.append("")
        groups = {}
        for item in step1:
            key = (item["appearance"], item["background"])
            groups.setdefault(key, {})[item["method"]] = item
        for (appearance, background), methods in sorted(groups.items()):
            display = methods.get("display")
            display_changes = sum(m["outside_count"] for m in display["metrics"].values()) if display else None
            side_total = len(display["metrics"]) * 8 if display else 0
            window_shadows = []
            for method in ("single-window", "cgwindow"):
                item = methods.get(method)
                if item:
                    metric = item["metrics"]
                    reach = max((m["alpha_reach"] for m in metric.values()), default=0)
                    edge = ", ".join(f"{side} {m['edge_alpha']}" for side, m in metric.items())
                    window_shadows.append(f"{method}: α≥8 reaches {reach} px; α at −1 ({edge})")
            findings_block.append(
                f"- {appearance} / {background} backdrop: display changed samples ≥6 Y="
                f"{display_changes}/{side_total}; " + ("; ".join(window_shadows) or "no window-only capture"))
    parts = parts[:4] + findings_block + [""] + parts[4:]
    parts.extend(["## Crops", "", "Nearest-neighbour side profile PNGs enlarge each 17-pixel side by 8× and are under `menu-outline-edge-crops/`.", ""])
    for crop in sorted(set(crop_paths)):
        parts.append(f"- `{Path(crop).relative_to(root)}`")
    destination = root / "menu-outline-summary.md"
    destination.write_text("\n".join(parts) + "\n", encoding="utf-8")
    print(destination)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("usage: summarize-menu-outline.py RUN_DIR")
    main(sys.argv[1])
