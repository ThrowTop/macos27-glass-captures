#!/usr/bin/env python3
"""Build a per-pass index of the 1x and 2x control render references."""
import json
import sys
from pathlib import Path


def value(data, key):
    entry = data.get(key)
    return entry.get('value') if isinstance(entry, dict) else None


def main(run_dir):
    root = Path(run_dir).resolve()
    index = {}
    for deep_json in sorted(root.glob('**/probes/*/deep.json')):
        pass_name = deep_json.parent.name
        data = json.loads(deep_json.read_text(encoding='utf-8'))
        renders = {}
        for key in data:
            if not key.startswith('render.') or not key.endswith('.screenshot'):
                continue
            ident = key[:-len('.screenshot')]
            shot = value(data, ident + '.screenshot') or {}
            cache = value(data, ident + '.cache2x') or {}
            frame = value(data, ident + '.controlFrame')
            if not shot.get('file') or not cache.get('file') or not isinstance(frame, dict):
                continue
            base = deep_json.parent / 'deep' / 'render'
            renders[ident] = {
                '1x': (base / shot['file']).relative_to(root).as_posix(),
                '2x': (base / cache['file']).relative_to(root).as_posix(),
                'controlFramePoints': frame,
            }
        index[pass_name] = dict(sorted(renders.items()))
    dest = root / 'render-index.json'
    dest.write_text(json.dumps(index, indent=2, sort_keys=True) + '\n', encoding='utf-8')
    print(f'{dest} ({sum(map(len, index.values()))} pass/id entries across {len(index)} passes)')


if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: render-index.py RUN_DIR')
    main(sys.argv[1])
