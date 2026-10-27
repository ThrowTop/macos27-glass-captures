#!/usr/bin/env python3
"""Print each symbol image's centre offset and size within its measured control."""
import json
import sys


def rect(value):
    if not isinstance(value, dict):
        return None
    keys = ("x", "y", "width", "height")
    if any(key not in value for key in keys):
        return None
    return tuple(float(value[key]) for key in keys)


def main(path):
    rows = []
    with open(path, encoding="utf-8") as source:
        for line in source:
            if line.strip():
                rows.append(json.loads(line))
    rows.sort(key=lambda r: (r["appearance"], int(r["row"]), r["symbol"]))
    print("appearance\trow\tsymbol\tdx\tdy\timageWidth\timageHeight")
    for row in rows:
        control, image = rect(row.get("controlFrame")), rect(row.get("imageFrame"))
        if control is None or image is None:
            dx = dy = width = height = "unavailable"
        else:
            cx, cy = control[0] + control[2] / 2, control[1] + control[3] / 2
            ix, iy = image[0] + image[2] / 2, image[1] + image[3] / 2
            dx, dy = f"{ix - cx:.2f}", f"{iy - cy:.2f}"
            width, height = f"{image[2]:.2f}", f"{image[3]:.2f}"
        print(f"{row['appearance']}\t{row['row']}\t{row['symbol']}\t{dx}\t{dy}\t{width}\t{height}")


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "out/contexts.jsonl")
