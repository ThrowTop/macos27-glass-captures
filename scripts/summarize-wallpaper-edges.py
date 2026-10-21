#!/usr/bin/env python3
"""Summarize wallpaper-edge case metadata without interpreting captured pixels."""

import argparse
import json
from pathlib import Path


def compact(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def summarize(root: Path) -> list[dict]:
    cases = []
    case_dirs = sorted(path for path in root.iterdir()
                       if path.is_dir() and "-aware-" in path.name and "-tint-" in path.name)
    for case_dir in case_dirs:
        metadata_path = case_dir / "metadata.json"
        images = sorted(path.relative_to(root).as_posix() for path in case_dir.glob("*.png"))
        if not metadata_path.exists():
            cases.append({"case": case_dir.name, "status": "missing-metadata",
                          "reasons": ["metadata.json was not produced"],
                          "metadata": None, "images": images})
            continue
        try:
            metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as error:
            cases.append({"case": case_dir.name, "status": "metadata-error", "reasons": [str(error)],
                          "metadata": metadata_path.relative_to(root).as_posix(), "images": []})
            continue
        cases.append({
            "case": case_dir.name,
            "status": metadata.get("status", "unknown"),
            "reasons": metadata.get("errors", []) + metadata.get("incompleteReasons", []),
            "screen": metadata.get("screen"),
            "window": metadata.get("window"),
            "crop": metadata.get("crop"),
            "backdrops": metadata.get("backdrops"),
            "metadata": metadata_path.relative_to(root).as_posix(),
            "images": images,
        })
    return cases


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", type=Path, help="Directory containing one subdirectory per case")
    parser.add_argument("--format", choices=("markdown", "json"), default="markdown")
    args = parser.parse_args()
    cases = summarize(args.root)
    if args.format == "json":
        print(json.dumps(cases, indent=2, sort_keys=True))
        return
    setup_path = args.root / "runner-setup.txt"
    setup = setup_path.read_text(encoding="utf-8").strip() if setup_path.exists() else "not recorded"
    print(f"# Wallpaper-edge capture summary\n\nCases with metadata: {len(cases)}\n")
    print(f"Runner setup (`{setup_path.relative_to(args.root).as_posix()}`):\n\n```text\n{setup}\n```\n")
    print("| Case | Status | Reasons | Screen | Window | Crop | Backdrops before / after | Images |")
    print("| --- | --- | --- | --- | --- | --- | --- | --- |")
    for case in cases:
        print("| {case} | {status} | {reasons} | {screen} | {window} | {crop} | {backdrops} | {images} |".format(
            case=case["case"], status=case["status"],
            reasons=compact(case.get("reasons", [])),
            screen=compact(case.get("screen")), window=compact(case.get("window")),
            crop=compact(case.get("crop")), backdrops=compact(case.get("backdrops")),
            images=compact(case.get("images", []))))


if __name__ == "__main__":
    main()
