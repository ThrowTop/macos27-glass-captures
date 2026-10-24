# Review 2 V3 overflow-aligned pairs

- Reference manifest and rasters: run `39912429854`, `sf-symbol-checks/sf-symbol-checks/v3.jsonl` and `v3/`.
- Candidate: MacUIKit worktree commit `95899d64`, captured at 1× and 2× with the public intrinsic frame and 8 device-pixel canvas padding. The complete 720-image candidate remains in `C:\wt\sf-symbols\build\release\.work\symbol-v3-overflow-candidate\`.
- Comparison: integer candidate translations from -8 through +8 device pixels in both axes; each case uses the offset with lowest RGBA MAE. Full 720-case table: `C:\wt\sf-symbols\binary-research\macos-27.2-26B5101f\tasks\sf-symbols-p1\v3-diff-summary.txt`.
- Worst six cases: `minus-regular-small-20pt-1x`, `minus-bold-small-13pt-1x`, `minus-bold-small-20pt-1x`, `gearshape-regular-small-20pt-1x`, `trash_slash-black-small-13pt-1x`, `gearshape-regular-medium-13pt-1x`.
- Six controls: one low-MAE case each for checkmark, chevron.down, gearshape, minus, poweron, and star.fill.
