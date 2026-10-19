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


def image_map(info, case, image, case_path):
    if isinstance(info.get("shapePixels"), dict):
        r = info["shapePixels"]
        return (float(r["x"]), float(r["y"]), float(r["width"]), float(r["height"]))
    frame = case.get("windowFrame") or case.get("shapeFrame") or {}
    if "cropScreenRect" in info:
        crop = info["cropScreenRect"]
        scale = float(info.get("scale", case.get("pixelScale", 1)))
        x = (frame["x"] - crop["x"]) * scale
        y = (crop["y"] + crop["height"] - frame["y"] - frame["height"]) * scale
        return x, y, frame["width"] * scale, frame["height"] * scale
    scale = float(case.get("pixelScale", 1))
    width, height = frame["width"] * scale, frame["height"] * scale
    vertical_offset = 0.0
    runtime_name = case.get("runtime")
    if runtime_name:
        try:
            runtime = json.loads((case_path.parent / runtime_name).read_text(encoding="utf-8"))
            parameters = runtime.get("shadowParameters", {})
            state = "Inactive" if case.get("windowState") == "inactive" else "Active"
            vertical_offset = float(parameters.get(f"com.apple.WindowShadowVerticalOffset{state}", 0))
        except Exception:
            pass
    return ((image.width - width) / 2,
            (image.height - height) / 2 - vertical_offset * scale,
            width, height)


def inspect_capture(path, info, case, crop_root):
    if info.get("error"):
        return [f"Capture failed: `{info['error']}`"], []
    file_name = info.get("file")
    if not file_name:
        return ["Capture metadata has no image file."], []
    image_path = path.parent / file_name
    if not image_path.is_file():
        return [f"Image missing: `{image_path}`"], []
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
    for side in ("top", "right", "bottom", "left"):
        values = []
        for distance in range(-8, 9):
            if side == "top": c = pixel(x + width / 2, y + distance)
            elif side == "bottom": c = pixel(x + width / 2, y + height - 1 - distance)
            elif side == "left": c = pixel(x + distance, y + height / 2)
            else: c = pixel(x + width - 1 - distance, y + height / 2)
            values.append(c)
        profiles[side] = values
        base = [lum(v) for v in values[:4]]
        base_luma = sum(base) / len(base)
        deltas = [abs(lum(v) - base_luma) for v in values[:8]]
        affected = [i - 8 for i, delta in enumerate(deltas) if delta >= 6]
        inside = [lum(v) for v in values[12:17]]
        inside_luma = sum(inside) / len(inside)
        rim = [lum(v) - inside_luma for v in values[8:12]]
        shadow_alpha = [v[3] for v in values[:8]]
        alpha_extent = "opaque composite" if composite_only else max(
            (8 - i for i, alpha in enumerate(shadow_alpha) if alpha > 0), default=0)
        lines.append(f"- {side}: RGB distances −8..+8: `{' '.join(rgb_text(v) for v in values)}`; "
                     f"luma: `{','.join(f'{lum(v):.1f}' for v in values)}`; "
                     f"alpha: `{','.join(str(v[3]) for v in values)}`; "
                     f"outside deviations ≥6 from outer baseline at {affected or 'none'} px; "
                     f"outside nonzero-alpha reach={alpha_extent if isinstance(alpha_extent,str) else str(alpha_extent)+' px'}; "
                     f"inner 1–4 px brightest lift={max(rim, default=0):.1f}.")

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
    return lines, [str(crop_root / f"{case_slug}-{file_name[:-4]}-{side}-8x.png") for side in profiles]


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
    cases = sorted(root.rglob("case.json"))
    for path in cases:
        try:
            case = json.loads(path.read_text(encoding="utf-8"))
        except Exception as error:
            parts.extend([f"## {path.parent.relative_to(root)}", "", f"Could not read case metadata: {error}", ""])
            continue
        rel = path.parent.relative_to(root)
        parts.extend([f"## {rel}", "", f"Case: {case.get('source', case.get('shape', case.get('stage', 'unknown')))}; "
                      f"appearance={case.get('appearance', 'unknown')}; background={case.get('background', case.get('backdrop', 'unknown'))}.", ""])
        for window_name, method, info in captures(case):
            parts.extend([f"### {window_name} — {method}", ""])
            lines, images = inspect_capture(path, info, case, crop_root)
            parts.extend(lines)
            crop_paths.extend(images)
            parts.append("")
    if not cases:
        parts.extend(["No `case.json` files found.", ""])
    parts.extend(["## Crops", "", "Nearest-neighbour side profile PNGs are under `menu-outline-edge-crops/`.", ""])
    for crop in sorted(set(crop_paths)):
        parts.append(f"- `{Path(crop).relative_to(root)}`")
    destination = root / "menu-outline-summary.md"
    destination.write_text("\n".join(parts) + "\n", encoding="utf-8")
    print(destination)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("usage: summarize-menu-outline.py RUN_DIR")
    main(sys.argv[1])
