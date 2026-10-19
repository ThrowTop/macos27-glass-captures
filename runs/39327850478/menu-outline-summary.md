# Menu and window outline measurements

Profiles sample 8 pixels outside through 8 pixels inside each captured frame. Luminance uses Rec. 709 weights.
The nearest-neighbour crops enlarge each 17-pixel side profile by 8×; corner blocks list the first 8×8 pixels at the top-left and bottom-right of the frame.

## Coverage

- 80 case records; 204 valid capture profiles from 203 PNG files; 816 unique 8× edge crops.
- Menu cases opened: 43/56; submenu windows included: 1/8.

## Numerical findings

Display composites compare each exterior sample with the sample 8 px out; a ≥6 Y difference marks profile variation, which may also come from texture in a busy backdrop. Single-window and CG images report the transparent shadow extent where alpha is at least 8. Inner lift compares the mean of distances 0–3 with distances 5–8; sides at +5 Y or more are flagged as a light rim.

| Case / appearance / backdrop | Window, method | Exterior evidence by side | Light rim sides (mean ΔY) |
|---|---|---|---|
| `macos27-captures\out\menu-outline\menus\dark\photo\appkit-popup` | menu-window-0, display | top 7/8 (max ΔY 14.9), right 7/8 (max ΔY 40.1), bottom 7/8 (max ΔY 111.3), left 4/8 (max ΔY 25.0) | top +17.8, bottom +13.2 |
| `macos27-captures\out\menu-outline\menus\dark\photo\appkit-popup` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | top +51.4 |
| `macos27-captures\out\menu-outline\menus\dark\photo\appkit-popup` | menu-window-0, cgwindow | top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64 | right +16.5, bottom +23.8, left +16.5 |
| `macos27-captures\out\menu-outline\menus\dark\photo\combobox` | menu-window-0, display | top 7/8 (max ΔY 44.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark\photo\combobox` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | bottom +44.7, left +11.5 |
| `macos27-captures\out\menu-outline\menus\dark\photo\combobox` | menu-window-0, cgwindow | top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64 | right +8.5, bottom +8.5, left +8.5 |
| `macos27-captures\out\menu-outline\menus\dark\photo\context` | menu-window-0, display | top 5/8 (max ΔY 45.2), right 6/8 (max ΔY 62.6), bottom 7/8 (max ΔY 67.6), left 6/8 (max ΔY 150.8) | top +14.4, bottom +18.8 |
| `macos27-captures\out\menu-outline\menus\dark\photo\context` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | bottom +18.6 |
| `macos27-captures\out\menu-outline\menus\dark\photo\context` | menu-window-0, cgwindow | top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 77, left 8 px, α−1 63 | top +24.8, right +16.5, bottom +23.8, left +16.5 |
| `macos27-captures\out\menu-outline\menus\dark\plain\appkit-popup` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | bottom +12.2 |
| `macos27-captures\out\menu-outline\menus\dark\plain\appkit-popup` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark\plain\appkit-popup` | menu-window-0, cgwindow | top 6 px, α−1 218, right 8 px, α−1 221, bottom 8 px, α−1 223, left 8 px, α−1 221 | right +9.8, bottom +19.0, left +9.8 |
| `macos27-captures\out\menu-outline\menus\dark\plain\appkit-pulldown` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | top +16.2, bottom +13.0 |
| `macos27-captures\out\menu-outline\menus\dark\plain\appkit-pulldown` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark\plain\appkit-pulldown` | menu-window-0, cgwindow | top 6 px, α−1 218, right 8 px, α−1 221, bottom 8 px, α−1 223, left 8 px, α−1 221 | top +20.0, right +9.8, bottom +19.0, left +9.8 |
| `macos27-captures\out\menu-outline\menus\dark\plain\combobox` | menu-window-0, display | top 7/8 (max ΔY 44.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark\plain\combobox` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark\plain\combobox` | menu-window-0, cgwindow | top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64 | right +8.5, bottom +8.5, left +8.5 |
| `macos27-captures\out\menu-outline\menus\dark\plain\context` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | top +13.5, bottom +13.0 |
| `macos27-captures\out\menu-outline\menus\dark\plain\context` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark\plain\context` | menu-window-0, cgwindow | top 6 px, α−1 218, right 8 px, α−1 221, bottom 8 px, α−1 222, left 8 px, α−1 221 | top +20.0, right +9.8, bottom +19.0, left +9.8 |
| `macos27-captures\out\menu-outline\menus\dark\plain\swiftui-menu` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | top +11.5, bottom +9.0 |
| `macos27-captures\out\menu-outline\menus\dark\plain\swiftui-menu` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark\plain\swiftui-menu` | menu-window-0, cgwindow | top 6 px, α−1 52, right 8 px, α−1 63, bottom 8 px, α−1 76, left 8 px, α−1 64 | top +24.8, right +16.5, bottom +23.8, left +16.5 |
| `macos27-captures\out\menu-outline\menus\dark\plain\swiftui-picker` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | bottom +13.0 |
| `macos27-captures\out\menu-outline\menus\dark\plain\swiftui-picker` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark\plain\swiftui-picker` | menu-window-0, cgwindow | top 6 px, α−1 218, right 8 px, α−1 219, bottom 8 px, α−1 223, left 8 px, α−1 221 | top +20.0, right +9.8, bottom +19.0, left +9.8 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\appkit-popup` | menu-window-0, display | top 7/8 (max ΔY 14.9), right 7/8 (max ΔY 40.1), bottom 7/8 (max ΔY 111.3), left 4/8 (max ΔY 25.0) | bottom +13.5 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\appkit-popup` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | top +51.4 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\appkit-popup` | menu-window-0, cgwindow | top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64 | right +16.7, bottom +23.8, left +16.7 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\appkit-pulldown` | menu-window-0, display | top 7/8 (max ΔY 52.1), right 5/8 (max ΔY 56.9), bottom 7/8 (max ΔY 104.0), left 7/8 (max ΔY 68.5) | top +14.0, bottom +14.5 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\appkit-pulldown` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | left +68.1 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\appkit-pulldown` | menu-window-0, cgwindow | top 6 px, α−1 50, right 8 px, α−1 63, bottom 8 px, α−1 77, left 8 px, α−1 64 | top +24.2, right +16.0, bottom +23.8, left +16.0 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\combobox` | menu-window-0, display | top 7/8 (max ΔY 184.5), right 6/8 (max ΔY 43.4), bottom 7/8 (max ΔY 181.3), left 7/8 (max ΔY 61.6) | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\combobox` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | left +68.1 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\combobox` | menu-window-0, cgwindow | top 6 px, α−1 48, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59 | top +11.2, right +29.8, bottom +29.8, left +29.8 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\context` | menu-window-0, display | top 5/8 (max ΔY 45.2), right 6/8 (max ΔY 62.6), bottom 7/8 (max ΔY 67.6), left 6/8 (max ΔY 150.8) | top +14.3, bottom +14.4 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\context` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | bottom +18.6 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\context` | menu-window-0, cgwindow | top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 77, left 8 px, α−1 63 | top +23.8, right +16.7, bottom +23.8, left +16.7 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\submenu` | menu-window-0, display | top 7/8 (max ΔY 14.9), right 0/8 (max ΔY 1.6), bottom 7/8 (max ΔY 111.3), left 4/8 (max ΔY 25.0) | bottom +13.5 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\submenu` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | top +51.4 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\submenu` | menu-window-0, cgwindow | top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64 | right +16.7, bottom +23.8, left +16.7 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\submenu` | menu-window-1, display | top 6/8 (max ΔY 160.7), right 7/8 (max ΔY 77.6), bottom 7/8 (max ΔY 98.5), left 0/8 (max ΔY 0.3) | top +14.9, bottom +12.6 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\submenu` | menu-window-1, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | right +29.7, bottom +8.8, left +14.6 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\photo\submenu` | menu-window-1, cgwindow | top 6 px, α−1 52, right 8 px, α−1 63, bottom 8 px, α−1 76, left 8 px, α−1 64 | top +24.2, right +16.0, bottom +23.8, left +16.0 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\appkit-popup` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | bottom +13.8 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\appkit-popup` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\appkit-popup` | menu-window-0, cgwindow | top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64 | right +16.7, bottom +23.8, left +16.7 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\appkit-pulldown` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | top +15.2, bottom +14.0 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\appkit-pulldown` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\appkit-pulldown` | menu-window-0, cgwindow | top 6 px, α−1 50, right 8 px, α−1 63, bottom 8 px, α−1 77, left 8 px, α−1 64 | top +24.2, right +16.0, bottom +23.8, left +16.0 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\combobox` | menu-window-0, display | top 7/8 (max ΔY 38.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\combobox` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\combobox` | menu-window-0, cgwindow | top 6 px, α−1 48, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59 | top +11.2, right +29.8, bottom +29.8, left +29.8 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\context` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | top +14.8, bottom +14.0 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\context` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\context` | menu-window-0, cgwindow | top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 77, left 8 px, α−1 63 | top +23.8, right +16.7, bottom +23.8, left +16.7 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\submenu` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | bottom +13.8 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\submenu` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\dark-contrast\plain\submenu` | menu-window-0, cgwindow | top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64 | right +16.7, bottom +23.8, left +16.7 |
| `macos27-captures\out\menu-outline\menus\light\photo\appkit-popup` | menu-window-0, display | top 7/8 (max ΔY 14.9), right 7/8 (max ΔY 40.1), bottom 7/8 (max ΔY 111.3), left 4/8 (max ΔY 25.0) | top +95.5, bottom +13.1 |
| `macos27-captures\out\menu-outline\menus\light\photo\appkit-popup` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | left +28.0 |
| `macos27-captures\out\menu-outline\menus\light\photo\appkit-popup` | menu-window-0, cgwindow | top 5 px, α−1 50, right 8 px, α−1 62, bottom 8 px, α−1 72, left 8 px, α−1 62 | top +50.5, right +15.2, bottom +22.0, left +15.2 |
| `macos27-captures\out\menu-outline\menus\light\photo\appkit-pulldown` | menu-window-0, display | top 7/8 (max ΔY 52.1), right 5/8 (max ΔY 56.9), bottom 7/8 (max ΔY 104.0), left 7/8 (max ΔY 68.5) | top +9.3, bottom +13.7 |
| `macos27-captures\out\menu-outline\menus\light\photo\appkit-pulldown` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | bottom +40.5, left +11.5 |
| `macos27-captures\out\menu-outline\menus\light\photo\appkit-pulldown` | menu-window-0, cgwindow | top 6 px, α−1 50, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62 | top +24.2, right +15.0, bottom +21.8, left +15.0 |
| `macos27-captures\out\menu-outline\menus\light\photo\combobox` | menu-window-0, display | top 7/8 (max ΔY 165.4), right 6/8 (max ΔY 43.4), bottom 7/8 (max ΔY 181.3), left 7/8 (max ΔY 61.6) | top +115.0 |
| `macos27-captures\out\menu-outline\menus\light\photo\combobox` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | bottom +44.7, left +11.5 |
| `macos27-captures\out\menu-outline\menus\light\photo\combobox` | menu-window-0, cgwindow | top 6 px, α−1 51, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62 | top +133.4 |
| `macos27-captures\out\menu-outline\menus\light\photo\context` | menu-window-0, display | top 5/8 (max ΔY 45.2), right 6/8 (max ΔY 62.6), bottom 7/8 (max ΔY 67.6), left 6/8 (max ΔY 150.8) | top +9.7, bottom +12.9 |
| `macos27-captures\out\menu-outline\menus\light\photo\context` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light\photo\context` | menu-window-0, cgwindow | top 6 px, α−1 50, right 8 px, α−1 62, bottom 8 px, α−1 72, left 8 px, α−1 61 | top +24.2, right +14.8, bottom +21.8, left +14.8 |
| `macos27-captures\out\menu-outline\menus\light\photo\submenu` | menu-window-0, display | top 7/8 (max ΔY 14.9), right 7/8 (max ΔY 40.1), bottom 7/8 (max ΔY 111.3), left 4/8 (max ΔY 25.0) | top +95.5, bottom +13.1 |
| `macos27-captures\out\menu-outline\menus\light\photo\submenu` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | left +28.0 |
| `macos27-captures\out\menu-outline\menus\light\photo\submenu` | menu-window-0, cgwindow | top 5 px, α−1 50, right 8 px, α−1 62, bottom 8 px, α−1 72, left 8 px, α−1 62 | top +50.5, right +15.2, bottom +22.0, left +15.2 |
| `macos27-captures\out\menu-outline\menus\light\photo\swiftui-menu` | menu-window-0, display | top 7/8 (max ΔY 82.0), right 3/8 (max ΔY 79.8), bottom 7/8 (max ΔY 62.7), left 6/8 (max ΔY 41.1) | top +9.0 |
| `macos27-captures\out\menu-outline\menus\light\photo\swiftui-menu` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | top +13.2, right +41.7, left +11.5 |
| `macos27-captures\out\menu-outline\menus\light\photo\swiftui-menu` | menu-window-0, cgwindow | top 5 px, α−1 51, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62 | top +24.2, right +15.0, bottom +21.8, left +15.0 |
| `macos27-captures\out\menu-outline\menus\light\photo\swiftui-picker` | menu-window-0, display | top 6/8 (max ΔY 24.9), right 7/8 (max ΔY 53.3), bottom 5/8 (max ΔY 70.6), left 7/8 (max ΔY 66.1) | top +10.6, bottom +13.7 |
| `macos27-captures\out\menu-outline\menus\light\photo\swiftui-picker` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light\photo\swiftui-picker` | menu-window-0, cgwindow | top 6 px, α−1 50, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62 | top +24.2, right +15.0, bottom +21.8, left +15.0 |
| `macos27-captures\out\menu-outline\menus\light\plain\appkit-popup` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | top +144.8 |
| `macos27-captures\out\menu-outline\menus\light\plain\appkit-popup` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light\plain\appkit-popup` | menu-window-0, cgwindow | top 5 px, α−1 50, right 8 px, α−1 62, bottom 8 px, α−1 72, left 8 px, α−1 62 | top +50.5, right +15.2, bottom +22.0, left +15.2 |
| `macos27-captures\out\menu-outline\menus\light\plain\appkit-pulldown` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light\plain\appkit-pulldown` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light\plain\appkit-pulldown` | menu-window-0, cgwindow | top 6 px, α−1 50, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62 | top +24.2, right +15.0, bottom +21.8, left +15.0 |
| `macos27-captures\out\menu-outline\menus\light\plain\combobox` | menu-window-0, display | top 1/8 (max ΔY 20.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | top +139.2 |
| `macos27-captures\out\menu-outline\menus\light\plain\combobox` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light\plain\combobox` | menu-window-0, cgwindow | top 6 px, α−1 51, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62 | top +133.4 |
| `macos27-captures\out\menu-outline\menus\light\plain\context` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light\plain\context` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light\plain\context` | menu-window-0, cgwindow | top 6 px, α−1 50, right 8 px, α−1 62, bottom 8 px, α−1 72, left 8 px, α−1 61 | top +24.2, right +14.8, bottom +21.8, left +14.8 |
| `macos27-captures\out\menu-outline\menus\light\plain\submenu` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | top +144.8 |
| `macos27-captures\out\menu-outline\menus\light\plain\submenu` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light\plain\submenu` | menu-window-0, cgwindow | top 5 px, α−1 50, right 8 px, α−1 62, bottom 8 px, α−1 72, left 8 px, α−1 62 | top +50.5, right +15.2, bottom +22.0, left +15.2 |
| `macos27-captures\out\menu-outline\menus\light\plain\swiftui-menu` | menu-window-0, display | top 3/8 (max ΔY 42.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light\plain\swiftui-menu` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | bottom +10.4 |
| `macos27-captures\out\menu-outline\menus\light\plain\swiftui-menu` | menu-window-0, cgwindow | top 5 px, α−1 51, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62 | top +24.2, right +15.0, bottom +21.8, left +15.0 |
| `macos27-captures\out\menu-outline\menus\light\plain\swiftui-picker` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | top +10.2 |
| `macos27-captures\out\menu-outline\menus\light\plain\swiftui-picker` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light\plain\swiftui-picker` | menu-window-0, cgwindow | top 6 px, α−1 50, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62 | top +24.2, right +15.0, bottom +21.8, left +15.0 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\appkit-pulldown` | menu-window-0, display | top 7/8 (max ΔY 52.1), right 5/8 (max ΔY 56.9), bottom 7/8 (max ΔY 104.0), left 7/8 (max ΔY 68.5) | top +8.4, bottom +10.0 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\appkit-pulldown` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | left +68.1 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\appkit-pulldown` | menu-window-0, cgwindow | top 6 px, α−1 47, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59 | top +21.8, right +17.0, bottom +19.0, left +17.0 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\combobox` | menu-window-0, display | top 7/8 (max ΔY 165.4), right 6/8 (max ΔY 43.4), bottom 7/8 (max ΔY 181.3), left 7/8 (max ΔY 61.6) | top +151.1 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\combobox` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | left +68.1 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\combobox` | menu-window-0, cgwindow | top 6 px, α−1 48, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59 | top +173.3 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\context` | menu-window-0, display | top 5/8 (max ΔY 45.2), right 6/8 (max ΔY 62.6), bottom 7/8 (max ΔY 67.6), left 6/8 (max ΔY 150.8) | top +9.2, bottom +9.8 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\context` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | bottom +18.6 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\context` | menu-window-0, cgwindow | top 6 px, α−1 47, right 8 px, α−1 59, bottom 8 px, α−1 69, left 8 px, α−1 58 | top +21.6, right +16.5, bottom +18.6, left +16.5 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\submenu` | menu-window-0, display | top 7/8 (max ΔY 14.9), right 7/8 (max ΔY 40.1), bottom 7/8 (max ΔY 111.3), left 4/8 (max ΔY 25.0) | top +162.0, bottom +9.7 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\submenu` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | top +51.4 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\submenu` | menu-window-0, cgwindow | top 5 px, α−1 47, right 8 px, α−1 59, bottom 8 px, α−1 69, left 8 px, α−1 59 | top +143.8, right +16.2, bottom +18.3, left +16.2 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\swiftui-menu` | menu-window-0, display | top 5/8 (max ΔY 109.4), right 3/8 (max ΔY 79.8), bottom 7/8 (max ΔY 62.7), left 6/8 (max ΔY 41.1) | top +8.2 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\swiftui-menu` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | right +8.6, bottom +42.7, left +68.1 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\swiftui-menu` | menu-window-0, cgwindow | top 5 px, α−1 48, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59 | top +21.8, right +17.0, bottom +19.0, left +17.0 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\swiftui-picker` | menu-window-0, display | top 6/8 (max ΔY 24.9), right 7/8 (max ΔY 53.3), bottom 5/8 (max ΔY 70.6), left 7/8 (max ΔY 66.1) | top +11.2, bottom +10.1 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\swiftui-picker` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | right +41.0, left +7.5 |
| `macos27-captures\out\menu-outline\menus\light-contrast\photo\swiftui-picker` | menu-window-0, cgwindow | top 6 px, α−1 47, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59 | top +21.8, right +17.0, bottom +19.0, left +17.0 |
| `macos27-captures\out\menu-outline\menus\light-contrast\plain\appkit-pulldown` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light-contrast\plain\appkit-pulldown` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light-contrast\plain\appkit-pulldown` | menu-window-0, cgwindow | top 6 px, α−1 47, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59 | top +21.8, right +17.0, bottom +19.0, left +17.0 |
| `macos27-captures\out\menu-outline\menus\light-contrast\plain\combobox` | menu-window-0, display | top 7/8 (max ΔY 92.1), right 6/8 (max ΔY 43.4), bottom 7/8 (max ΔY 181.3), left 7/8 (max ΔY 61.6) | top +50.6, right +8.4 |
| `macos27-captures\out\menu-outline\menus\light-contrast\plain\combobox` | menu-window-0, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light-contrast\plain\combobox` | menu-window-0, cgwindow | top 6 px, α−1 48, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59 | top +173.3 |
| `macos27-captures\out\menu-outline\menus\light-contrast\plain\context` | menu-window-0, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light-contrast\plain\context` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light-contrast\plain\context` | menu-window-0, cgwindow | top 6 px, α−1 47, right 8 px, α−1 59, bottom 8 px, α−1 69, left 8 px, α−1 58 | top +21.6, right +16.5, bottom +18.6, left +16.5 |
| `macos27-captures\out\menu-outline\menus\light-contrast\plain\swiftui-picker` | menu-window-0, display | top 5/8 (max ΔY 28.8), right 5/8 (max ΔY 36.6), bottom 3/8 (max ΔY 41.3), left 6/8 (max ΔY 97.4) | top +7.7, bottom +6.7, left +10.8 |
| `macos27-captures\out\menu-outline\menus\light-contrast\plain\swiftui-picker` | menu-window-0, single-window | top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\menus\light-contrast\plain\swiftui-picker` | menu-window-0, cgwindow | top 4 px, α−1 34, right 7 px, α−1 41, bottom 8 px, α−1 49, left 8 px, α−1 42 | top +21.8, right +16.5, bottom +19.0, left +16.5 |
| `macos27-captures\out\menu-outline\step1\dark\black` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\step1\dark\black` | normal, single-window | top 8 px, α−1 239, right 8 px, α−1 243, bottom 8 px, α−1 247, left 8 px, α−1 243 | top +5.5 |
| `macos27-captures\out\menu-outline\step1\dark\black` | normal, cgwindow | top 8 px, α−1 239, right 8 px, α−1 243, bottom 8 px, α−1 247, left 8 px, α−1 243 | top +5.5 |
| `macos27-captures\out\menu-outline\step1\dark\white` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\step1\dark\white` | normal, single-window | top 8 px, α−1 239, right 8 px, α−1 243, bottom 8 px, α−1 247, left 8 px, α−1 243 | top +5.5, right +6.2, bottom +6.2, left +6.2 |
| `macos27-captures\out\menu-outline\step1\dark\white` | normal, cgwindow | top 8 px, α−1 239, right 8 px, α−1 243, bottom 8 px, α−1 247, left 8 px, α−1 243 | top +5.5, right +6.2, bottom +6.2, left +6.2 |
| `macos27-captures\out\menu-outline\step1\dark-contrast\black` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\step1\dark-contrast\black` | normal, single-window | top 8 px, α−1 58, right 8 px, α−1 107, bottom 8 px, α−1 159, left 8 px, α−1 108 | top +10.8 |
| `macos27-captures\out\menu-outline\step1\dark-contrast\black` | normal, cgwindow | top 8 px, α−1 58, right 8 px, α−1 107, bottom 8 px, α−1 159, left 8 px, α−1 108 | top +10.8 |
| `macos27-captures\out\menu-outline\step1\dark-contrast\white` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\step1\dark-contrast\white` | normal, single-window | top 8 px, α−1 58, right 8 px, α−1 107, bottom 8 px, α−1 159, left 8 px, α−1 108 | top +10.8, right +12.7, bottom +12.7, left +12.7 |
| `macos27-captures\out\menu-outline\step1\dark-contrast\white` | normal, cgwindow | top 8 px, α−1 58, right 8 px, α−1 107, bottom 8 px, α−1 159, left 8 px, α−1 108 | top +10.8, right +12.7, bottom +12.7, left +12.7 |
| `macos27-captures\out\menu-outline\step1\light\black` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\step1\light\black` | normal, single-window | top 8 px, α−1 54, right 8 px, α−1 80, bottom 8 px, α−1 109, left 8 px, α−1 81 | none ≥5 |
| `macos27-captures\out\menu-outline\step1\light\black` | normal, cgwindow | top 8 px, α−1 54, right 8 px, α−1 80, bottom 8 px, α−1 109, left 8 px, α−1 81 | none ≥5 |
| `macos27-captures\out\menu-outline\step1\light\white` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\step1\light\white` | normal, single-window | top 8 px, α−1 52, right 8 px, α−1 78, bottom 8 px, α−1 108, left 8 px, α−1 79 | right +6.2, bottom +6.2, left +6.2 |
| `macos27-captures\out\menu-outline\step1\light\white` | normal, cgwindow | top 8 px, α−1 52, right 8 px, α−1 78, bottom 8 px, α−1 108, left 8 px, α−1 79 | right +6.2, bottom +6.2, left +6.2 |
| `macos27-captures\out\menu-outline\step1\light-contrast\black` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\step1\light-contrast\black` | normal, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 0 px, α−1 1, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\step1\light-contrast\black` | normal, cgwindow | top 0 px, α−1 1, right 8 px, α−1 54, bottom 8 px, α−1 255, left 8 px, α−1 55 | none ≥5 |
| `macos27-captures\out\menu-outline\step1\light-contrast\white` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\step1\light-contrast\white` | normal, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 0 px, α−1 1, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\step1\light-contrast\white` | normal, cgwindow | top 0 px, α−1 1, right 8 px, α−1 54, bottom 8 px, α−1 255, left 8 px, α−1 55 | right +44.7, left +44.7 |
| `macos27-captures\out\menu-outline\window-contour\dark\black\active` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark\black\active` | normal, single-window | top 8 px, α−1 239, right 8 px, α−1 243, bottom 8 px, α−1 247, left 8 px, α−1 243 | top +5.5 |
| `macos27-captures\out\menu-outline\window-contour\dark\black\active` | normal, cgwindow | top 8 px, α−1 239, right 8 px, α−1 243, bottom 8 px, α−1 247, left 8 px, α−1 243 | top +5.5 |
| `macos27-captures\out\menu-outline\window-contour\dark\black\inactive` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark\black\inactive` | normal, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 0 px, α−1 0, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark\black\inactive` | normal, cgwindow | top 5 px, α−1 215, right 8 px, α−1 223, bottom 8 px, α−1 227, left 8 px, α−1 223 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark\white\active` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark\white\active` | normal, single-window | top 8 px, α−1 239, right 8 px, α−1 243, bottom 8 px, α−1 247, left 8 px, α−1 243 | top +5.5, right +6.2, bottom +6.2, left +6.2 |
| `macos27-captures\out\menu-outline\window-contour\dark\white\active` | normal, cgwindow | top 8 px, α−1 239, right 8 px, α−1 243, bottom 8 px, α−1 247, left 8 px, α−1 243 | top +5.5, right +6.2, bottom +6.2, left +6.2 |
| `macos27-captures\out\menu-outline\window-contour\dark\white\inactive` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark\white\inactive` | normal, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 0 px, α−1 0, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark\white\inactive` | normal, cgwindow | top 5 px, α−1 215, right 8 px, α−1 223, bottom 8 px, α−1 227, left 8 px, α−1 223 | right +5.0, bottom +5.0, left +5.0 |
| `macos27-captures\out\menu-outline\window-contour\dark-contrast\black\active` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark-contrast\black\active` | normal, single-window | top 8 px, α−1 58, right 8 px, α−1 107, bottom 8 px, α−1 159, left 8 px, α−1 108 | top +10.8 |
| `macos27-captures\out\menu-outline\window-contour\dark-contrast\black\active` | normal, cgwindow | top 8 px, α−1 58, right 8 px, α−1 107, bottom 8 px, α−1 159, left 8 px, α−1 108 | top +10.8 |
| `macos27-captures\out\menu-outline\window-contour\dark-contrast\black\inactive` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark-contrast\black\inactive` | normal, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 0 px, α−1 0, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark-contrast\black\inactive` | normal, cgwindow | top 5 px, α−1 48, right 8 px, α−1 80, bottom 8 px, α−1 111, left 8 px, α−1 80 | top +9.7 |
| `macos27-captures\out\menu-outline\window-contour\dark-contrast\white\active` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark-contrast\white\active` | normal, single-window | top 8 px, α−1 58, right 8 px, α−1 107, bottom 8 px, α−1 159, left 8 px, α−1 108 | top +10.8, right +12.7, bottom +12.7, left +12.7 |
| `macos27-captures\out\menu-outline\window-contour\dark-contrast\white\active` | normal, cgwindow | top 8 px, α−1 58, right 8 px, α−1 107, bottom 8 px, α−1 159, left 8 px, α−1 108 | top +10.8, right +12.7, bottom +12.7, left +12.7 |
| `macos27-captures\out\menu-outline\window-contour\dark-contrast\white\inactive` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark-contrast\white\inactive` | normal, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 0 px, α−1 0, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\dark-contrast\white\inactive` | normal, cgwindow | top 5 px, α−1 48, right 8 px, α−1 80, bottom 8 px, α−1 111, left 8 px, α−1 80 | top +9.7, right +11.5, bottom +11.5, left +11.5 |
| `macos27-captures\out\menu-outline\window-contour\light\black\active` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light\black\active` | normal, single-window | top 8 px, α−1 54, right 8 px, α−1 80, bottom 8 px, α−1 109, left 8 px, α−1 81 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light\black\active` | normal, cgwindow | top 8 px, α−1 54, right 8 px, α−1 80, bottom 8 px, α−1 109, left 8 px, α−1 81 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light\black\inactive` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light\black\inactive` | normal, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 0 px, α−1 0, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light\black\inactive` | normal, cgwindow | top 2 px, α−1 43, right 8 px, α−1 59, bottom 8 px, α−1 74, left 8 px, α−1 59 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light\white\active` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light\white\active` | normal, single-window | top 8 px, α−1 54, right 8 px, α−1 80, bottom 8 px, α−1 109, left 8 px, α−1 81 | right +6.2, bottom +6.2, left +6.2 |
| `macos27-captures\out\menu-outline\window-contour\light\white\active` | normal, cgwindow | top 8 px, α−1 54, right 8 px, α−1 80, bottom 8 px, α−1 109, left 8 px, α−1 81 | right +6.2, bottom +6.2, left +6.2 |
| `macos27-captures\out\menu-outline\window-contour\light\white\inactive` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light\white\inactive` | normal, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 0 px, α−1 0, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light\white\inactive` | normal, cgwindow | top 2 px, α−1 43, right 8 px, α−1 59, bottom 8 px, α−1 74, left 8 px, α−1 59 | right +6.2, bottom +6.2, left +6.2 |
| `macos27-captures\out\menu-outline\window-contour\light-contrast\black\active` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light-contrast\black\active` | normal, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 0 px, α−1 1, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light-contrast\black\active` | normal, cgwindow | top 0 px, α−1 1, right 8 px, α−1 54, bottom 8 px, α−1 255, left 8 px, α−1 55 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light-contrast\black\inactive` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light-contrast\black\inactive` | normal, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 0 px, α−1 0, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light-contrast\black\inactive` | normal, cgwindow | top 2 px, α−1 39, right 8 px, α−1 55, bottom 8 px, α−1 70, left 8 px, α−1 55 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light-contrast\white\active` | normal, display | top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light-contrast\white\active` | normal, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 0 px, α−1 1, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light-contrast\white\active` | normal, cgwindow | top 0 px, α−1 1, right 8 px, α−1 54, bottom 8 px, α−1 255, left 8 px, α−1 55 | right +44.7, left +44.7 |
| `macos27-captures\out\menu-outline\window-contour\light-contrast\white\inactive` | normal, display | top 7/8 (max ΔY 16.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0) | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light-contrast\white\inactive` | normal, single-window | top 8 px, α−1 255, right 0 px, α−1 0, bottom 0 px, α−1 0, left 8 px, α−1 255 | none ≥5 |
| `macos27-captures\out\menu-outline\window-contour\light-contrast\white\inactive` | normal, cgwindow | top 2 px, α−1 39, right 8 px, α−1 55, bottom 8 px, α−1 70, left 8 px, α−1 55 | right +44.7, bottom +44.7, left +44.7 |

### Menu source comparison

Compare each source within the same appearance and backdrop. `display` gives exterior RGB change against the 8 px sample; single-window and CG entries give alpha reach. The raw side profiles below preserve exact RGB, luminance, and alpha values.

- appkit-popup / dark / photo / display: outside top 7/8 (max ΔY 14.9), right 7/8 (max ΔY 40.1), bottom 7/8 (max ΔY 111.3), left 4/8 (max ΔY 25.0); inner rim top +17.8 Y, bottom +13.2 Y.
- appkit-popup / dark / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim top +51.4 Y.
- appkit-popup / dark / photo / cgwindow: outside top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64; inner rim right +16.5 Y, bottom +23.8 Y, left +16.5 Y.
- combobox / dark / photo / display: outside top 7/8 (max ΔY 44.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim none ≥5 Y.
- combobox / dark / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim bottom +44.7 Y, left +11.5 Y.
- combobox / dark / photo / cgwindow: outside top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64; inner rim right +8.5 Y, bottom +8.5 Y, left +8.5 Y.
- context / dark / photo / display: outside top 5/8 (max ΔY 45.2), right 6/8 (max ΔY 62.6), bottom 7/8 (max ΔY 67.6), left 6/8 (max ΔY 150.8); inner rim top +14.4 Y, bottom +18.8 Y.
- context / dark / photo / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim bottom +18.6 Y.
- context / dark / photo / cgwindow: outside top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 77, left 8 px, α−1 63; inner rim top +24.8 Y, right +16.5 Y, bottom +23.8 Y, left +16.5 Y.
- appkit-popup / dark / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim bottom +12.2 Y.
- appkit-popup / dark / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- appkit-popup / dark / plain / cgwindow: outside top 6 px, α−1 218, right 8 px, α−1 221, bottom 8 px, α−1 223, left 8 px, α−1 221; inner rim right +9.8 Y, bottom +19.0 Y, left +9.8 Y.
- appkit-pulldown / dark / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim top +16.2 Y, bottom +13.0 Y.
- appkit-pulldown / dark / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- appkit-pulldown / dark / plain / cgwindow: outside top 6 px, α−1 218, right 8 px, α−1 221, bottom 8 px, α−1 223, left 8 px, α−1 221; inner rim top +20.0 Y, right +9.8 Y, bottom +19.0 Y, left +9.8 Y.
- combobox / dark / plain / display: outside top 7/8 (max ΔY 44.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim none ≥5 Y.
- combobox / dark / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- combobox / dark / plain / cgwindow: outside top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64; inner rim right +8.5 Y, bottom +8.5 Y, left +8.5 Y.
- context / dark / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim top +13.5 Y, bottom +13.0 Y.
- context / dark / plain / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- context / dark / plain / cgwindow: outside top 6 px, α−1 218, right 8 px, α−1 221, bottom 8 px, α−1 222, left 8 px, α−1 221; inner rim top +20.0 Y, right +9.8 Y, bottom +19.0 Y, left +9.8 Y.
- swiftui-menu / dark / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim top +11.5 Y, bottom +9.0 Y.
- swiftui-menu / dark / plain / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- swiftui-menu / dark / plain / cgwindow: outside top 6 px, α−1 52, right 8 px, α−1 63, bottom 8 px, α−1 76, left 8 px, α−1 64; inner rim top +24.8 Y, right +16.5 Y, bottom +23.8 Y, left +16.5 Y.
- swiftui-picker / dark / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim bottom +13.0 Y.
- swiftui-picker / dark / plain / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- swiftui-picker / dark / plain / cgwindow: outside top 6 px, α−1 218, right 8 px, α−1 219, bottom 8 px, α−1 223, left 8 px, α−1 221; inner rim top +20.0 Y, right +9.8 Y, bottom +19.0 Y, left +9.8 Y.
- appkit-popup / dark-contrast / photo / display: outside top 7/8 (max ΔY 14.9), right 7/8 (max ΔY 40.1), bottom 7/8 (max ΔY 111.3), left 4/8 (max ΔY 25.0); inner rim bottom +13.5 Y.
- appkit-popup / dark-contrast / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim top +51.4 Y.
- appkit-popup / dark-contrast / photo / cgwindow: outside top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64; inner rim right +16.7 Y, bottom +23.8 Y, left +16.7 Y.
- appkit-pulldown / dark-contrast / photo / display: outside top 7/8 (max ΔY 52.1), right 5/8 (max ΔY 56.9), bottom 7/8 (max ΔY 104.0), left 7/8 (max ΔY 68.5); inner rim top +14.0 Y, bottom +14.5 Y.
- appkit-pulldown / dark-contrast / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim left +68.1 Y.
- appkit-pulldown / dark-contrast / photo / cgwindow: outside top 6 px, α−1 50, right 8 px, α−1 63, bottom 8 px, α−1 77, left 8 px, α−1 64; inner rim top +24.2 Y, right +16.0 Y, bottom +23.8 Y, left +16.0 Y.
- combobox / dark-contrast / photo / display: outside top 7/8 (max ΔY 184.5), right 6/8 (max ΔY 43.4), bottom 7/8 (max ΔY 181.3), left 7/8 (max ΔY 61.6); inner rim none ≥5 Y.
- combobox / dark-contrast / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim left +68.1 Y.
- combobox / dark-contrast / photo / cgwindow: outside top 6 px, α−1 48, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59; inner rim top +11.2 Y, right +29.8 Y, bottom +29.8 Y, left +29.8 Y.
- context / dark-contrast / photo / display: outside top 5/8 (max ΔY 45.2), right 6/8 (max ΔY 62.6), bottom 7/8 (max ΔY 67.6), left 6/8 (max ΔY 150.8); inner rim top +14.3 Y, bottom +14.4 Y.
- context / dark-contrast / photo / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim bottom +18.6 Y.
- context / dark-contrast / photo / cgwindow: outside top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 77, left 8 px, α−1 63; inner rim top +23.8 Y, right +16.7 Y, bottom +23.8 Y, left +16.7 Y.
- submenu / dark-contrast / photo / display: outside top 7/8 (max ΔY 14.9), right 0/8 (max ΔY 1.6), bottom 7/8 (max ΔY 111.3), left 4/8 (max ΔY 25.0); inner rim bottom +13.5 Y.
- submenu / dark-contrast / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim top +51.4 Y.
- submenu / dark-contrast / photo / cgwindow: outside top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64; inner rim right +16.7 Y, bottom +23.8 Y, left +16.7 Y.
- submenu / dark-contrast / photo / display: outside top 6/8 (max ΔY 160.7), right 7/8 (max ΔY 77.6), bottom 7/8 (max ΔY 98.5), left 0/8 (max ΔY 0.3); inner rim top +14.9 Y, bottom +12.6 Y.
- submenu / dark-contrast / photo / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim right +29.7 Y, bottom +8.8 Y, left +14.6 Y.
- submenu / dark-contrast / photo / cgwindow: outside top 6 px, α−1 52, right 8 px, α−1 63, bottom 8 px, α−1 76, left 8 px, α−1 64; inner rim top +24.2 Y, right +16.0 Y, bottom +23.8 Y, left +16.0 Y.
- appkit-popup / dark-contrast / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim bottom +13.8 Y.
- appkit-popup / dark-contrast / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- appkit-popup / dark-contrast / plain / cgwindow: outside top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64; inner rim right +16.7 Y, bottom +23.8 Y, left +16.7 Y.
- appkit-pulldown / dark-contrast / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim top +15.2 Y, bottom +14.0 Y.
- appkit-pulldown / dark-contrast / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- appkit-pulldown / dark-contrast / plain / cgwindow: outside top 6 px, α−1 50, right 8 px, α−1 63, bottom 8 px, α−1 77, left 8 px, α−1 64; inner rim top +24.2 Y, right +16.0 Y, bottom +23.8 Y, left +16.0 Y.
- combobox / dark-contrast / plain / display: outside top 7/8 (max ΔY 38.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim none ≥5 Y.
- combobox / dark-contrast / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- combobox / dark-contrast / plain / cgwindow: outside top 6 px, α−1 48, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59; inner rim top +11.2 Y, right +29.8 Y, bottom +29.8 Y, left +29.8 Y.
- context / dark-contrast / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim top +14.8 Y, bottom +14.0 Y.
- context / dark-contrast / plain / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- context / dark-contrast / plain / cgwindow: outside top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 77, left 8 px, α−1 63; inner rim top +23.8 Y, right +16.7 Y, bottom +23.8 Y, left +16.7 Y.
- submenu / dark-contrast / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim bottom +13.8 Y.
- submenu / dark-contrast / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- submenu / dark-contrast / plain / cgwindow: outside top 6 px, α−1 51, right 8 px, α−1 64, bottom 8 px, α−1 76, left 8 px, α−1 64; inner rim right +16.7 Y, bottom +23.8 Y, left +16.7 Y.
- appkit-popup / light / photo / display: outside top 7/8 (max ΔY 14.9), right 7/8 (max ΔY 40.1), bottom 7/8 (max ΔY 111.3), left 4/8 (max ΔY 25.0); inner rim top +95.5 Y, bottom +13.1 Y.
- appkit-popup / light / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim left +28.0 Y.
- appkit-popup / light / photo / cgwindow: outside top 5 px, α−1 50, right 8 px, α−1 62, bottom 8 px, α−1 72, left 8 px, α−1 62; inner rim top +50.5 Y, right +15.2 Y, bottom +22.0 Y, left +15.2 Y.
- appkit-pulldown / light / photo / display: outside top 7/8 (max ΔY 52.1), right 5/8 (max ΔY 56.9), bottom 7/8 (max ΔY 104.0), left 7/8 (max ΔY 68.5); inner rim top +9.3 Y, bottom +13.7 Y.
- appkit-pulldown / light / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim bottom +40.5 Y, left +11.5 Y.
- appkit-pulldown / light / photo / cgwindow: outside top 6 px, α−1 50, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62; inner rim top +24.2 Y, right +15.0 Y, bottom +21.8 Y, left +15.0 Y.
- combobox / light / photo / display: outside top 7/8 (max ΔY 165.4), right 6/8 (max ΔY 43.4), bottom 7/8 (max ΔY 181.3), left 7/8 (max ΔY 61.6); inner rim top +115.0 Y.
- combobox / light / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim bottom +44.7 Y, left +11.5 Y.
- combobox / light / photo / cgwindow: outside top 6 px, α−1 51, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62; inner rim top +133.4 Y.
- context / light / photo / display: outside top 5/8 (max ΔY 45.2), right 6/8 (max ΔY 62.6), bottom 7/8 (max ΔY 67.6), left 6/8 (max ΔY 150.8); inner rim top +9.7 Y, bottom +12.9 Y.
- context / light / photo / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- context / light / photo / cgwindow: outside top 6 px, α−1 50, right 8 px, α−1 62, bottom 8 px, α−1 72, left 8 px, α−1 61; inner rim top +24.2 Y, right +14.8 Y, bottom +21.8 Y, left +14.8 Y.
- submenu / light / photo / display: outside top 7/8 (max ΔY 14.9), right 7/8 (max ΔY 40.1), bottom 7/8 (max ΔY 111.3), left 4/8 (max ΔY 25.0); inner rim top +95.5 Y, bottom +13.1 Y.
- submenu / light / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim left +28.0 Y.
- submenu / light / photo / cgwindow: outside top 5 px, α−1 50, right 8 px, α−1 62, bottom 8 px, α−1 72, left 8 px, α−1 62; inner rim top +50.5 Y, right +15.2 Y, bottom +22.0 Y, left +15.2 Y.
- swiftui-menu / light / photo / display: outside top 7/8 (max ΔY 82.0), right 3/8 (max ΔY 79.8), bottom 7/8 (max ΔY 62.7), left 6/8 (max ΔY 41.1); inner rim top +9.0 Y.
- swiftui-menu / light / photo / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim top +13.2 Y, right +41.7 Y, left +11.5 Y.
- swiftui-menu / light / photo / cgwindow: outside top 5 px, α−1 51, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62; inner rim top +24.2 Y, right +15.0 Y, bottom +21.8 Y, left +15.0 Y.
- swiftui-picker / light / photo / display: outside top 6/8 (max ΔY 24.9), right 7/8 (max ΔY 53.3), bottom 5/8 (max ΔY 70.6), left 7/8 (max ΔY 66.1); inner rim top +10.6 Y, bottom +13.7 Y.
- swiftui-picker / light / photo / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- swiftui-picker / light / photo / cgwindow: outside top 6 px, α−1 50, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62; inner rim top +24.2 Y, right +15.0 Y, bottom +21.8 Y, left +15.0 Y.
- appkit-popup / light / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim top +144.8 Y.
- appkit-popup / light / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- appkit-popup / light / plain / cgwindow: outside top 5 px, α−1 50, right 8 px, α−1 62, bottom 8 px, α−1 72, left 8 px, α−1 62; inner rim top +50.5 Y, right +15.2 Y, bottom +22.0 Y, left +15.2 Y.
- appkit-pulldown / light / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim none ≥5 Y.
- appkit-pulldown / light / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- appkit-pulldown / light / plain / cgwindow: outside top 6 px, α−1 50, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62; inner rim top +24.2 Y, right +15.0 Y, bottom +21.8 Y, left +15.0 Y.
- combobox / light / plain / display: outside top 1/8 (max ΔY 20.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim top +139.2 Y.
- combobox / light / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- combobox / light / plain / cgwindow: outside top 6 px, α−1 51, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62; inner rim top +133.4 Y.
- context / light / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim none ≥5 Y.
- context / light / plain / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- context / light / plain / cgwindow: outside top 6 px, α−1 50, right 8 px, α−1 62, bottom 8 px, α−1 72, left 8 px, α−1 61; inner rim top +24.2 Y, right +14.8 Y, bottom +21.8 Y, left +14.8 Y.
- submenu / light / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim top +144.8 Y.
- submenu / light / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- submenu / light / plain / cgwindow: outside top 5 px, α−1 50, right 8 px, α−1 62, bottom 8 px, α−1 72, left 8 px, α−1 62; inner rim top +50.5 Y, right +15.2 Y, bottom +22.0 Y, left +15.2 Y.
- swiftui-menu / light / plain / display: outside top 3/8 (max ΔY 42.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim none ≥5 Y.
- swiftui-menu / light / plain / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim bottom +10.4 Y.
- swiftui-menu / light / plain / cgwindow: outside top 5 px, α−1 51, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62; inner rim top +24.2 Y, right +15.0 Y, bottom +21.8 Y, left +15.0 Y.
- swiftui-picker / light / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim top +10.2 Y.
- swiftui-picker / light / plain / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- swiftui-picker / light / plain / cgwindow: outside top 6 px, α−1 50, right 8 px, α−1 61, bottom 8 px, α−1 72, left 8 px, α−1 62; inner rim top +24.2 Y, right +15.0 Y, bottom +21.8 Y, left +15.0 Y.
- appkit-pulldown / light-contrast / photo / display: outside top 7/8 (max ΔY 52.1), right 5/8 (max ΔY 56.9), bottom 7/8 (max ΔY 104.0), left 7/8 (max ΔY 68.5); inner rim top +8.4 Y, bottom +10.0 Y.
- appkit-pulldown / light-contrast / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim left +68.1 Y.
- appkit-pulldown / light-contrast / photo / cgwindow: outside top 6 px, α−1 47, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59; inner rim top +21.8 Y, right +17.0 Y, bottom +19.0 Y, left +17.0 Y.
- combobox / light-contrast / photo / display: outside top 7/8 (max ΔY 165.4), right 6/8 (max ΔY 43.4), bottom 7/8 (max ΔY 181.3), left 7/8 (max ΔY 61.6); inner rim top +151.1 Y.
- combobox / light-contrast / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim left +68.1 Y.
- combobox / light-contrast / photo / cgwindow: outside top 6 px, α−1 48, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59; inner rim top +173.3 Y.
- context / light-contrast / photo / display: outside top 5/8 (max ΔY 45.2), right 6/8 (max ΔY 62.6), bottom 7/8 (max ΔY 67.6), left 6/8 (max ΔY 150.8); inner rim top +9.2 Y, bottom +9.8 Y.
- context / light-contrast / photo / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim bottom +18.6 Y.
- context / light-contrast / photo / cgwindow: outside top 6 px, α−1 47, right 8 px, α−1 59, bottom 8 px, α−1 69, left 8 px, α−1 58; inner rim top +21.6 Y, right +16.5 Y, bottom +18.6 Y, left +16.5 Y.
- submenu / light-contrast / photo / display: outside top 7/8 (max ΔY 14.9), right 7/8 (max ΔY 40.1), bottom 7/8 (max ΔY 111.3), left 4/8 (max ΔY 25.0); inner rim top +162.0 Y, bottom +9.7 Y.
- submenu / light-contrast / photo / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim top +51.4 Y.
- submenu / light-contrast / photo / cgwindow: outside top 5 px, α−1 47, right 8 px, α−1 59, bottom 8 px, α−1 69, left 8 px, α−1 59; inner rim top +143.8 Y, right +16.2 Y, bottom +18.3 Y, left +16.2 Y.
- swiftui-menu / light-contrast / photo / display: outside top 5/8 (max ΔY 109.4), right 3/8 (max ΔY 79.8), bottom 7/8 (max ΔY 62.7), left 6/8 (max ΔY 41.1); inner rim top +8.2 Y.
- swiftui-menu / light-contrast / photo / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim right +8.6 Y, bottom +42.7 Y, left +68.1 Y.
- swiftui-menu / light-contrast / photo / cgwindow: outside top 5 px, α−1 48, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59; inner rim top +21.8 Y, right +17.0 Y, bottom +19.0 Y, left +17.0 Y.
- swiftui-picker / light-contrast / photo / display: outside top 6/8 (max ΔY 24.9), right 7/8 (max ΔY 53.3), bottom 5/8 (max ΔY 70.6), left 7/8 (max ΔY 66.1); inner rim top +11.2 Y, bottom +10.1 Y.
- swiftui-picker / light-contrast / photo / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim right +41.0 Y, left +7.5 Y.
- swiftui-picker / light-contrast / photo / cgwindow: outside top 6 px, α−1 47, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59; inner rim top +21.8 Y, right +17.0 Y, bottom +19.0 Y, left +17.0 Y.
- appkit-pulldown / light-contrast / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim none ≥5 Y.
- appkit-pulldown / light-contrast / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- appkit-pulldown / light-contrast / plain / cgwindow: outside top 6 px, α−1 47, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59; inner rim top +21.8 Y, right +17.0 Y, bottom +19.0 Y, left +17.0 Y.
- combobox / light-contrast / plain / display: outside top 7/8 (max ΔY 92.1), right 6/8 (max ΔY 43.4), bottom 7/8 (max ΔY 181.3), left 7/8 (max ΔY 61.6); inner rim top +50.6 Y, right +8.4 Y.
- combobox / light-contrast / plain / single-window: outside top 8 px, α−1 255, right 0 px, α−1 0, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- combobox / light-contrast / plain / cgwindow: outside top 6 px, α−1 48, right 8 px, α−1 58, bottom 8 px, α−1 69, left 8 px, α−1 59; inner rim top +173.3 Y.
- context / light-contrast / plain / display: outside top 0/8 (max ΔY 0.0), right 0/8 (max ΔY 0.0), bottom 0/8 (max ΔY 0.0), left 0/8 (max ΔY 0.0); inner rim none ≥5 Y.
- context / light-contrast / plain / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- context / light-contrast / plain / cgwindow: outside top 6 px, α−1 47, right 8 px, α−1 59, bottom 8 px, α−1 69, left 8 px, α−1 58; inner rim top +21.6 Y, right +16.5 Y, bottom +18.6 Y, left +16.5 Y.
- swiftui-picker / light-contrast / plain / display: outside top 5/8 (max ΔY 28.8), right 5/8 (max ΔY 36.6), bottom 3/8 (max ΔY 41.3), left 6/8 (max ΔY 97.4); inner rim top +7.7 Y, bottom +6.7 Y, left +10.8 Y.
- swiftui-picker / light-contrast / plain / single-window: outside top 8 px, α−1 255, right 8 px, α−1 255, bottom 8 px, α−1 255, left 8 px, α−1 255; inner rim none ≥5 Y.
- swiftui-picker / light-contrast / plain / cgwindow: outside top 4 px, α−1 34, right 7 px, α−1 41, bottom 8 px, α−1 49, left 8 px, α−1 42; inner rim top +21.8 Y, right +16.5 Y, bottom +19.0 Y, left +16.5 Y.

## Step 1: runner window-server effects

The display composites show whether the shadow survives in the desktop capture. The single-window and CG outputs retain alpha, so their exterior alpha values report the isolated window-server shadow.

Runner result: **yes** in isolated window captures (shadow alpha reaches at least 8 px, the profile limit); display composites have 0 exterior side samples with ≥6 Y variation from their −8 px sample. Treat the near-edge color and alpha values below as raw contour data; they do not identify the private renderer's line type.

- dark / black backdrop: display changed samples ≥6 Y=0/32; single-window: α≥8 reaches 8 px; α at −1 (top 239, right 243, bottom 247, left 243); cgwindow: α≥8 reaches 8 px; α at −1 (top 239, right 243, bottom 247, left 243)
- dark / white backdrop: display changed samples ≥6 Y=0/32; single-window: α≥8 reaches 8 px; α at −1 (top 239, right 243, bottom 247, left 243); cgwindow: α≥8 reaches 8 px; α at −1 (top 239, right 243, bottom 247, left 243)
- dark-contrast / black backdrop: display changed samples ≥6 Y=0/32; single-window: α≥8 reaches 8 px; α at −1 (top 58, right 107, bottom 159, left 108); cgwindow: α≥8 reaches 8 px; α at −1 (top 58, right 107, bottom 159, left 108)
- dark-contrast / white backdrop: display changed samples ≥6 Y=0/32; single-window: α≥8 reaches 8 px; α at −1 (top 58, right 107, bottom 159, left 108); cgwindow: α≥8 reaches 8 px; α at −1 (top 58, right 107, bottom 159, left 108)
- light / black backdrop: display changed samples ≥6 Y=0/32; single-window: α≥8 reaches 8 px; α at −1 (top 54, right 80, bottom 109, left 81); cgwindow: α≥8 reaches 8 px; α at −1 (top 54, right 80, bottom 109, left 81)
- light / white backdrop: display changed samples ≥6 Y=0/32; single-window: α≥8 reaches 8 px; α at −1 (top 52, right 78, bottom 108, left 79); cgwindow: α≥8 reaches 8 px; α at −1 (top 52, right 78, bottom 108, left 79)
- light-contrast / black backdrop: display changed samples ≥6 Y=0/32; single-window: α≥8 reaches 8 px; α at −1 (top 255, right 0, bottom 1, left 255); cgwindow: α≥8 reaches 8 px; α at −1 (top 1, right 54, bottom 255, left 55)
- light-contrast / white backdrop: display changed samples ≥6 Y=0/32; single-window: α≥8 reaches 8 px; α at −1 (top 255, right 0, bottom 1, left 255); cgwindow: α≥8 reaches 8 px; α at −1 (top 1, right 54, bottom 255, left 55)

## macos27-captures\out\menu-outline\menus\dark\photo\appkit-popup

Case: appkit-popup; appearance=dark; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 342×218; shape box=(56.00,56.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(59,50,29) (67,57,41) (73,63,50) (72,62,50) (70,62,49) (70,64,52) (70,65,55) (73,64,48) (185,133,78) (148,119,56) (144,117,56) (138,116,55) (133,114,56) (0,123,255) (0,123,255) (0,122,255) (0,122,255)`; luma: `50.4,58.0,64.2,63.3,62.8,64.4,65.3,64.8,140.1,120.6,118.3,116.3,113.9,106.4,106.4,105.7,105.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=14.9); edge at −1 RGB=(73,64,48), Y=64.8; composited; inner 0–3 px mean lift over 5–8 px=+17.8 Y.
- right: RGB distances −8..+8: `(248,214,56) (216,169,41) (227,190,45) (212,171,69) (243,196,102) (243,185,94) (238,215,163) (244,200,86) (129,94,30) (148,104,35) (137,102,34) (149,103,36) (151,102,33) (157,99,33) (163,97,34) (162,94,35) (165,96,35)`; luma: `209.8,169.8,187.4,172.4,199.2,190.8,216.1,201.1,96.8,108.4,104.5,107.9,107.4,106.6,106.5,104.2,106.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=40.1); edge at −1 RGB=(244,200,86), Y=201.1; composited; inner 0–3 px mean lift over 5–8 px=-1.5 Y.
- bottom: RGB distances −8..+8: `(54,60,14) (148,159,106) (156,168,131) (139,147,102) (158,173,130) (145,156,111) (110,114,51) (125,130,59) (136,139,73) (113,115,56) (110,111,55) (110,111,54) (108,110,53) (107,109,52) (105,106,48) (101,104,45) (102,104,44)`; luma: `55.4,152.8,162.8,142.1,166.7,150.4,108.6,123.8,133.6,110.3,106.7,106.7,105.5,104.5,101.6,99.1,99.2`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=111.3); edge at −1 RGB=(125,130,59), Y=123.8; composited; inner 0–3 px mean lift over 5–8 px=+13.2 Y.
- left: RGB distances −8..+8: `(34,48,3) (35,51,3) (57,76,4) (26,47,3) (22,41,1) (35,53,1) (54,76,5) (52,71,2) (83,94,53) (90,97,61) (96,101,70) (88,95,67) (96,104,72) (96,106,72) (92,104,70) (92,106,70) (96,109,75)`; luma: `41.8,44.1,66.8,39.4,34.1,45.4,66.2,62.0,88.7,92.9,97.7,91.5,100.0,101.4,99.0,100.4,103.8`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 4/8 ([-6, -4, -2, -1] px; max ΔY=25.0); edge at −1 RGB=(52,71,2), Y=62.0; composited; inner 0–3 px mean lift over 5–8 px=-8.5 Y.
**top-left 8×8 RGB:**

```text
(96,101,16) (43,46,11) (38,42,2) (32,37,0) (23,30,1) (29,35,3) (50,59,8) (94,96,8)
(93,101,26) (111,121,69) (111,122,73) (71,81,40) (32,41,4) (53,61,2) (90,96,19) (121,123,48)
(54,67,9) (45,59,19) (82,97,54) (135,151,114) (120,133,91) (107,110,48) (106,110,52) (106,110,53)
(59,75,17) (41,56,12) (35,48,3) (76,88,50) (119,121,69) (105,109,53) (105,110,53) (106,110,53)
(66,86,32) (55,71,23) (50,62,18) (113,115,59) (103,109,51) (104,109,52) (104,109,52) (104,109,51)
(84,104,71) (56,72,29) (88,92,44) (101,107,51) (102,107,51) (102,107,51) (102,107,50) (102,108,50)
(122,144,127) (64,75,38) (100,106,50) (100,107,51) (100,107,51) (100,107,50) (101,107,50) (59,113,136)
(68,79,44) (92,99,46) (99,106,50) (100,106,51) (99,106,50) (99,106,49) (57,113,137) (5,121,245)
```
**bottom-right 8×8 RGB:**

```text
(107,101,35) (108,101,34) (110,101,35) (114,102,36) (116,96,34) (128,96,34) (112,105,37) (96,109,18)
(108,102,36) (109,102,37) (113,104,38) (114,100,36) (126,95,35) (128,92,34) (96,104,31) (101,114,23)
(111,105,39) (112,104,39) (112,100,37) (119,96,35) (125,96,36) (119,117,47) (107,119,32) (92,104,24)
(112,104,40) (113,100,38) (120,97,37) (125,98,37) (125,107,47) (143,156,65) (130,141,44) (66,76,15)
(114,98,40) (124,97,39) (125,97,39) (122,108,47) (127,142,48) (149,161,55) (126,138,45) (51,61,14)
(123,98,41) (125,95,40) (109,109,43) (113,127,35) (138,153,50) (143,155,44) (85,95,27) (63,70,16)
(108,103,51) (84,92,23) (105,119,25) (129,143,45) (143,156,47) (115,126,36) (38,45,6) (67,76,7)
(62,71,3) (98,109,18) (121,133,33) (136,150,45) (135,148,41) (38,44,11) (28,36,2) (78,89,4)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 342×218; shape box=(56.00,52.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(143,88,45) (96,44,0) (72,34,5) (14,5,0) (75,51,31) (107,78,50) (124,89,56) (126,92,57) (136,91,58) (178,123,75) (216,142,73) (207,92,87) (186,80,138) (139,69,125) (122,57,114) (101,44,90) (87,65,76)`; luma: `96.6,51.9,40.0,6.6,54.7,82.1,94.1,96.7,98.2,131.2,152.8,116.1,106.7,87.9,74.9,59.4,70.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-7, -6, -5, -4, -3] px; max ΔY=90.0); edge at −1 RGB=(126,92,57), Y=96.7; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+51.4 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(104,98,50) (66,84,67) (72,86,51) (94,103,51) (140,136,76) (179,165,120) (131,125,100) (55,60,36) (38,47,15) (35,42,6) (100,93,67) (170,158,159) (129,126,103) (87,98,41) (108,109,66) (113,91,79) (125,101,78)`; luma: `95.8,78.9,80.5,97.3,132.5,164.7,124.5,57.2,42.8,37.9,92.6,160.6,125.0,91.5,105.7,94.8,104.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=68.9); edge at −1 RGB=(55,60,36), Y=57.2; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-15.6 Y.
- left: RGB distances −8..+8: `(241,143,216) (239,125,193) (241,122,194) (233,151,202) (206,93,135) (224,117,170) (231,131,191) (223,88,156) (229,68,147) (243,157,212) (241,171,218) (234,128,193) (232,124,190) (234,144,199) (237,171,207) (236,175,205) (239,175,210)`; luma: `169.1,154.1,152.5,172.1,120.1,143.6,156.6,121.6,107.9,179.3,189.3,155.2,151.7,167.1,187.6,190.1,191.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=49.0); edge at −1 RGB=(223,88,156), Y=121.6; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-26.1 Y.
**top-left 8×8 RGB:**

```text
(97,98,33) (126,145,87) (129,154,94) (109,132,76) (90,107,45) (80,94,28) (79,95,23) (104,115,28)
(118,93,18) (116,129,72) (123,148,95) (112,137,81) (105,126,62) (104,123,57) (110,125,59) (86,93,37)
(107,95,16) (107,115,50) (118,144,90) (110,137,82) (110,134,78) (100,117,71) (74,83,41) (46,50,11)
(187,117,2) (178,141,33) (152,155,75) (135,148,80) (88,95,44) (25,28,12) (11,13,0) (42,45,2)
(126,85,7) (135,93,12) (176,141,45) (163,143,52) (83,77,13) (29,33,0) (27,30,2) (69,69,6)
(23,19,7) (44,28,3) (125,93,23) (182,139,28) (114,98,16) (34,36,4) (24,27,3) (80,79,11)
(93,54,3) (105,70,13) (125,86,8) (160,101,0) (120,93,11) (46,47,10) (31,33,5) (65,63,12)
(161,96,1) (144,93,12) (121,91,16) (97,74,5) (61,59,4) (32,39,2) (31,34,2) (58,57,12)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 276×152; shape box=(23.00,19.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (112,112,112) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (0,123,255) (0,123,255) (0,122,255) (0,122,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,112.0,41.0,37.0,35.0,34.0,106.4,106.4,105.7,105.7`; alpha: `5,7,9,11,13,16,19,51,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=-49.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (99,99,99) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,99.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `13,15,19,23,25,29,33,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.5 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (112,112,112) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (33,33,33) (33,33,33) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,112.0,41.0,37.0,35.0,34.0,33.0,33.0,32.0,32.0`; alpha: `25,30,33,37,41,44,48,76,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=76; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (99,99,99) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,99.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `13,15,20,22,26,29,32,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (115,115,115) (102,102,102)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (98,98,98) (102,102,102) (55,55,55) (40,40,40)
(0,0,0) (0,0,0) (0,0,0) (101,101,101) (84,84,84) (45,45,45) (33,33,33) (33,33,33)
(0,0,0) (0,0,0) (95,95,95) (83,83,83) (43,43,43) (33,33,33) (33,33,33) (33,33,33)
(0,0,0) (56,56,56) (101,101,101) (44,44,44) (32,32,32) (32,32,32) (33,33,33) (33,33,33)
(0,0,0) (110,110,110) (54,54,54) (32,32,32) (32,32,32) (32,32,32) (31,31,31) (18,70,126)
(34,34,34) (101,101,101) (39,39,39) (32,32,32) (31,31,31) (31,31,31) (18,70,126) (1,120,250)
```
**bottom-right 8×8 RGB:**

```text
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (38,38,38) (100,100,100) (30,30,30)
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (53,53,53) (104,104,104) (0,0,0)
(33,33,33) (32,32,32) (31,31,31) (31,31,31) (44,44,44) (99,99,99) (48,48,48) (0,0,0)
(33,33,33) (32,32,32) (32,32,32) (42,42,42) (83,83,83) (86,86,86) (0,0,0) (0,0,0)
(33,33,33) (32,32,32) (44,44,44) (84,84,84) (94,94,94) (0,0,0) (0,0,0) (0,0,0)
(39,39,39) (54,54,54) (100,100,100) (85,85,85) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(101,101,101) (105,105,105) (48,48,48) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(28,28,28) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark\photo\appkit-pulldown

Case: appkit-pulldown; appearance=dark; background=photo; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

## macos27-captures\out\menu-outline\menus\dark\photo\combobox

Case: combobox; appearance=dark; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 349×194; shape box=(56.00,56.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(211,211,211) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `211.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=44.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 349×194; shape box=(56.00,52.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(184,150,119) (187,153,122) (194,154,120) (168,126,92) (120,89,63) (161,120,101) (154,95,89) (93,16,24) (136,45,52) (144,92,70) (137,46,57) (126,36,47) (127,60,42) (169,108,96) (155,130,74) (133,125,44) (157,149,34)`; luma: `155.0,158.0,160.0,132.5,93.7,127.3,107.1,32.9,64.9,101.5,66.1,55.9,72.9,120.1,131.3,120.9,142.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-5, -4, -3, -2, -1] px; max ΔY=122.0); edge at −1 RGB=(93,16,24), Y=32.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-56.6 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(32,30,24) (33,32,28) (46,44,39) (69,66,61) (70,69,64) (74,75,69) (107,107,100) (136,135,128) (134,131,119) (157,154,130) (150,148,127) (111,113,83) (83,94,15) (72,87,9) (79,97,33) (90,113,45) (80,102,30)`; luma: `30.0,31.9,44.1,66.3,68.9,74.4,106.5,134.7,130.8,152.9,146.9,110.4,86.0,78.2,88.6,103.2,92.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=104.7); edge at −1 RGB=(136,135,128), Y=134.7; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+44.7 Y.
- left: RGB distances −8..+8: `(234,162,214) (235,183,222) (239,211,231) (224,152,172) (223,116,152) (239,166,206) (219,146,188) (224,126,177) (234,135,184) (236,147,194) (236,149,201) (229,138,186) (225,143,178) (228,173,199) (231,182,217) (180,135,166) (94,87,59)`; luma: `181.1,196.9,218.4,168.8,141.3,184.4,164.6,150.5,159.6,169.3,171.3,160.8,163.0,186.6,194.9,146.8,86.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -2, -1] px; max ΔY=39.7); edge at −1 RGB=(224,126,177), Y=150.5; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+11.5 Y.
**top-left 8×8 RGB:**

```text
(93,100,21) (80,83,18) (71,71,14) (66,67,19) (32,35,10) (16,17,2) (42,43,4) (89,96,28)
(87,93,23) (91,90,21) (89,85,18) (39,39,9) (1,3,0) (3,5,0) (17,18,1) (66,71,11)
(100,112,40) (111,112,33) (88,82,16) (56,50,7) (44,41,5) (37,42,3) (29,37,3) (29,36,1)
(123,134,63) (99,98,38) (49,47,11) (37,32,6) (71,62,12) (80,83,7) (67,79,8) (54,63,10)
(124,121,56) (51,48,22) (19,19,4) (54,47,2) (87,78,17) (86,90,21) (74,86,14) (76,87,18)
(98,83,31) (64,56,21) (48,42,8) (40,33,4) (40,41,12) (81,91,40) (100,113,48) (86,99,39)
(122,104,48) (84,74,32) (37,38,7) (19,23,2) (16,21,0) (59,68,30) (107,121,65) (106,122,64)
(92,87,42) (34,35,16) (6,13,2) (12,17,7) (9,11,3) (38,43,23) (103,116,65) (123,141,80)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 283×128; shape box=(23.00,19.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (119,119,119) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (0,122,255) (0,122,255) (0,122,255) (0,122,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,119.0,85.0,85.0,85.0,85.0,105.7,105.7,105.7,105.7`; alpha: `6,7,10,10,14,16,19,51,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=-12.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (119,119,119) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,119.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0`; alpha: `14,16,19,22,26,29,32,64,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+8.5 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (119,119,119) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,119.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0`; alpha: `25,29,33,37,40,45,49,76,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=76; inner 0–3 px mean lift over 5–8 px=+8.5 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (119,119,119) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,119.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0`; alpha: `14,16,19,22,26,29,33,64,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+8.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (75,75,75) (112,112,112)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (42,42,42) (104,104,104) (110,110,110) (99,99,99)
(0,0,0) (0,0,0) (0,0,0) (47,47,47) (109,109,109) (105,105,105) (90,90,90) (85,85,85)
(0,0,0) (0,0,0) (41,41,41) (109,109,109) (102,102,102) (86,86,86) (85,85,85) (85,85,85)
(0,0,0) (0,0,0) (104,104,104) (105,105,105) (86,86,86) (85,85,85) (85,85,85) (85,85,85)
(0,0,0) (72,72,72) (110,110,110) (90,90,90) (85,85,85) (85,85,85) (85,85,85) (74,90,107)
(0,0,0) (112,112,112) (99,99,99) (85,85,85) (85,85,85) (85,85,85) (74,90,107) (28,110,198)
```
**bottom-right 8×8 RGB:**

```text
(85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (99,99,99) (108,108,108) (0,0,0)
(85,85,85) (85,85,85) (85,85,85) (85,85,85) (90,90,90) (110,110,110) (68,68,68) (0,0,0)
(85,85,85) (85,85,85) (85,85,85) (85,85,85) (105,105,105) (101,101,101) (0,0,0) (0,0,0)
(85,85,85) (85,85,85) (86,86,86) (102,102,102) (107,107,107) (32,32,32) (0,0,0) (0,0,0)
(85,85,85) (90,90,90) (105,105,105) (109,109,109) (45,45,45) (0,0,0) (0,0,0) (0,0,0)
(99,99,99) (111,111,111) (99,99,99) (32,32,32) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(106,106,106) (64,64,64) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark\photo\context

Case: context; appearance=dark; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 212×205; shape box=(56.00,56.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(175,118,117) (133,74,51) (230,131,63) (190,89,27) (152,83,31) (188,123,60) (190,126,71) (165,100,53) (194,124,79) (140,103,46) (138,103,42) (141,100,40) (146,95,36) (158,87,35) (172,83,34) (178,82,34) (177,83,34)`; luma: `130.0,84.9,147.1,106.0,93.9,132.3,135.6,110.4,135.6,106.8,106.0,104.4,101.6,98.3,98.4,98.9,99.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-7, -6, -5, -4, -1] px; max ΔY=45.2); edge at −1 RGB=(165,100,53), Y=110.4; composited; inner 0–3 px mean lift over 5–8 px=+14.4 Y.
- right: RGB distances −8..+8: `(246,166,16) (240,161,3) (252,215,22) (214,157,40) (235,156,25) (249,140,10) (207,90,17) (213,106,20) (168,101,22) (159,97,24) (153,101,26) (155,99,25) (151,103,22) (160,103,21) (170,102,21) (169,106,20) (169,107,21)`; luma: `172.2,166.4,208.9,160.7,163.3,153.8,109.6,122.5,109.5,104.9,106.6,105.6,107.4,109.2,110.6,113.2,114.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=62.6); edge at −1 RGB=(213,106,20), Y=122.5; composited; inner 0–3 px mean lift over 5–8 px=-5.1 Y.
- bottom: RGB distances −8..+8: `(80,73,71) (16,13,11) (7,7,3) (10,10,4) (10,10,4) (10,9,3) (10,9,4) (8,9,3) (159,118,106) (120,84,76) (111,81,61) (100,81,52) (98,85,47) (92,80,47) (87,76,45) (86,77,43) (87,79,42)`; luma: `74.3,13.5,6.7,9.6,9.6,8.8,8.9,8.4,125.9,91.1,85.9,82.9,85.0,80.2,76.1,76.5,78.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=67.6); edge at −1 RGB=(8,9,3), Y=8.4; composited; inner 0–3 px mean lift over 5–8 px=+18.8 Y.
- left: RGB distances −8..+8: `(85,89,16) (77,80,19) (82,79,21) (96,92,26) (108,106,31) (144,141,109) (229,235,234) (208,193,155) (128,100,67) (148,102,81) (137,117,72) (136,120,78) (140,114,80) (140,115,80) (138,119,79) (138,119,79) (139,119,79)`; luma: `82.9,75.0,75.5,88.1,101.0,139.3,233.7,193.4,103.6,110.3,118.0,120.4,117.1,117.8,120.2,120.2,120.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=150.8); edge at −1 RGB=(208,193,155), Y=193.4; composited; inner 0–3 px mean lift over 5–8 px=-6.6 Y.
**top-left 8×8 RGB:**

```text
(142,130,113) (152,142,111) (179,124,83) (208,142,108) (159,132,123) (156,141,134) (141,129,120) (121,112,107)
(134,121,90) (151,146,104) (159,120,61) (211,122,40) (175,121,82) (157,139,127) (140,124,112) (148,113,93)
(122,112,56) (166,162,102) (145,144,101) (152,117,41) (162,123,54) (154,119,84) (127,101,60) (121,100,57)
(132,137,55) (181,170,108) (172,173,140) (133,131,83) (142,112,66) (122,102,59) (118,101,57) (116,101,56)
(140,138,56) (191,170,102) (178,165,128) (139,112,72) (121,102,58) (117,102,57) (125,111,64) (130,114,67)
(154,139,65) (207,150,85) (156,116,81) (121,101,58) (116,102,57) (127,113,68) (133,114,70) (132,113,66)
(189,142,84) (200,122,70) (124,102,60) (117,102,58) (127,114,69) (133,114,71) (132,114,67) (134,113,68)
(219,142,88) (164,101,63) (120,102,58) (120,106,61) (135,115,72) (131,115,68) (133,114,68) (134,113,63)
```
**bottom-right 8×8 RGB:**

```text
(113,112,51) (116,111,55) (115,111,55) (111,111,52) (113,110,55) (113,110,52) (98,99,45) (72,85,4)
(115,112,55) (113,111,55) (112,111,55) (109,111,53) (112,111,54) (105,106,48) (66,75,11) (64,77,0)
(112,112,55) (111,112,55) (109,112,55) (113,111,57) (110,111,54) (83,85,52) (81,83,51) (102,106,70)
(111,113,56) (111,113,56) (113,113,58) (113,113,55) (110,113,69) (121,126,133) (118,122,133) (115,119,131)
(114,113,62) (111,114,58) (111,113,58) (112,112,70) (99,94,84) (95,91,85) (86,83,76) (90,88,83)
(112,114,59) (107,109,56) (138,135,109) (160,155,146) (156,152,148) (146,142,140) (132,128,125) (120,118,117)
(132,131,104) (148,145,138) (169,167,167) (169,168,167) (154,155,156) (138,137,140) (129,129,131) (120,120,121)
(164,159,160) (166,163,163) (169,168,169) (146,145,147) (142,143,146) (137,138,141) (131,133,134) (107,109,110)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 212×205; shape box=(56.00,52.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(163,140,72) (160,136,59) (159,140,33) (136,126,13) (100,96,3) (84,82,3) (111,106,8) (104,98,10) (97,92,14) (95,91,18) (46,47,2) (137,94,41) (215,107,52) (226,126,73) (200,120,69) (188,105,88) (232,76,119)`; luma: `140.0,135.5,136.3,120.0,90.1,76.7,100.0,92.9,87.4,86.6,43.5,99.3,126.0,143.4,133.3,121.4,112.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-5, -4, -3, -2, -1] px; max ΔY=63.3); edge at −1 RGB=(104,98,10), Y=92.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-48.4 Y.
- right: RGB distances −8..+8: `(83,60,38) (159,110,74) (173,121,82) (170,122,85) (156,111,78) (141,100,74) (113,75,51) (77,40,20) (140,63,83) (237,117,182) (238,76,148) (186,34,70) (174,98,49) (199,174,143) (248,221,219) (206,133,148) (188,109,88)`; luma: `63.3,117.8,129.2,129.5,118.2,106.8,81.3,46.4,80.8,147.2,115.6,68.9,110.6,177.1,226.6,149.6,124.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=66.2); edge at −1 RGB=(77,40,20), Y=46.4; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-66.2 Y.
- bottom: RGB distances −8..+8: `(9,10,2) (49,48,19) (39,25,10) (35,31,5) (45,44,10) (38,33,13) (42,48,15) (60,80,27) (27,37,4) (38,47,19) (107,120,60) (104,117,67) (52,58,40) (33,41,9) (24,38,3) (38,41,8) (114,120,97)`; luma: `9.2,46.1,26.9,30.0,41.8,32.6,44.3,71.9,32.5,43.1,112.9,110.6,55.4,37.0,32.5,38.0,117.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=62.7); edge at −1 RGB=(60,80,27), Y=71.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+18.6 Y.
- left: RGB distances −8..+8: `(21,27,12) (49,57,29) (15,18,10) (2,2,2) (3,5,3) (3,5,3) (8,11,7) (19,28,16) (37,48,53) (81,99,157) (84,95,150) (112,117,145) (140,139,125) (151,153,144) (146,149,164) (184,193,208) (171,191,234)`; luma: `24.6,53.3,16.8,2.0,4.4,4.4,10.1,25.2,46.0,99.4,96.6,118.0,138.2,151.9,149.4,192.2,189.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -3, -2] px; max ΔY=28.6); edge at −1 RGB=(19,28,16), Y=25.2; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-80.9 Y.
**top-left 8×8 RGB:**

```text
(46,40,4) (42,43,12) (94,106,47) (93,106,42) (85,98,36) (75,91,27) (9,11,3) (17,19,46)
(14,19,2) (13,18,2) (75,85,42) (121,138,75) (91,108,52) (83,100,45) (33,38,19) (11,11,30)
(21,27,13) (22,26,14) (44,50,27) (130,146,88) (110,128,75) (92,109,61) (61,73,39) (27,32,69)
(25,29,13) (30,36,20) (22,26,13) (64,74,44) (121,139,83) (107,127,69) (69,82,53) (58,57,100)
(18,22,8) (26,33,16) (32,42,24) (14,22,0) (55,65,34) (118,139,72) (54,65,26) (29,32,28)
(10,13,1) (13,20,7) (43,54,35) (25,35,7) (11,17,4) (93,102,58) (94,98,57) (56,59,46)
(21,23,10) (10,18,4) (13,21,0) (23,32,1) (12,15,3) (102,103,66) (79,81,50) (48,54,44)
(101,94,84) (84,80,72) (71,70,61) (75,76,63) (84,84,61) (117,119,89) (75,75,62) (50,52,42)
```
**bottom-right 8×8 RGB:**

```text
(119,114,106) (117,114,114) (113,109,110) (86,82,82) (60,62,66) (68,71,78) (79,81,90) (93,95,103)
(128,119,114) (113,104,100) (112,103,101) (123,115,117) (138,123,116) (131,120,113) (103,99,98) (84,84,89)
(118,109,112) (120,110,112) (127,118,120) (128,120,123) (139,130,131) (141,133,134) (137,130,133) (134,126,128)
(125,119,124) (114,110,114) (111,108,112) (113,108,111) (106,102,107) (105,102,107) (108,106,111) (116,113,118)
(95,93,99) (99,97,103) (105,102,108) (108,104,110) (102,99,106) (104,101,105) (97,95,101) (110,109,118)
(99,96,100) (93,91,96) (99,96,103) (107,104,109) (103,102,108) (104,104,109) (106,105,114) (140,136,145)
(102,100,105) (99,96,104) (104,101,109) (110,109,117) (132,133,142) (152,147,153) (123,115,108) (110,106,106)
(100,93,92) (93,87,88) (119,116,121) (147,144,151) (161,152,155) (152,139,140) (162,150,149) (140,132,131)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 146×139; shape box=(23.00,19.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (112,112,112) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (32,32,32) (32,32,32) (31,31,31) (31,31,31)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,112.0,41.0,37.0,35.0,34.0,32.0,32.0,31.0,31.0`; alpha: `6,7,10,12,14,16,19,51,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=+24.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (99,99,99) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,99.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `14,15,19,22,26,30,33,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.5 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (112,112,112) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (33,33,33) (33,33,33) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,112.0,41.0,37.0,35.0,34.0,33.0,33.0,32.0,32.0`; alpha: `25,28,33,37,41,44,48,77,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=77; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (99,99,99) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,99.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `13,17,19,22,26,29,33,63,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=63; inner 0–3 px mean lift over 5–8 px=+16.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (115,115,115) (102,102,102)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (98,98,98) (102,102,102) (55,55,55) (41,41,41)
(0,0,0) (0,0,0) (0,0,0) (103,103,103) (84,84,84) (45,45,45) (33,33,33) (33,33,33)
(0,0,0) (0,0,0) (97,97,97) (83,83,83) (43,43,43) (33,33,33) (33,33,33) (33,33,33)
(0,0,0) (56,56,56) (101,101,101) (44,44,44) (32,32,32) (32,32,32) (33,33,33) (33,33,33)
(0,0,0) (110,110,110) (54,54,54) (32,32,32) (32,32,32) (32,32,32) (31,31,31) (31,31,31)
(34,34,34) (101,101,101) (39,39,39) (32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31)
```
**bottom-right 8×8 RGB:**

```text
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (39,39,39) (97,97,97) (34,34,34)
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (53,53,53) (104,104,104) (0,0,0)
(33,33,33) (32,32,32) (32,32,32) (31,31,31) (44,44,44) (97,97,97) (49,49,49) (0,0,0)
(33,33,33) (32,32,32) (32,32,32) (42,42,42) (82,82,82) (81,81,81) (0,0,0) (0,0,0)
(33,33,33) (32,32,32) (45,45,45) (84,84,84) (94,94,94) (0,0,0) (0,0,0) (0,0,0)
(40,40,40) (54,54,54) (102,102,102) (82,82,82) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(101,101,101) (106,106,106) (47,47,47) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(28,28,28) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark\photo\submenu

Case: submenu; appearance=dark; background=photo; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

Nested submenu result: no parent popup window appeared during the recorded attempts.

## macos27-captures\out\menu-outline\menus\dark\photo\swiftui-menu

Case: swiftui-menu; appearance=dark; background=photo; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

## macos27-captures\out\menu-outline\menus\dark\photo\swiftui-picker

Case: swiftui-picker; appearance=dark; background=photo; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

## macos27-captures\out\menu-outline\menus\dark\plain\appkit-popup

Case: appkit-popup; appearance=dark; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 342×218; shape box=(56.00,56.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (99,99,99) (72,72,72) (70,70,70) (68,68,68) (67,67,67) (0,123,255) (0,123,255) (0,122,255) (0,122,255)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,99.0,72.0,70.0,68.0,67.0,106.4,106.4,105.7,105.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=-28.8 Y.
- right: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (58,58,58) (58,58,58) (58,58,58) (59,59,59) (59,59,59) (59,59,59) (59,59,59) (59,59,59) (59,59,59)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,58.0,58.0,58.0,59.0,59.0,59.0,59.0,59.0,59.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=-0.7 Y.
- bottom: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (95,95,95) (65,65,65) (62,62,62) (60,60,60) (59,59,59) (58,58,58) (59,59,59) (58,58,58) (58,58,58)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,95.0,65.0,62.0,60.0,59.0,58.0,59.0,58.0,58.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=+12.2 Y.
- left: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (57,57,57) (57,57,57) (57,57,57) (57,57,57) (57,57,57) (58,58,58) (58,58,58) (58,58,58) (58,58,58)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,57.0,57.0,57.0,57.0,57.0,58.0,58.0,58.0,58.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=-1.0 Y.
**top-left 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (39,39,39) (62,62,62)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (33,33,33) (57,57,57) (64,64,64) (64,64,64)
(30,30,30) (30,30,30) (30,30,30) (34,34,34) (63,63,63) (64,64,64) (64,64,64) (65,65,65)
(30,30,30) (30,30,30) (33,33,33) (66,66,66) (64,64,64) (65,65,65) (64,64,64) (64,64,64)
(30,30,30) (30,30,30) (53,53,53) (63,63,63) (63,63,63) (63,63,63) (63,63,63) (63,63,63)
(30,30,30) (37,37,37) (63,63,63) (63,63,63) (63,63,63) (62,62,62) (62,62,62) (36,87,143)
(30,30,30) (56,56,56) (63,63,63) (63,63,63) (62,62,62) (62,62,62) (36,88,145) (3,119,246)
```
**bottom-right 8×8 RGB:**

```text
(57,57,57) (57,57,57) (57,57,57) (57,57,57) (57,57,57) (57,57,57) (53,53,53) (30,30,30)
(57,57,57) (57,57,57) (57,57,57) (57,57,57) (57,57,57) (57,57,57) (36,36,36) (30,30,30)
(57,57,57) (57,57,57) (57,57,57) (57,57,57) (57,57,57) (49,49,49) (30,30,30) (30,30,30)
(58,58,58) (58,58,58) (58,58,58) (58,58,58) (64,64,64) (32,32,32) (30,30,30) (30,30,30)
(58,58,58) (58,58,58) (58,58,58) (61,61,61) (34,34,34) (30,30,30) (30,30,30) (30,30,30)
(58,58,58) (58,58,58) (54,54,54) (33,33,33) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(59,59,59) (38,38,38) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 342×218; shape box=(56.00,52.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 276×152; shape box=(23.00,19.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (93,93,93) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (0,123,255) (0,123,255) (0,122,255) (0,122,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,93.0,41.0,37.0,35.0,34.0,106.4,106.4,105.7,105.7`; alpha: `5,7,9,11,13,16,22,218,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=218; inner 0–3 px mean lift over 5–8 px=-54.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (72,72,72) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,72.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `13,15,19,23,25,29,36,221,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=221; inner 0–3 px mean lift over 5–8 px=+9.8 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (93,93,93) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (33,33,33) (33,33,33) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,93.0,41.0,37.0,35.0,34.0,33.0,33.0,32.0,32.0`; alpha: `25,30,33,37,41,44,51,223,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=223; inner 0–3 px mean lift over 5–8 px=+19.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (72,72,72) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,72.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `13,15,20,22,26,29,35,221,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=221; inner 0–3 px mean lift over 5–8 px=+9.8 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (6,6,6)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (9,9,9) (46,46,46) (76,76,76)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (26,26,26) (72,72,72) (44,44,44) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (31,31,31) (67,67,67) (39,39,39) (33,33,33) (33,33,33)
(0,0,0) (0,0,0) (24,24,24) (66,66,66) (38,38,38) (33,33,33) (33,33,33) (33,33,33)
(0,0,0) (9,9,9) (71,71,71) (38,38,38) (32,32,32) (32,32,32) (33,33,33) (33,33,33)
(0,0,0) (42,42,42) (43,43,43) (32,32,32) (32,32,32) (32,32,32) (31,31,31) (18,70,126)
(6,6,6) (72,72,72) (35,35,35) (32,32,32) (31,31,31) (31,31,31) (18,70,126) (1,120,250)
```
**bottom-right 8×8 RGB:**

```text
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (35,35,35) (72,72,72) (6,6,6)
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (42,42,42) (43,43,43) (0,0,0)
(33,33,33) (32,32,32) (31,31,31) (31,31,31) (37,37,37) (70,70,70) (9,9,9) (0,0,0)
(33,33,33) (32,32,32) (32,32,32) (37,37,37) (65,65,65) (24,24,24) (0,0,0) (0,0,0)
(33,33,33) (32,32,32) (38,38,38) (66,66,66) (30,30,30) (0,0,0) (0,0,0) (0,0,0)
(35,35,35) (43,43,43) (71,71,71) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(75,75,75) (42,42,42) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(5,5,5) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark\plain\appkit-pulldown

Case: appkit-pulldown; appearance=dark; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 338×194; shape box=(56.00,56.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (106,106,106) (70,71,71) (67,67,67) (65,65,65) (63,63,63) (62,62,62) (62,62,62) (60,60,60) (60,60,60)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,106.0,70.8,67.0,65.0,63.0,62.0,62.0,60.0,60.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=+16.2 Y.
- right: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (59,59,59) (59,59,59)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,58.0,58.0,58.0,58.0,58.0,58.0,58.0,59.0,59.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=-0.5 Y.
- bottom: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (97,97,97) (67,67,67) (64,64,64) (62,62,62) (61,61,61) (60,60,60) (60,60,60) (59,59,59) (59,59,59)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,97.0,67.0,64.0,62.0,61.0,60.0,60.0,59.0,59.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=+13.0 Y.
- left: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (59,59,59) (59,59,59)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,58.0,58.0,58.0,58.0,58.0,58.0,58.0,59.0,59.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=-0.5 Y.
**top-left 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (39,39,39) (59,59,59)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (33,33,33) (55,55,55) (62,62,62) (62,62,62)
(30,30,30) (30,30,30) (30,30,30) (34,34,34) (65,65,65) (62,62,62) (62,62,62) (62,62,62)
(30,30,30) (30,30,30) (32,32,32) (65,65,65) (62,62,62) (62,62,62) (62,62,62) (62,62,62)
(30,30,30) (30,30,30) (53,53,53) (60,60,60) (60,60,60) (60,60,60) (60,60,60) (61,61,61)
(30,30,30) (37,37,37) (60,60,60) (60,60,60) (60,60,60) (60,60,60) (60,60,60) (60,60,60)
(30,30,30) (55,55,55) (60,60,60) (60,60,60) (60,60,60) (60,60,60) (60,60,60) (60,60,60)
```
**bottom-right 8×8 RGB:**

```text
(59,59,59) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (53,53,53) (30,30,30)
(59,59,59) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (37,37,37) (30,30,30)
(59,59,59) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (51,51,51) (30,30,30) (30,30,30)
(60,60,60) (59,59,59) (59,59,59) (58,58,58) (63,63,63) (32,32,32) (30,30,30) (30,30,30)
(59,60,60) (59,59,59) (59,59,59) (63,63,63) (34,34,34) (30,30,30) (30,30,30) (30,30,30)
(59,59,59) (59,59,59) (54,54,54) (33,33,33) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(58,58,58) (39,39,39) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 338×194; shape box=(56.00,52.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 272×128; shape box=(23.00,19.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (93,93,93) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (32,32,32) (32,32,32) (31,31,31) (31,31,31)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,93.0,41.0,37.0,35.0,34.0,32.0,32.0,31.0,31.0`; alpha: `6,7,9,10,13,16,22,218,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=218; inner 0–3 px mean lift over 5–8 px=+20.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (72,72,72) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,72.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `14,16,19,21,26,29,35,221,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=221; inner 0–3 px mean lift over 5–8 px=+9.8 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (93,93,93) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (33,33,33) (33,33,33) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,93.0,41.0,37.0,35.0,34.0,33.0,33.0,32.0,32.0`; alpha: `25,30,32,37,41,44,51,223,244,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=223; inner 0–3 px mean lift over 5–8 px=+19.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (72,72,72) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,72.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `14,16,19,22,26,29,35,221,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=221; inner 0–3 px mean lift over 5–8 px=+9.8 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (6,6,6)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (9,9,9) (44,44,44) (77,77,77)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (24,24,24) (72,72,72) (44,44,44) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (31,31,31) (67,67,67) (39,39,39) (33,33,33) (33,33,33)
(0,0,0) (0,0,0) (24,24,24) (66,66,66) (38,38,38) (33,33,33) (33,33,33) (33,33,33)
(0,0,0) (9,9,9) (71,71,71) (38,38,38) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(0,0,0) (42,42,42) (43,43,43) (32,32,32) (32,32,32) (32,32,32) (31,31,31) (31,31,31)
(6,6,6) (72,72,72) (35,35,35) (32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31)
```
**bottom-right 8×8 RGB:**

```text
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (35,35,35) (71,71,71) (6,6,6)
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (42,42,42) (41,41,41) (0,0,0)
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (37,37,37) (70,70,70) (9,9,9) (0,0,0)
(33,33,33) (32,32,32) (32,32,32) (37,37,37) (65,65,65) (23,23,23) (0,0,0) (0,0,0)
(33,33,33) (32,32,32) (38,38,38) (66,66,66) (30,30,30) (0,0,0) (0,0,0) (0,0,0)
(35,35,35) (43,43,43) (71,71,71) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(75,75,75) (43,43,43) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(5,5,5) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark\plain\combobox

Case: combobox; appearance=dark; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 349×194; shape box=(56.00,56.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(211,211,211) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `211.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=44.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 349×194; shape box=(56.00,52.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 283×128; shape box=(23.00,19.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (119,119,119) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (0,122,255) (0,122,255) (0,122,255) (0,122,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,119.0,85.0,85.0,85.0,85.0,105.7,105.7,105.7,105.7`; alpha: `6,7,10,10,14,16,19,51,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=-12.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (119,119,119) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,119.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0`; alpha: `14,16,19,22,26,29,32,64,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+8.5 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (119,119,119) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,119.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0`; alpha: `25,29,33,37,40,45,49,76,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=76; inner 0–3 px mean lift over 5–8 px=+8.5 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (119,119,119) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,119.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0`; alpha: `14,16,19,22,26,29,33,64,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+8.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (75,75,75) (112,112,112)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (42,42,42) (104,104,104) (110,110,110) (99,99,99)
(0,0,0) (0,0,0) (0,0,0) (47,47,47) (109,109,109) (105,105,105) (90,90,90) (85,85,85)
(0,0,0) (0,0,0) (41,41,41) (109,109,109) (102,102,102) (86,86,86) (85,85,85) (85,85,85)
(0,0,0) (0,0,0) (104,104,104) (105,105,105) (86,86,86) (85,85,85) (85,85,85) (85,85,85)
(0,0,0) (72,72,72) (110,110,110) (90,90,90) (85,85,85) (85,85,85) (85,85,85) (74,90,107)
(0,0,0) (112,112,112) (99,99,99) (85,85,85) (85,85,85) (85,85,85) (74,90,107) (28,110,198)
```
**bottom-right 8×8 RGB:**

```text
(85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (99,99,99) (108,108,108) (0,0,0)
(85,85,85) (85,85,85) (85,85,85) (85,85,85) (90,90,90) (110,110,110) (68,68,68) (0,0,0)
(85,85,85) (85,85,85) (85,85,85) (85,85,85) (105,105,105) (101,101,101) (0,0,0) (0,0,0)
(85,85,85) (85,85,85) (86,86,86) (102,102,102) (107,107,107) (32,32,32) (0,0,0) (0,0,0)
(85,85,85) (90,90,90) (105,105,105) (109,109,109) (45,45,45) (0,0,0) (0,0,0) (0,0,0)
(99,99,99) (111,111,111) (99,99,99) (32,32,32) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(106,106,106) (64,64,64) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark\plain\context

Case: context; appearance=dark; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 212×205; shape box=(56.00,56.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (96,96,96) (66,66,66) (63,63,63) (61,61,61) (60,60,60) (59,59,59) (59,59,59) (57,57,57) (57,57,57)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,96.0,66.0,63.0,61.0,60.0,59.0,59.0,57.0,57.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=+13.5 Y.
- right: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (57,57,57) (57,57,57) (57,57,57) (57,57,57) (57,57,57) (58,58,58) (58,58,58) (58,58,58) (58,58,58)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,57.0,57.0,57.0,57.0,57.0,58.0,58.0,58.0,58.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=-1.0 Y.
- bottom: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (96,96,96) (66,66,66) (63,63,63) (61,61,61) (60,60,60) (59,59,59) (59,59,59) (58,58,58) (58,58,58)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,96.0,66.0,63.0,61.0,60.0,59.0,59.0,58.0,58.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=+13.0 Y.
- left: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (57,57,57) (57,57,57) (57,57,57) (57,57,57) (57,57,57) (58,58,58) (58,58,58) (58,58,58) (58,58,58)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,57.0,57.0,57.0,57.0,57.0,58.0,58.0,58.0,58.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=-1.0 Y.
**top-left 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (39,39,39) (61,61,61)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (33,33,33) (56,56,56) (59,59,59) (59,59,59)
(30,30,30) (30,30,30) (30,30,30) (34,34,34) (62,62,62) (59,59,59) (59,59,59) (59,59,59)
(30,30,30) (30,30,30) (33,33,33) (64,64,64) (59,59,59) (59,59,59) (59,59,59) (59,59,59)
(30,30,30) (30,30,30) (51,51,51) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (59,59,59)
(30,30,30) (37,37,37) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58)
(30,30,30) (54,54,54) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58)
```
**bottom-right 8×8 RGB:**

```text
(58,58,58) (58,58,58) (58,58,58) (57,57,57) (57,57,57) (57,57,57) (55,55,55) (30,30,30)
(58,58,58) (58,58,58) (58,58,58) (57,57,57) (57,57,57) (57,57,57) (36,36,36) (30,30,30)
(59,59,59) (58,58,58) (58,58,58) (57,57,57) (57,57,57) (52,52,52) (30,30,30) (30,30,30)
(59,59,59) (59,59,59) (59,59,59) (58,58,58) (62,62,62) (32,32,32) (30,30,30) (30,30,30)
(59,59,59) (59,59,59) (59,59,59) (63,63,63) (34,34,34) (30,30,30) (30,30,30) (30,30,30)
(59,59,59) (59,59,59) (55,55,55) (33,33,33) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(61,61,61) (39,39,39) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 212×205; shape box=(56.00,52.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```
**bottom-right 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 146×139; shape box=(23.00,19.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (93,93,93) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (32,32,32) (32,32,32) (31,31,31) (31,31,31)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,93.0,41.0,37.0,35.0,34.0,32.0,32.0,31.0,31.0`; alpha: `6,7,10,12,14,16,22,218,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=218; inner 0–3 px mean lift over 5–8 px=+20.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (72,72,72) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,72.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `14,15,19,22,26,30,36,221,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=221; inner 0–3 px mean lift over 5–8 px=+9.8 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (93,93,93) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (33,33,33) (33,33,33) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,93.0,41.0,37.0,35.0,34.0,33.0,33.0,32.0,32.0`; alpha: `25,28,33,37,41,44,51,222,244,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=222; inner 0–3 px mean lift over 5–8 px=+19.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (72,72,72) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,72.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `13,17,19,22,26,29,36,221,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=221; inner 0–3 px mean lift over 5–8 px=+9.8 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (6,6,6)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (9,9,9) (46,46,46) (76,76,76)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (26,26,26) (72,72,72) (44,44,44) (37,37,37)
(0,0,0) (0,0,0) (0,0,0) (31,31,31) (67,67,67) (39,39,39) (33,33,33) (33,33,33)
(0,0,0) (0,0,0) (24,24,24) (66,66,66) (38,38,38) (33,33,33) (33,33,33) (33,33,33)
(0,0,0) (9,9,9) (71,71,71) (38,38,38) (32,32,32) (32,32,32) (33,33,33) (33,33,33)
(0,0,0) (42,42,42) (43,43,43) (32,32,32) (32,32,32) (32,32,32) (31,31,31) (31,31,31)
(6,6,6) (72,72,72) (35,35,35) (32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31)
```
**bottom-right 8×8 RGB:**

```text
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (35,35,35) (70,70,70) (6,6,6)
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (42,42,42) (43,43,43) (0,0,0)
(33,33,33) (32,32,32) (32,32,32) (31,31,31) (37,37,37) (67,67,67) (9,9,9) (0,0,0)
(33,33,33) (32,32,32) (32,32,32) (37,37,37) (64,64,64) (23,23,23) (0,0,0) (0,0,0)
(33,33,33) (32,32,32) (38,38,38) (64,64,64) (30,30,30) (0,0,0) (0,0,0) (0,0,0)
(36,36,36) (43,43,43) (71,71,71) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(75,75,75) (43,43,43) (10,10,10) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(5,5,5) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark\plain\submenu

Case: submenu; appearance=dark; background=plain; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

Nested submenu result: no parent popup window appeared during the recorded attempts.

## macos27-captures\out\menu-outline\menus\dark\plain\swiftui-menu

Case: swiftui-menu; appearance=dark; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-2-host-runtime.json`, `attempt-2-runtime-0.json`.

### menu-window-0 — display

Image `attempt-2-display.png`: 272×194; shape box=(56.00,56.00,160.00,82.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (184,184,184) (161,161,161) (159,159,159) (157,157,157) (155,155,155) (155,155,155) (154,154,154) (153,153,153) (153,153,153)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,184.0,161.0,159.0,157.0,155.0,155.0,154.0,153.0,153.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+11.5 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (153,153,153) (153,153,153) (153,153,153) (153,153,153) (153,153,153) (154,154,154) (154,154,154) (154,154,154) (155,155,155)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,153.0,153.0,153.0,153.0,153.0,154.0,154.0,154.0,155.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.2 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (183,183,183) (161,161,161) (159,159,159) (158,158,158) (157,157,157) (157,157,157) (156,156,156) (156,156,156) (156,156,156)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,183.0,161.0,159.0,158.0,157.0,157.0,156.0,156.0,156.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+9.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (153,153,153) (153,153,153) (153,153,153) (153,153,153) (153,153,153) (154,154,154) (154,154,154) (154,154,154) (155,155,155)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,153.0,153.0,153.0,153.0,153.0,154.0,154.0,154.0,155.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.2 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (251,251,251) (232,232,232) (191,191,191)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (243,243,243) (198,198,198) (156,156,156) (156,156,156)
(255,255,255) (255,255,255) (255,255,255) (238,238,238) (164,164,164) (156,156,156) (156,156,156) (156,156,156)
(255,255,255) (255,255,255) (241,241,241) (171,171,171) (155,155,155) (156,156,156) (156,156,156) (156,156,156)
(255,255,255) (251,251,251) (192,192,192) (155,155,155) (155,155,155) (155,155,155) (154,154,154) (154,154,154)
(255,255,255) (229,229,229) (155,155,155) (155,155,155) (154,154,154) (154,154,154) (154,154,154) (154,154,154)
(253,253,253) (183,183,183) (154,154,154) (154,154,154) (154,154,154) (154,154,154) (154,154,154) (154,154,154)
```
**bottom-right 8×8 RGB:**

```text
(154,154,154) (154,154,154) (154,154,154) (153,153,153) (153,153,153) (153,153,153) (181,181,181) (253,253,253)
(154,154,154) (154,154,154) (154,154,154) (153,153,153) (153,153,153) (153,153,153) (228,228,228) (255,255,255)
(154,154,154) (154,154,154) (154,154,154) (153,153,153) (153,153,153) (190,190,190) (250,250,250) (255,255,255)
(155,155,155) (155,155,155) (155,155,155) (153,153,153) (169,169,169) (241,241,241) (255,255,255) (255,255,255)
(155,155,155) (155,155,155) (155,155,155) (162,162,162) (238,238,238) (255,255,255) (255,255,255) (255,255,255)
(155,155,155) (155,155,155) (196,196,196) (242,242,242) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(189,189,189) (230,230,230) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(253,253,253) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — single-window

Image `attempt-2-window-0-single.png`: 272×194; shape box=(56.00,52.00,160.00,82.00) px.
- top: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (29,29,29) (28,28,28) (28,28,28) (21,21,21) (50,50,50) (72,72,72) (58,58,58) (54,54,54) (104,104,104) (152,152,152)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,29.0,28.0,28.0,21.0,50.0,72.0,58.0,54.0,104.0,152.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=1.0); edge at −1 RGB=(29,29,29), Y=29.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-60.2 Y.
- left: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```
**bottom-right 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```

### menu-window-0 — cgwindow

Image `attempt-2-window-0-cgwindow.png`: 206×128; shape box=(23.00,19.00,160.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (112,112,112) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (32,32,32) (32,32,32) (31,31,31) (31,31,31)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,112.0,41.0,37.0,35.0,34.0,32.0,32.0,31.0,31.0`; alpha: `5,7,8,12,13,16,19,52,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=52; inner 0–3 px mean lift over 5–8 px=+24.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (99,99,99) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,99.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `14,15,19,22,25,29,32,63,196,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=63; inner 0–3 px mean lift over 5–8 px=+16.5 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (112,112,112) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (33,33,33) (33,33,33) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,112.0,41.0,37.0,35.0,34.0,33.0,33.0,32.0,32.0`; alpha: `26,29,33,37,41,44,48,76,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=76; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (99,99,99) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,99.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `14,16,19,22,26,29,32,64,196,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (115,115,115) (102,102,102)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (98,98,98) (102,102,102) (55,55,55) (40,40,40)
(0,0,0) (0,0,0) (0,0,0) (103,103,103) (85,85,85) (45,45,45) (33,33,33) (33,33,33)
(0,0,0) (0,0,0) (97,97,97) (83,83,83) (43,43,43) (33,33,33) (33,33,33) (33,33,33)
(0,0,0) (56,56,56) (102,102,102) (44,44,44) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(0,0,0) (110,110,110) (54,54,54) (32,32,32) (32,32,32) (32,32,32) (31,31,31) (31,31,31)
(34,34,34) (101,101,101) (39,39,39) (32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31)
```
**bottom-right 8×8 RGB:**

```text
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (38,38,38) (100,100,100) (30,30,30)
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (53,53,53) (104,104,104) (0,0,0)
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (44,44,44) (100,100,100) (48,48,48) (0,0,0)
(33,33,33) (32,32,32) (32,32,32) (42,42,42) (83,83,83) (85,85,85) (0,0,0) (0,0,0)
(33,33,33) (32,32,32) (44,44,44) (84,84,84) (94,94,94) (0,0,0) (0,0,0) (0,0,0)
(39,39,39) (54,54,54) (100,100,100) (85,85,85) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(101,101,101) (106,106,106) (47,47,47) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(27,27,27) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark\plain\swiftui-picker

Case: swiftui-picker; appearance=dark; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 211×194; shape box=(56.00,56.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (102,102,102) (84,84,84) (82,82,82) (83,83,83) (83,83,83) (83,83,83) (84,84,84) (83,83,83) (84,84,84)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,102.0,84.0,82.0,83.0,83.0,83.0,84.0,83.0,84.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=+4.2 Y.
- right: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (60,60,60) (61,61,61) (61,61,61) (61,61,61) (61,61,61) (61,61,61) (62,62,62) (62,62,62) (62,62,62)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,60.0,61.0,61.0,61.0,61.0,61.0,62.0,62.0,62.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=-1.0 Y.
- bottom: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (97,97,97) (67,67,67) (64,64,64) (62,62,62) (61,61,61) (60,60,60) (60,60,60) (59,59,59) (59,59,59)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,97.0,67.0,64.0,62.0,61.0,60.0,60.0,59.0,59.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=+13.0 Y.
- left: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (60,60,60) (60,60,60) (60,60,60) (60,60,60) (60,60,60) (61,61,61) (61,61,61) (61,61,61) (61,61,61)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,60.0,60.0,60.0,60.0,60.0,61.0,61.0,61.0,61.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=-1.0 Y.
**top-left 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (39,39,39) (67,67,67)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (33,33,33) (59,59,59) (69,69,69) (70,70,70)
(30,30,30) (30,30,30) (30,30,30) (34,34,34) (71,71,71) (70,70,70) (70,70,70) (70,70,70)
(30,30,30) (30,30,30) (33,33,33) (71,72,71) (70,70,70) (70,70,70) (70,70,70) (70,70,70)
(30,30,30) (30,30,30) (57,57,57) (69,69,69) (69,69,69) (70,70,70) (70,70,70) (70,70,70)
(30,30,30) (38,38,38) (70,70,70) (70,70,70) (70,70,70) (70,70,70) (70,70,70) (70,70,70)
(30,30,30) (63,63,63) (70,70,70) (70,70,70) (70,70,70) (70,70,70) (70,70,70) (70,70,70)
```
**bottom-right 8×8 RGB:**

```text
(59,59,59) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (56,56,56) (30,30,30)
(59,59,59) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (36,36,36) (30,30,30)
(59,59,59) (58,58,58) (58,58,58) (58,58,58) (58,58,58) (53,53,53) (30,30,30) (30,30,30)
(60,60,60) (59,59,59) (59,59,59) (59,59,59) (62,62,62) (33,33,33) (30,30,30) (30,30,30)
(59,60,60) (59,59,59) (59,59,59) (65,65,65) (34,34,34) (30,30,30) (30,30,30) (30,30,30)
(59,59,59) (59,59,59) (53,53,53) (33,33,33) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(59,59,59) (39,39,39) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 211×194; shape box=(56.00,52.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```
**bottom-right 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 145×128; shape box=(23.00,19.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (93,93,93) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (32,32,32) (32,32,32) (31,31,31) (31,31,31)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,93.0,41.0,37.0,35.0,34.0,32.0,32.0,31.0,31.0`; alpha: `6,7,9,10,13,16,22,218,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=218; inner 0–3 px mean lift over 5–8 px=+20.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (72,72,72) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,72.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `14,16,19,22,25,29,36,219,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=219; inner 0–3 px mean lift over 5–8 px=+9.8 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (93,93,93) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (33,33,33) (33,33,33) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,93.0,41.0,37.0,35.0,34.0,33.0,33.0,32.0,32.0`; alpha: `25,30,32,37,41,44,51,223,244,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=223; inner 0–3 px mean lift over 5–8 px=+19.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (72,72,72) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (32,32,32) (32,32,32)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,72.0,31.0,31.0,31.0,31.0,31.0,31.0,32.0,32.0`; alpha: `14,16,19,22,26,29,35,221,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=221; inner 0–3 px mean lift over 5–8 px=+9.8 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (6,6,6)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (9,9,9) (46,46,46) (76,76,76)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (26,26,26) (72,72,72) (44,44,44) (37,37,37)
(0,0,0) (0,0,0) (0,0,0) (31,31,31) (67,67,67) (39,39,39) (33,33,33) (33,33,33)
(0,0,0) (0,0,0) (24,24,24) (66,66,66) (38,38,38) (33,33,33) (33,33,33) (33,33,33)
(0,0,0) (9,9,9) (71,71,71) (38,38,38) (32,32,32) (32,32,32) (33,33,33) (33,33,33)
(0,0,0) (42,42,42) (43,43,43) (32,32,32) (32,32,32) (32,32,32) (31,31,31) (31,31,31)
(6,6,6) (72,72,72) (35,35,35) (32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31)
```
**bottom-right 8×8 RGB:**

```text
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (34,34,34) (71,71,71) (5,5,5)
(32,32,32) (31,31,31) (31,31,31) (31,31,31) (31,31,31) (42,42,42) (41,41,41) (0,0,0)
(33,33,33) (32,32,32) (31,31,31) (31,31,31) (37,37,37) (71,71,71) (9,9,9) (0,0,0)
(33,33,33) (32,32,32) (32,32,32) (37,37,37) (63,63,63) (24,24,24) (0,0,0) (0,0,0)
(33,33,33) (32,32,32) (38,38,38) (65,65,65) (30,30,30) (0,0,0) (0,0,0) (0,0,0)
(37,37,37) (43,43,43) (69,69,69) (23,23,23) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(73,73,73) (45,45,45) (10,10,10) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(6,6,6) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark-contrast\photo\appkit-popup

Case: appkit-popup; appearance=dark-contrast; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 342×218; shape box=(56.00,56.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(59,50,29) (67,57,41) (73,63,50) (72,62,50) (70,62,49) (70,64,52) (70,65,55) (73,64,48) (104,80,55) (67,52,24) (62,49,22) (60,47,21) (59,46,20) (24,117,219) (23,117,219) (23,116,218) (23,116,218)`; luma: `50.4,58.0,64.2,63.3,62.8,64.4,65.3,64.8,83.3,53.2,49.8,47.9,46.9,104.6,104.4,103.6,103.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=14.9); edge at −1 RGB=(73,64,48), Y=64.8; composited; inner 0–3 px mean lift over 5–8 px=-45.5 Y.
- right: RGB distances −8..+8: `(248,214,56) (216,169,41) (227,190,45) (212,171,69) (243,196,102) (243,185,94) (238,215,163) (244,200,86) (58,40,12) (61,40,11) (59,40,11) (61,40,11) (62,40,11) (64,39,11) (67,39,11) (67,39,12) (68,39,12)`; luma: `209.8,169.8,187.4,172.4,199.2,190.8,216.1,201.1,41.8,42.4,41.9,42.4,42.6,42.3,42.9,43.0,43.2`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=40.1); edge at −1 RGB=(244,200,86), Y=201.1; composited; inner 0–3 px mean lift over 5–8 px=-0.7 Y.
- bottom: RGB distances −8..+8: `(54,60,14) (148,159,106) (156,168,131) (139,147,102) (158,173,130) (145,156,111) (110,114,51) (125,130,59) (84,84,55) (54,54,28) (50,50,24) (48,48,23) (47,47,22) (46,46,20) (46,46,20) (45,45,19) (45,45,18)`; luma: `55.4,152.8,162.8,142.1,166.7,150.4,108.6,123.8,81.9,52.1,48.1,46.2,45.2,44.1,44.1,43.1,43.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=111.3); edge at −1 RGB=(125,130,59), Y=123.8; composited; inner 0–3 px mean lift over 5–8 px=+13.5 Y.
- left: RGB distances −8..+8: `(34,48,3) (35,51,3) (57,76,4) (26,47,3) (22,41,1) (35,53,1) (54,76,5) (52,71,2) (38,44,26) (39,44,28) (40,44,30) (39,43,30) (40,44,30) (40,45,30) (39,45,30) (39,45,30) (40,45,30)`; luma: `41.8,44.1,66.8,39.4,34.1,45.4,66.2,62.0,41.4,41.8,42.1,41.2,42.1,42.9,42.6,42.6,42.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 4/8 ([-6, -4, -2, -1] px; max ΔY=25.0); edge at −1 RGB=(52,71,2), Y=62.0; composited; inner 0–3 px mean lift over 5–8 px=-1.1 Y.
**top-left 8×8 RGB:**

```text
(96,101,16) (43,46,11) (38,42,2) (32,37,0) (23,30,1) (29,35,3) (50,59,8) (93,95,8)
(93,101,26) (111,121,69) (111,122,73) (71,81,40) (32,41,4) (52,60,1) (77,83,13) (77,78,25)
(54,67,9) (45,59,19) (82,97,54) (135,151,114) (114,127,88) (66,68,27) (46,47,20) (46,47,20)
(59,75,17) (41,56,12) (35,48,3) (68,80,45) (64,66,40) (46,47,20) (46,47,20) (46,47,20)
(66,86,32) (55,71,23) (45,57,14) (53,53,27) (45,46,20) (45,46,20) (45,46,20) (46,47,20)
(84,104,71) (55,70,29) (50,56,23) (44,45,19) (44,45,19) (44,45,19) (45,46,19) (45,46,19)
(122,144,127) (51,62,30) (44,45,19) (44,45,19) (44,45,19) (44,45,19) (44,45,19) (35,75,103)
(67,78,44) (52,58,24) (43,45,19) (43,45,19) (43,45,19) (44,45,19) (35,75,104) (24,113,209)
```
**bottom-right 8×8 RGB:**

```text
(48,42,14) (48,42,14) (48,42,14) (49,42,14) (50,41,14) (53,40,14) (69,67,24) (96,109,18)
(47,42,15) (48,42,15) (48,42,15) (49,41,14) (53,40,14) (54,40,14) (85,94,28) (101,114,23)
(48,43,15) (49,42,15) (48,42,15) (51,41,15) (52,40,15) (81,83,35) (105,118,31) (92,104,24)
(49,43,17) (49,43,17) (52,42,16) (53,41,16) (61,52,24) (138,150,63) (130,141,44) (66,76,15)
(50,42,17) (53,42,17) (53,42,17) (64,59,26) (120,134,45) (149,161,55) (126,138,45) (51,61,14)
(52,42,17) (53,41,17) (69,70,25) (107,122,33) (138,153,50) (143,155,44) (85,95,27) (63,70,16)
(59,57,26) (72,80,16) (104,117,25) (129,143,45) (143,156,47) (115,126,36) (38,45,6) (67,76,7)
(62,71,3) (98,109,18) (121,133,33) (136,150,45) (135,148,41) (38,44,11) (28,36,2) (78,89,4)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 342×218; shape box=(56.00,52.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(143,88,45) (96,44,0) (72,34,5) (14,5,0) (75,51,31) (107,78,50) (124,89,56) (126,92,57) (136,91,58) (178,123,75) (216,142,73) (207,92,87) (186,80,138) (139,69,125) (122,57,114) (101,44,90) (87,65,76)`; luma: `96.6,51.9,40.0,6.6,54.7,82.1,94.1,96.7,98.2,131.2,152.8,116.1,106.7,87.9,74.9,59.4,70.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-7, -6, -5, -4, -3] px; max ΔY=90.0); edge at −1 RGB=(126,92,57), Y=96.7; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+51.4 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(104,98,50) (66,84,67) (72,86,51) (94,103,51) (140,136,76) (179,165,120) (131,125,100) (55,60,36) (38,47,15) (35,42,6) (100,93,67) (170,158,159) (129,126,103) (87,98,41) (108,109,66) (113,91,79) (125,101,78)`; luma: `95.8,78.9,80.5,97.3,132.5,164.7,124.5,57.2,42.8,37.9,92.6,160.6,125.0,91.5,105.7,94.8,104.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=68.9); edge at −1 RGB=(55,60,36), Y=57.2; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-15.6 Y.
- left: RGB distances −8..+8: `(241,143,216) (239,125,193) (241,122,194) (233,151,202) (206,93,135) (224,117,170) (231,131,191) (223,88,156) (229,68,147) (243,157,212) (241,171,218) (234,128,193) (232,124,190) (234,144,199) (237,171,207) (236,175,205) (239,175,210)`; luma: `169.1,154.1,152.5,172.1,120.1,143.6,156.6,121.6,107.9,179.3,189.3,155.2,151.7,167.1,187.6,190.1,191.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=49.0); edge at −1 RGB=(223,88,156), Y=121.6; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-26.1 Y.
**top-left 8×8 RGB:**

```text
(97,98,33) (126,145,87) (129,154,94) (109,132,76) (90,107,45) (80,94,28) (79,95,23) (104,115,28)
(118,93,18) (116,129,72) (123,148,95) (112,137,81) (105,126,62) (104,123,57) (110,125,59) (86,93,37)
(107,95,16) (107,115,50) (118,144,90) (110,137,82) (110,134,78) (100,117,71) (74,83,41) (46,50,11)
(187,117,2) (178,141,33) (152,155,75) (135,148,80) (88,95,44) (25,28,12) (11,13,0) (42,45,2)
(126,85,7) (135,93,12) (176,141,45) (163,143,52) (83,77,13) (29,33,0) (27,30,2) (69,69,6)
(23,19,7) (44,28,3) (125,93,23) (182,139,28) (114,98,16) (34,36,4) (24,27,3) (80,79,11)
(93,54,3) (105,70,13) (125,86,8) (160,101,0) (120,93,11) (46,47,10) (31,33,5) (65,63,12)
(161,96,1) (144,93,12) (121,91,16) (97,74,5) (61,59,4) (32,39,2) (31,34,2) (58,57,12)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 276×152; shape box=(23.00,19.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (24,117,219) (23,117,219) (23,116,218) (23,116,218)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,104.6,104.4,103.6,103.6`; alpha: `5,7,9,11,13,16,19,51,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=-51.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0`; alpha: `13,15,19,23,25,29,33,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,28.0,28.0`; alpha: `25,30,33,37,41,44,48,76,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=76; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0`; alpha: `13,15,20,22,26,29,32,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (115,115,115) (98,98,98)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (98,98,98) (99,99,99) (51,51,51) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (98,98,98) (82,82,82) (42,42,42) (29,29,29) (29,29,29)
(0,0,0) (0,0,0) (95,95,95) (80,80,80) (39,39,39) (29,29,29) (29,29,29) (29,29,29)
(0,0,0) (56,56,56) (98,98,98) (41,41,41) (28,28,28) (28,28,28) (29,29,29) (29,29,29)
(0,0,0) (107,107,107) (51,51,51) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (26,65,108)
(34,34,34) (96,96,96) (35,35,35) (28,28,28) (28,28,28) (28,28,28) (26,65,108) (23,114,214)
```
**bottom-right 8×8 RGB:**

```text
(28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (35,35,35) (95,95,95) (30,30,30)
(28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (51,51,51) (101,101,101) (0,0,0)
(29,29,29) (29,29,29) (28,28,28) (28,28,28) (41,41,41) (96,96,96) (48,48,48) (0,0,0)
(29,29,29) (29,29,29) (29,29,29) (39,39,39) (80,80,80) (86,86,86) (0,0,0) (0,0,0)
(29,29,29) (29,29,29) (42,42,42) (81,81,81) (90,90,90) (0,0,0) (0,0,0) (0,0,0)
(36,36,36) (51,51,51) (97,97,97) (85,85,85) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(97,97,97) (105,105,105) (48,48,48) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(28,28,28) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark-contrast\photo\appkit-pulldown

Case: appkit-pulldown; appearance=dark-contrast; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 338×194; shape box=(56.00,56.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(208,192,144) (220,219,187) (218,198,140) (204,181,129) (224,201,146) (229,209,166) (244,244,244) (241,238,227) (89,84,64) (55,52,29) (50,48,27) (48,46,24) (47,45,24) (47,44,24) (47,44,25) (45,43,23) (45,43,21)`; luma: `191.9,216.9,198.1,182.1,201.9,210.1,244.0,237.8,83.6,51.0,46.9,44.8,43.9,43.2,43.3,42.0,41.8`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=52.1); edge at −1 RGB=(241,238,227), Y=237.8; composited; inner 0–3 px mean lift over 5–8 px=+14.0 Y.
- right: RGB distances −8..+8: `(70,75,2) (70,74,1) (84,87,3) (80,84,1) (85,86,3) (139,133,12) (117,106,5) (77,75,0) (52,38,8) (53,38,8) (49,39,9) (46,39,10) (46,39,8) (46,39,8) (46,39,8) (46,39,8) (46,39,9)`; luma: `68.7,67.9,80.3,77.2,79.8,125.5,101.0,70.0,38.8,39.0,39.0,38.4,38.2,38.2,38.2,38.2,38.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-6, -5, -4, -3, -2] px; max ΔY=56.9); edge at −1 RGB=(77,75,0), Y=70.0; composited; inner 0–3 px mean lift over 5–8 px=+0.5 Y.
- bottom: RGB distances −8..+8: `(150,130,106) (109,88,73) (146,107,84) (199,142,106) (80,51,24) (191,183,157) (238,238,217) (163,161,106) (88,81,58) (54,50,22) (49,47,20) (48,45,18) (46,43,23) (45,42,22) (44,42,19) (42,41,18) (41,41,18)`; luma: `132.5,91.4,113.6,151.5,55.2,182.8,236.5,157.5,80.8,48.8,45.5,43.7,42.2,41.2,40.8,39.6,39.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=104.0); edge at −1 RGB=(163,161,106), Y=157.5; composited; inner 0–3 px mean lift over 5–8 px=+14.5 Y.
- left: RGB distances −8..+8: `(107,130,223) (106,117,202) (71,56,119) (116,113,158) (152,161,214) (96,110,186) (149,159,216) (198,199,220) (35,42,53) (36,43,51) (37,43,50) (38,41,52) (37,42,53) (37,42,51) (37,43,50) (37,43,50) (37,43,51)`; luma: `131.8,120.8,63.7,116.9,162.9,112.5,161.0,200.3,41.3,42.1,42.2,41.2,41.7,41.6,42.2,42.2,42.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=68.5); edge at −1 RGB=(198,199,220), Y=200.3; composited; inner 0–3 px mean lift over 5–8 px=-0.4 Y.
**top-left 8×8 RGB:**

```text
(191,206,157) (90,101,58) (24,34,0) (73,90,20) (134,158,85) (154,179,118) (147,167,113) (126,148,90)
(199,215,163) (123,135,89) (15,23,1) (22,34,6) (82,99,43) (133,155,94) (112,132,82) (75,86,57)
(201,213,158) (137,150,105) (16,23,1) (19,30,4) (24,34,5) (69,81,48) (38,43,32) (37,42,33)
(144,153,95) (123,134,81) (35,47,5) (40,54,9) (44,50,34) (38,43,32) (37,42,34) (38,42,33)
(56,62,11) (97,105,33) (81,94,28) (46,52,37) (37,42,32) (38,42,32) (38,43,32) (38,43,32)
(11,17,2) (31,38,7) (40,47,25) (36,41,32) (37,41,31) (37,42,31) (37,42,32) (37,42,32)
(6,14,1) (11,19,8) (36,41,32) (36,41,32) (37,42,32) (37,42,32) (37,42,32) (37,41,32)
(7,16,0) (31,39,25) (36,41,33) (37,41,32) (37,42,32) (37,42,32) (37,41,33) (37,42,33)
```
**bottom-right 8×8 RGB:**

```text
(41,40,32) (41,40,31) (40,40,31) (39,40,30) (38,40,25) (39,40,22) (89,91,79) (208,207,205)
(41,40,32) (40,40,32) (40,40,32) (39,40,29) (38,40,23) (37,38,26) (186,183,179) (242,239,237)
(41,40,33) (40,40,32) (39,40,31) (38,40,25) (38,40,24) (84,86,77) (139,138,141) (154,152,154)
(41,41,34) (41,41,33) (39,41,27) (39,41,24) (51,52,41) (128,130,132) (178,177,178) (215,214,213)
(40,41,31) (40,41,26) (39,41,26) (58,59,49) (205,204,201) (251,250,247) (255,255,255) (253,254,252)
(39,41,27) (38,39,30) (103,104,97) (178,178,178) (192,191,192) (178,176,177) (160,158,157) (138,138,136)
(66,67,60) (85,87,87) (98,99,101) (103,104,105) (111,111,111) (129,129,128) (153,151,150) (169,168,166)
(122,123,125) (126,127,129) (132,132,135) (161,159,160) (211,209,208) (233,230,227) (242,238,234) (240,237,232)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 338×194; shape box=(56.00,52.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(198,158,119) (195,162,126) (158,132,101) (74,61,31) (79,63,33) (104,82,44) (94,76,36) (94,82,42) (80,60,30) (100,56,40) (156,80,78) (185,51,87) (173,26,69) (146,53,57) (134,78,59) (131,94,65) (155,131,52)`; luma: `163.7,166.4,135.3,61.6,64.2,83.9,76.9,81.7,62.1,64.2,96.0,82.1,60.4,73.1,88.5,99.8,130.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=102.1); edge at −1 RGB=(94,82,42), Y=81.7; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-21.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(69,59,50) (64,53,48) (50,41,36) (51,42,34) (55,46,39) (63,53,46) (63,54,48) (67,58,52) (64,52,45) (60,51,43) (69,61,56) (74,66,55) (86,77,51) (68,66,43) (48,55,34) (70,78,57) (75,82,70)`; luma: `60.5,55.0,42.6,43.3,47.4,54.6,55.5,59.5,54.0,52.3,62.3,66.9,77.0,64.8,52.0,74.8,79.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 3/8 ([-6, -5, -4] px; max ΔY=17.9); edge at −1 RGB=(67,58,52), Y=59.5; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-8.9 Y.
- left: RGB distances −8..+8: `(229,125,185) (225,76,150) (235,110,178) (242,169,218) (236,146,202) (232,122,188) (234,143,198) (236,168,205) (237,173,204) (239,173,209) (245,181,221) (209,154,187) (144,86,95) (179,41,73) (236,74,138) (236,106,165) (234,120,174)`; luma: `151.4,113.0,141.5,188.1,169.2,150.2,166.3,185.1,188.8,189.6,197.5,168.1,99.0,72.6,113.1,137.9,148.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -2, -1] px; max ΔY=38.4); edge at −1 RGB=(236,168,205), Y=185.1; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+68.1 Y.
**top-left 8×8 RGB:**

```text
(60,58,11) (51,53,7) (35,39,1) (34,41,1) (66,73,3) (91,82,5) (105,79,2) (144,110,6)
(44,48,6) (55,62,7) (58,68,4) (57,65,4) (85,91,16) (76,79,16) (58,59,12) (65,66,19)
(64,78,18) (65,76,21) (86,98,34) (77,86,18) (87,92,21) (90,88,21) (74,71,14) (12,15,4)
(96,113,55) (77,91,40) (101,114,59) (107,123,54) (102,112,37) (106,104,28) (73,67,10) (43,38,5)
(92,104,49) (67,79,37) (75,87,41) (116,132,65) (118,126,60) (79,77,27) (33,31,3) (58,51,9)
(78,87,21) (58,64,16) (54,58,14) (98,100,40) (102,96,43) (35,31,13) (28,24,1) (72,62,9)
(83,85,14) (67,68,7) (47,50,0) (75,68,14) (106,88,34) (70,63,22) (47,43,5) (24,25,3)
(93,99,44) (88,93,34) (69,73,7) (94,90,23) (110,98,48) (42,41,16) (11,17,1) (12,16,1)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 272×128; shape box=(23.00,19.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (27,27,27) (27,27,27)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,27.0,27.0`; alpha: `6,7,9,10,13,16,19,50,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=50; inner 0–3 px mean lift over 5–8 px=+24.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (27,27,27) (27,27,27) (27,27,27) (27,27,27) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,27.0,27.0,27.0,27.0,28.0,28.0,28.0,28.0`; alpha: `14,16,19,21,26,29,32,63,196,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=63; inner 0–3 px mean lift over 5–8 px=+16.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,28.0,28.0`; alpha: `25,30,32,37,41,44,48,77,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=77; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (27,27,27) (27,27,27) (27,27,27) (27,27,27) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,27.0,27.0,27.0,27.0,28.0,28.0,28.0,28.0`; alpha: `14,16,19,22,26,29,32,64,196,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (112,112,112) (98,98,98)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (98,98,98) (99,99,99) (51,51,51) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (98,98,98) (80,80,80) (42,42,42) (29,29,29) (29,29,29)
(0,0,0) (0,0,0) (97,97,97) (81,81,81) (39,39,39) (29,29,29) (29,29,29) (29,29,29)
(0,0,0) (56,56,56) (97,97,97) (41,41,41) (28,28,28) (28,28,28) (28,28,28) (28,28,28)
(0,0,0) (107,107,107) (51,51,51) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)
(34,34,34) (95,95,95) (35,35,35) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)
```
**bottom-right 8×8 RGB:**

```text
(28,28,28) (28,28,28) (28,28,28) (27,27,27) (27,27,27) (34,34,34) (94,94,94) (30,30,30)
(28,28,28) (28,28,28) (28,28,28) (27,27,27) (27,27,27) (50,50,50) (101,101,101) (0,0,0)
(28,28,28) (28,28,28) (28,28,28) (27,27,27) (40,40,40) (95,95,95) (48,48,48) (0,0,0)
(29,29,29) (29,29,29) (29,29,29) (38,38,38) (79,79,79) (85,85,85) (0,0,0) (0,0,0)
(29,29,29) (29,29,29) (42,42,42) (79,79,79) (90,90,90) (0,0,0) (0,0,0) (0,0,0)
(36,36,36) (51,51,51) (97,97,97) (85,85,85) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(97,97,97) (104,104,104) (47,47,47) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(27,27,27) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark-contrast\photo\combobox

Case: combobox; appearance=dark-contrast; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 349×194; shape box=(56.00,56.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(39,32,17) (127,111,50) (77,75,42) (158,134,74) (208,192,144) (220,219,187) (218,198,140) (204,181,129) (76,66,39) (76,66,39) (75,66,39) (75,66,39) (75,66,39) (23,116,218) (23,116,218) (23,116,218) (23,116,218)`; luma: `32.4,110.0,73.0,134.8,191.9,216.9,198.1,182.1,66.2,66.2,66.0,66.0,66.0,103.6,103.6,103.6,103.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=184.5); edge at −1 RGB=(204,181,129), Y=182.1; composited; inner 0–3 px mean lift over 5–8 px=-37.5 Y.
- right: RGB distances −8..+8: `(156,44,2) (90,60,2) (106,113,4) (101,108,2) (84,87,2) (114,117,3) (102,100,2) (88,87,2) (76,57,32) (76,57,32) (76,57,32) (76,57,32) (76,57,32) (76,57,32) (76,56,32) (76,56,32) (76,56,32)`; luma: `64.8,62.2,103.6,98.9,80.2,108.1,93.3,81.1,59.2,59.2,59.2,59.2,59.2,59.2,58.5,58.5,58.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=43.4); edge at −1 RGB=(88,87,2), Y=81.1; composited; inner 0–3 px mean lift over 5–8 px=+0.5 Y.
- bottom: RGB distances −8..+8: `(80,51,24) (191,183,157) (238,238,217) (163,161,106) (117,117,44) (96,96,45) (163,163,120) (166,161,102) (59,58,32) (59,58,32) (59,58,32) (59,58,32) (59,58,32) (59,58,32) (59,58,32) (59,58,32) (59,58,32)`; luma: `55.2,182.8,236.5,157.5,111.7,92.3,159.9,157.8,56.3,56.3,56.3,56.3,56.3,56.3,56.3,56.3,56.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=181.3); edge at −1 RGB=(166,161,102), Y=157.8; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(42,85,178) (50,91,185) (107,133,210) (123,143,218) (83,101,188) (51,67,153) (53,73,163) (68,92,178) (65,70,67) (65,70,67) (65,70,67) (65,70,67) (65,70,67) (65,70,67) (65,70,67) (65,70,67) (65,70,67)`; luma: `82.6,89.1,133.0,144.2,103.5,69.8,75.2,93.1,68.7,68.7,68.7,68.7,68.7,68.7,68.7,68.7,68.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=61.6); edge at −1 RGB=(68,92,178), Y=93.1; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(12,18,0) (49,60,23) (155,173,138) (203,221,194) (148,168,113) (139,160,102) (118,142,68) (141,163,97)
(10,16,3) (25,33,1) (93,106,58) (209,224,197) (154,174,129) (169,186,136) (93,108,47) (90,102,59)
(16,26,1) (33,45,4) (48,59,12) (141,150,117) (162,181,139) (135,147,115) (57,62,56) (58,63,59)
(23,35,0) (34,47,3) (13,22,0) (59,66,39) (112,123,94) (58,64,59) (58,64,59) (58,64,59)
(27,42,0) (28,40,2) (13,20,4) (35,39,27) (58,64,60) (58,64,60) (58,64,60) (58,64,60)
(30,47,1) (23,33,3) (20,22,16) (59,64,60) (59,64,60) (59,64,60) (59,64,60) (59,64,60)
(33,50,1) (13,20,5) (54,59,55) (59,64,60) (59,64,60) (59,64,60) (59,64,60) (55,70,78)
(43,60,2) (39,48,23) (59,64,61) (59,64,61) (59,64,61) (59,64,61) (54,72,84) (35,98,164)
```
**bottom-right 8×8 RGB:**

```text
(65,59,32) (65,59,32) (65,59,32) (65,59,32) (65,59,32) (65,59,32) (88,93,85) (30,37,22)
(65,59,32) (65,59,32) (65,59,32) (65,59,32) (65,59,32) (67,61,36) (93,107,105) (21,29,12)
(65,59,32) (65,59,32) (65,59,32) (65,59,32) (65,59,32) (92,96,91) (91,104,98) (19,21,4)
(65,59,32) (65,59,32) (65,59,32) (65,59,32) (105,107,101) (132,140,140) (82,90,87) (50,53,44)
(65,59,32) (65,59,32) (65,59,32) (137,135,126) (190,196,198) (158,169,173) (89,97,102) (112,121,115)
(65,59,32) (71,65,38) (164,163,159) (167,172,175) (125,135,143) (91,100,109) (119,131,133) (73,78,64)
(107,104,98) (142,140,141) (121,123,129) (128,132,137) (131,135,139) (137,143,142) (89,97,88) (12,14,1)
(178,177,178) (215,214,213) (223,219,217) (247,243,237) (218,215,209) (159,164,160) (43,50,39) (2,5,0)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 349×194; shape box=(56.00,52.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(78,75,21) (80,83,36) (84,90,48) (53,49,7) (56,48,2) (71,75,17) (88,89,29) (87,88,32) (103,105,30) (123,124,48) (100,101,53) (79,79,18) (120,120,31) (120,122,70) (166,161,87) (171,166,66) (168,161,85)`; luma: `71.7,79.0,85.7,46.8,46.4,70.0,84.5,83.7,99.2,118.3,97.3,74.6,113.6,117.8,156.7,159.8,157.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -2, -1] px; max ΔY=25.4); edge at −1 RGB=(87,88,32), Y=83.7; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-50.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(97,88,88) (141,124,115) (130,112,102) (106,89,81) (104,92,85) (95,82,74) (91,78,70) (94,81,74) (91,78,69) (84,70,61) (129,111,87) (157,145,91) (123,113,68) (73,71,61) (78,81,80) (111,116,115) (125,131,109)`; luma: `89.9,127.0,115.1,92.0,94.0,84.2,80.2,83.3,80.1,72.3,113.1,143.7,111.9,70.7,80.3,114.9,128.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 4/8 ([-7, -6, -2, -1] px; max ΔY=37.1); edge at −1 RGB=(94,81,74), Y=83.3; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+3.8 Y.
- left: RGB distances −8..+8: `(229,125,185) (225,76,150) (235,110,178) (242,169,218) (236,146,202) (232,122,188) (234,143,198) (236,168,205) (237,173,204) (239,173,209) (245,181,221) (209,154,187) (144,86,95) (179,41,73) (236,74,138) (236,106,165) (234,120,174)`; luma: `151.4,113.0,141.5,188.1,169.2,150.2,166.3,185.1,188.8,189.6,197.5,168.1,99.0,72.6,113.1,137.9,148.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -2, -1] px; max ΔY=38.4); edge at −1 RGB=(236,168,205), Y=185.1; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+68.1 Y.
**top-left 8×8 RGB:**

```text
(60,58,11) (51,53,7) (35,39,1) (34,41,1) (66,73,3) (91,82,5) (105,79,2) (144,110,6)
(44,48,6) (55,62,7) (58,68,4) (57,65,4) (85,91,16) (76,79,16) (58,59,12) (65,66,19)
(64,78,18) (65,76,21) (86,98,34) (77,86,18) (87,92,21) (90,88,21) (74,71,14) (12,15,4)
(96,113,55) (77,91,40) (101,114,59) (107,123,54) (102,112,37) (106,104,28) (73,67,10) (43,38,5)
(92,104,49) (67,79,37) (75,87,41) (116,132,65) (118,126,60) (79,77,27) (33,31,3) (58,51,9)
(78,87,21) (58,64,16) (54,58,14) (98,100,40) (102,96,43) (35,31,13) (28,24,1) (72,62,9)
(83,85,14) (67,68,7) (47,50,0) (75,68,14) (106,88,34) (70,63,22) (47,43,5) (24,25,3)
(93,99,44) (88,93,34) (69,73,7) (94,90,23) (110,98,48) (42,41,16) (11,17,1) (12,16,1)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 283×128; shape box=(23.00,19.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (204,204,204) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (23,116,218) (23,116,218) (23,116,218) (23,116,218)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,204.0,85.0,85.0,85.0,85.0,103.6,103.6,103.6,103.6`; alpha: `5,5,8,9,11,13,16,48,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=48; inner 0–3 px mean lift over 5–8 px=+11.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (204,204,204) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,204.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0`; alpha: `12,13,16,19,22,24,27,58,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+29.8 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (204,204,204) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,204.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0`; alpha: `21,24,27,30,34,37,40,69,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=69; inner 0–3 px mean lift over 5–8 px=+29.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (204,204,204) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,204.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0`; alpha: `12,14,16,18,22,24,27,59,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+29.8 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (158,158,158) (187,187,187)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (109,109,109) (181,181,181) (173,173,173) (134,134,134)
(0,0,0) (0,0,0) (0,0,0) (122,122,122) (188,188,188) (154,154,154) (103,103,103) (85,85,85)
(0,0,0) (0,0,0) (109,109,109) (187,187,187) (146,146,146) (88,88,88) (85,85,85) (85,85,85)
(0,0,0) (0,0,0) (181,181,181) (154,154,154) (88,88,88) (85,85,85) (85,85,85) (85,85,85)
(0,0,0) (156,156,156) (173,173,173) (103,103,103) (85,85,85) (85,85,85) (85,85,85) (77,89,102)
(0,0,0) (187,187,187) (134,134,134) (85,85,85) (85,85,85) (85,85,85) (77,89,102) (44,106,173)
```
**bottom-right 8×8 RGB:**

```text
(85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (134,134,134) (185,185,185) (0,0,0)
(85,85,85) (85,85,85) (85,85,85) (85,85,85) (104,104,104) (175,175,175) (148,148,148) (0,0,0)
(85,85,85) (85,85,85) (85,85,85) (87,87,87) (154,154,154) (181,181,181) (0,0,0) (0,0,0)
(85,85,85) (85,85,85) (90,90,90) (146,146,146) (188,188,188) (91,91,91) (0,0,0) (0,0,0)
(85,85,85) (101,101,101) (153,153,153) (187,187,187) (109,109,109) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (176,176,176) (179,179,179) (87,87,87) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(185,185,185) (144,144,144) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark-contrast\photo\context

Case: context; appearance=dark-contrast; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 212×205; shape box=(56.00,56.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(175,118,117) (133,74,51) (230,131,63) (190,89,27) (152,83,31) (188,123,60) (190,126,71) (165,100,53) (106,75,54) (66,47,23) (62,43,18) (61,41,17) (62,39,15) (66,36,14) (70,35,14) (71,33,12) (71,33,12)`; luma: `130.0,84.9,147.1,106.0,93.9,132.3,135.6,110.4,80.1,49.3,45.2,43.5,42.2,40.8,40.9,39.6,39.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-7, -6, -5, -4, -1] px; max ΔY=45.2); edge at −1 RGB=(165,100,53), Y=110.4; composited; inner 0–3 px mean lift over 5–8 px=+14.3 Y.
- right: RGB distances −8..+8: `(246,166,16) (240,161,3) (252,215,22) (214,157,40) (235,156,25) (249,140,10) (207,90,17) (213,106,20) (65,37,4) (63,37,6) (60,38,6) (61,37,6) (59,38,5) (62,38,4) (65,37,4) (64,38,3) (64,38,3)`; luma: `172.2,166.4,208.9,160.7,163.3,153.8,109.6,122.5,40.6,40.3,40.4,39.9,40.1,40.6,40.6,41.0,41.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=62.6); edge at −1 RGB=(213,106,20), Y=122.5; composited; inner 0–3 px mean lift over 5–8 px=-0.5 Y.
- bottom: RGB distances −8..+8: `(80,73,71) (16,13,11) (7,7,3) (10,10,4) (10,10,4) (10,9,3) (10,9,4) (8,9,3) (92,77,68) (58,45,39) (53,41,32) (48,40,28) (46,40,24) (44,39,24) (44,38,25) (43,38,23) (43,38,22)`; luma: `74.3,13.5,6.7,9.6,9.6,8.8,8.9,8.4,79.5,47.3,42.9,40.8,40.1,39.0,38.3,38.0,37.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=67.6); edge at −1 RGB=(8,9,3), Y=8.4; composited; inner 0–3 px mean lift over 5–8 px=+14.4 Y.
- left: RGB distances −8..+8: `(85,89,16) (77,80,19) (82,79,21) (96,92,26) (108,106,31) (144,141,109) (229,235,234) (208,193,155) (51,40,23) (56,39,26) (50,42,22) (49,42,23) (51,41,24) (52,41,24) (50,42,24) (51,42,24) (51,42,24)`; luma: `82.9,75.0,75.5,88.1,101.0,139.3,233.7,193.4,41.1,41.7,42.3,42.1,41.9,42.1,42.4,42.6,42.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=150.8); edge at −1 RGB=(208,193,155), Y=193.4; composited; inner 0–3 px mean lift over 5–8 px=-0.6 Y.
**top-left 8×8 RGB:**

```text
(142,130,113) (152,142,111) (179,124,83) (208,142,108) (159,132,123) (156,141,134) (141,129,120) (120,111,106)
(134,121,90) (151,146,104) (159,120,61) (211,122,40) (175,121,82) (155,137,126) (122,110,100) (84,69,56)
(122,112,56) (166,162,102) (145,144,101) (152,117,41) (153,117,50) (100,80,53) (54,41,21) (53,41,21)
(132,137,55) (181,170,108) (172,173,140) (121,121,78) (74,58,30) (52,42,21) (51,42,21) (50,42,21)
(140,138,56) (191,170,102) (168,158,124) (65,52,32) (51,42,21) (50,42,21) (51,43,21) (52,43,21)
(154,139,65) (204,147,84) (106,82,56) (50,41,20) (49,41,20) (50,42,21) (52,43,21) (52,43,20)
(189,142,84) (178,108,62) (51,41,20) (49,41,20) (50,42,21) (51,42,21) (51,42,20) (52,41,21)
(217,141,88) (105,62,35) (50,41,20) (49,41,20) (52,42,21) (51,42,20) (51,42,21) (52,41,19)
```
**bottom-right 8×8 RGB:**

```text
(44,42,17) (44,41,19) (44,41,19) (43,41,18) (44,41,19) (43,41,18) (51,52,22) (71,84,4)
(44,42,19) (44,42,19) (43,42,19) (42,42,18) (43,41,18) (42,41,18) (57,64,6) (64,77,0)
(44,43,20) (44,43,19) (42,42,19) (43,41,20) (42,41,19) (47,46,30) (80,82,50) (102,106,70)
(43,43,20) (43,43,20) (44,43,21) (44,42,20) (55,55,38) (116,121,130) (118,122,133) (115,119,131)
(44,43,22) (43,43,21) (43,43,21) (56,53,36) (91,87,80) (95,91,85) (86,83,76) (90,88,83)
(44,44,21) (42,42,21) (98,96,83) (154,149,142) (156,152,148) (146,142,140) (132,128,125) (120,118,117)
(82,81,69) (133,130,128) (167,165,166) (169,168,167) (154,155,156) (138,137,140) (129,129,131) (120,120,121)
(164,159,160) (166,163,163) (169,168,169) (146,145,147) (142,143,146) (137,138,141) (131,133,134) (107,109,110)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 212×205; shape box=(56.00,52.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(163,140,72) (160,136,59) (159,140,33) (136,126,13) (100,96,3) (84,82,3) (111,106,8) (104,98,10) (97,92,14) (95,91,18) (46,47,2) (137,94,41) (215,107,52) (226,126,73) (200,120,69) (188,105,88) (232,76,119)`; luma: `140.0,135.5,136.3,120.0,90.1,76.7,100.0,92.9,87.4,86.6,43.5,99.3,126.0,143.4,133.3,121.4,112.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-5, -4, -3, -2, -1] px; max ΔY=63.3); edge at −1 RGB=(104,98,10), Y=92.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-48.4 Y.
- right: RGB distances −8..+8: `(83,60,38) (159,110,74) (173,121,82) (170,122,85) (156,111,78) (141,100,74) (113,75,51) (77,40,20) (140,63,83) (237,117,182) (238,76,148) (186,34,70) (174,98,49) (199,174,143) (248,221,219) (206,133,148) (188,109,88)`; luma: `63.3,117.8,129.2,129.5,118.2,106.8,81.3,46.4,80.8,147.2,115.6,68.9,110.6,177.1,226.6,149.6,124.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=66.2); edge at −1 RGB=(77,40,20), Y=46.4; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-66.2 Y.
- bottom: RGB distances −8..+8: `(9,10,2) (49,48,19) (39,25,10) (35,31,5) (45,44,10) (38,33,13) (42,48,15) (60,80,27) (27,37,4) (38,47,19) (107,120,60) (104,117,67) (52,58,40) (33,41,9) (24,38,3) (38,41,8) (114,120,97)`; luma: `9.2,46.1,26.9,30.0,41.8,32.6,44.3,71.9,32.5,43.1,112.9,110.6,55.4,37.0,32.5,38.0,117.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=62.7); edge at −1 RGB=(60,80,27), Y=71.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+18.6 Y.
- left: RGB distances −8..+8: `(21,27,12) (49,57,29) (15,18,10) (2,2,2) (3,5,3) (3,5,3) (8,11,7) (19,28,16) (37,48,53) (81,99,157) (84,95,150) (112,117,145) (140,139,125) (151,153,144) (146,149,164) (184,193,208) (171,191,234)`; luma: `24.6,53.3,16.8,2.0,4.4,4.4,10.1,25.2,46.0,99.4,96.6,118.0,138.2,151.9,149.4,192.2,189.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -3, -2] px; max ΔY=28.6); edge at −1 RGB=(19,28,16), Y=25.2; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-80.9 Y.
**top-left 8×8 RGB:**

```text
(46,40,4) (42,43,12) (94,106,47) (93,106,42) (85,98,36) (75,91,27) (9,11,3) (17,19,46)
(14,19,2) (13,18,2) (75,85,42) (121,138,75) (91,108,52) (83,100,45) (33,38,19) (11,11,30)
(21,27,13) (22,26,14) (44,50,27) (130,146,88) (110,128,75) (92,109,61) (61,73,39) (27,32,69)
(25,29,13) (30,36,20) (22,26,13) (64,74,44) (121,139,83) (107,127,69) (69,82,53) (58,57,100)
(18,22,8) (26,33,16) (32,42,24) (14,22,0) (55,65,34) (118,139,72) (54,65,26) (29,32,28)
(10,13,1) (13,20,7) (43,54,35) (25,35,7) (11,17,4) (93,102,58) (94,98,57) (56,59,46)
(21,23,10) (10,18,4) (13,21,0) (23,32,1) (12,15,3) (102,103,66) (79,81,50) (48,54,44)
(101,94,84) (84,80,72) (71,70,61) (75,76,63) (84,84,61) (117,119,89) (75,75,62) (50,52,42)
```
**bottom-right 8×8 RGB:**

```text
(119,114,106) (117,114,114) (113,109,110) (86,82,82) (60,62,66) (68,71,78) (79,81,90) (93,95,103)
(128,119,114) (113,104,100) (112,103,101) (123,115,117) (138,123,116) (131,120,113) (103,99,98) (84,84,89)
(118,109,112) (120,110,112) (127,118,120) (128,120,123) (139,130,131) (141,133,134) (137,130,133) (134,126,128)
(125,119,124) (114,110,114) (111,108,112) (113,108,111) (106,102,107) (105,102,107) (108,106,111) (116,113,118)
(95,93,99) (99,97,103) (105,102,108) (108,104,110) (102,99,106) (104,101,105) (97,95,101) (110,109,118)
(99,96,100) (93,91,96) (99,96,103) (107,104,109) (103,102,108) (104,104,109) (106,105,114) (140,136,145)
(102,100,105) (99,96,104) (104,101,109) (110,109,117) (132,133,142) (152,147,153) (123,115,108) (110,106,106)
(100,93,92) (93,87,88) (119,116,121) (147,144,151) (161,152,155) (152,139,140) (162,150,149) (140,132,131)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 146×139; shape box=(23.00,19.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,28.0,28.0`; alpha: `6,7,10,12,14,16,19,51,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0`; alpha: `14,15,19,22,26,30,33,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,28.0,28.0`; alpha: `25,28,33,37,41,44,48,77,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=77; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0`; alpha: `13,17,19,22,26,29,33,63,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=63; inner 0–3 px mean lift over 5–8 px=+16.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (115,115,115) (98,98,98)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (98,98,98) (98,98,98) (51,51,51) (37,37,37)
(0,0,0) (0,0,0) (0,0,0) (99,99,99) (82,82,82) (42,42,42) (29,29,29) (29,29,29)
(0,0,0) (0,0,0) (97,97,97) (80,80,80) (39,39,39) (29,29,29) (29,29,29) (29,29,29)
(0,0,0) (56,56,56) (98,98,98) (41,41,41) (28,28,28) (28,28,28) (29,29,29) (29,29,29)
(0,0,0) (107,107,107) (51,51,51) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)
(34,34,34) (96,96,96) (35,35,35) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)
```
**bottom-right 8×8 RGB:**

```text
(28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (36,36,36) (92,92,92) (34,34,34)
(28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (51,51,51) (101,101,101) (0,0,0)
(29,29,29) (29,29,29) (28,28,28) (28,28,28) (41,41,41) (95,95,95) (49,49,49) (0,0,0)
(29,29,29) (29,29,29) (29,29,29) (39,39,39) (79,79,79) (81,81,81) (0,0,0) (0,0,0)
(29,29,29) (29,29,29) (42,42,42) (80,80,80) (90,90,90) (0,0,0) (0,0,0) (0,0,0)
(37,37,37) (51,51,51) (97,97,97) (82,82,82) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(98,98,98) (106,106,106) (47,47,47) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(28,28,28) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark-contrast\photo\submenu

Case: submenu; appearance=dark-contrast; background=photo; opened=True.

Visible captured menu windows: 2.

Nested submenu result: parent plus 1 submenu window(s) captured.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`, `attempt-1-runtime-1.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 420×218; shape box=(56.00,56.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(59,50,29) (67,57,41) (73,63,50) (72,62,50) (70,62,49) (70,64,52) (70,65,55) (73,64,48) (104,80,55) (67,52,24) (62,49,22) (60,47,21) (59,46,20) (24,117,219) (23,117,219) (23,116,218) (23,116,218)`; luma: `50.4,58.0,64.2,63.3,62.8,64.4,65.3,64.8,83.3,53.2,49.8,47.9,46.9,104.6,104.4,103.6,103.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=14.9); edge at −1 RGB=(73,64,48), Y=64.8; composited; inner 0–3 px mean lift over 5–8 px=-45.5 Y.
- right: RGB distances −8..+8: `(51,36,14) (51,36,14) (50,36,15) (50,36,15) (49,36,16) (47,35,17) (46,35,17) (46,35,17) (45,34,19) (43,34,20) (43,33,20) (42,33,21) (44,34,20) (64,39,11) (67,39,11) (67,39,12) (68,39,12)`; luma: `37.6,37.6,37.5,37.5,37.3,36.3,36.0,36.0,35.3,34.9,34.2,34.0,35.1,42.3,42.9,43.0,43.2`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=1.6); edge at −1 RGB=(46,35,17), Y=36.0; composited; inner 0–3 px mean lift over 5–8 px=-8.3 Y.
- bottom: RGB distances −8..+8: `(54,60,14) (148,159,106) (156,168,131) (139,147,102) (158,173,130) (145,156,111) (110,114,51) (125,130,59) (84,84,55) (54,54,28) (50,50,24) (48,48,23) (47,47,22) (46,46,20) (46,46,20) (45,45,19) (45,45,18)`; luma: `55.4,152.8,162.8,142.1,166.7,150.4,108.6,123.8,81.9,52.1,48.1,46.2,45.2,44.1,44.1,43.1,43.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=111.3); edge at −1 RGB=(125,130,59), Y=123.8; composited; inner 0–3 px mean lift over 5–8 px=+13.5 Y.
- left: RGB distances −8..+8: `(34,48,3) (35,51,3) (57,76,4) (26,47,3) (22,41,1) (35,53,1) (54,76,5) (52,71,2) (38,44,26) (39,44,28) (40,44,30) (39,43,30) (40,44,30) (40,45,30) (39,45,30) (39,45,30) (40,45,30)`; luma: `41.8,44.1,66.8,39.4,34.1,45.4,66.2,62.0,41.4,41.8,42.1,41.2,42.1,42.9,42.6,42.6,42.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 4/8 ([-6, -4, -2, -1] px; max ΔY=25.0); edge at −1 RGB=(52,71,2), Y=62.0; composited; inner 0–3 px mean lift over 5–8 px=-1.1 Y.
**top-left 8×8 RGB:**

```text
(96,101,16) (43,46,11) (38,42,2) (32,37,0) (23,30,1) (29,35,3) (50,59,8) (93,95,8)
(93,101,26) (111,121,69) (111,122,73) (71,81,40) (32,41,4) (52,60,1) (77,83,13) (77,78,25)
(54,67,9) (45,59,19) (82,97,54) (135,151,114) (114,127,88) (66,68,27) (46,47,20) (46,47,20)
(59,75,17) (41,56,12) (35,48,3) (68,80,45) (64,66,40) (46,47,20) (46,47,20) (46,47,20)
(66,86,32) (55,71,23) (45,57,14) (53,53,27) (45,46,20) (45,46,20) (45,46,20) (46,47,20)
(84,104,71) (55,70,29) (50,56,23) (44,45,19) (44,45,19) (44,45,19) (45,46,19) (45,46,19)
(122,144,127) (51,62,30) (44,45,19) (44,45,19) (44,45,19) (44,45,19) (44,45,19) (35,75,103)
(67,78,44) (52,58,24) (43,45,19) (43,45,19) (43,45,19) (44,45,19) (35,75,104) (24,113,209)
```
**bottom-right 8×8 RGB:**

```text
(48,42,14) (48,42,14) (48,42,14) (49,42,14) (50,41,14) (53,40,14) (69,67,24) (96,109,18)
(47,42,15) (48,42,15) (48,42,15) (49,41,14) (53,40,14) (54,40,14) (85,94,28) (101,114,23)
(48,43,15) (49,42,15) (48,42,15) (51,41,15) (52,40,15) (81,83,35) (105,118,31) (92,104,24)
(49,43,17) (49,43,17) (52,42,16) (53,41,16) (61,52,24) (138,150,63) (130,141,44) (66,76,15)
(50,42,17) (53,42,17) (53,42,17) (64,59,26) (120,134,45) (149,161,55) (126,138,45) (51,61,14)
(52,42,17) (53,41,17) (69,70,25) (107,122,33) (138,153,50) (143,155,44) (85,95,27) (63,70,16)
(59,57,26) (72,80,16) (104,117,25) (129,143,45) (143,156,47) (115,126,36) (38,45,6) (67,76,7)
(62,71,3) (98,109,18) (121,133,33) (136,150,45) (135,148,41) (38,44,11) (28,36,2) (78,89,4)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 342×218; shape box=(56.00,52.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(143,88,45) (96,44,0) (72,34,5) (14,5,0) (75,51,31) (107,78,50) (124,89,56) (126,92,57) (136,91,58) (178,123,75) (216,142,73) (207,92,87) (186,80,138) (139,69,125) (122,57,114) (101,44,90) (87,65,76)`; luma: `96.6,51.9,40.0,6.6,54.7,82.1,94.1,96.7,98.2,131.2,152.8,116.1,106.7,87.9,74.9,59.4,70.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-7, -6, -5, -4, -3] px; max ΔY=90.0); edge at −1 RGB=(126,92,57), Y=96.7; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+51.4 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(104,98,50) (66,84,67) (72,86,51) (94,103,51) (140,136,76) (179,165,120) (131,125,100) (55,60,36) (38,47,15) (35,42,6) (100,93,67) (170,158,159) (129,126,103) (87,98,41) (108,109,66) (113,91,79) (125,101,78)`; luma: `95.8,78.9,80.5,97.3,132.5,164.7,124.5,57.2,42.8,37.9,92.6,160.6,125.0,91.5,105.7,94.8,104.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=68.9); edge at −1 RGB=(55,60,36), Y=57.2; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-15.6 Y.
- left: RGB distances −8..+8: `(241,143,216) (239,125,193) (241,122,194) (233,151,202) (206,93,135) (224,117,170) (231,131,191) (223,88,156) (229,68,147) (243,157,212) (241,171,218) (234,128,193) (232,124,190) (234,144,199) (237,171,207) (236,175,205) (239,175,210)`; luma: `169.1,154.1,152.5,172.1,120.1,143.6,156.6,121.6,107.9,179.3,189.3,155.2,151.7,167.1,187.6,190.1,191.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=49.0); edge at −1 RGB=(223,88,156), Y=121.6; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-26.1 Y.
**top-left 8×8 RGB:**

```text
(97,98,33) (126,145,87) (129,154,94) (109,132,76) (90,107,45) (80,94,28) (79,95,23) (104,115,28)
(118,93,18) (116,129,72) (123,148,95) (112,137,81) (105,126,62) (104,123,57) (110,125,59) (86,93,37)
(107,95,16) (107,115,50) (118,144,90) (110,137,82) (110,134,78) (100,117,71) (74,83,41) (46,50,11)
(187,117,2) (178,141,33) (152,155,75) (135,148,80) (88,95,44) (25,28,12) (11,13,0) (42,45,2)
(126,85,7) (135,93,12) (176,141,45) (163,143,52) (83,77,13) (29,33,0) (27,30,2) (69,69,6)
(23,19,7) (44,28,3) (125,93,23) (182,139,28) (114,98,16) (34,36,4) (24,27,3) (80,79,11)
(93,54,3) (105,70,13) (125,86,8) (160,101,0) (120,93,11) (46,47,10) (31,33,5) (65,63,12)
(161,96,1) (144,93,12) (121,91,16) (97,74,5) (61,59,4) (32,39,2) (31,34,2) (58,57,12)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 276×152; shape box=(23.00,19.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (24,117,219) (23,117,219) (23,116,218) (23,116,218)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,104.6,104.4,103.6,103.6`; alpha: `5,7,9,11,13,16,19,51,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=-51.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0`; alpha: `13,15,19,23,25,29,33,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,28.0,28.0`; alpha: `25,30,33,37,41,44,48,76,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=76; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0`; alpha: `13,15,20,22,26,29,32,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (115,115,115) (98,98,98)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (98,98,98) (99,99,99) (51,51,51) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (98,98,98) (82,82,82) (42,42,42) (29,29,29) (29,29,29)
(0,0,0) (0,0,0) (95,95,95) (80,80,80) (39,39,39) (29,29,29) (29,29,29) (29,29,29)
(0,0,0) (56,56,56) (98,98,98) (41,41,41) (28,28,28) (28,28,28) (29,29,29) (29,29,29)
(0,0,0) (107,107,107) (51,51,51) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (26,65,108)
(34,34,34) (96,96,96) (35,35,35) (28,28,28) (28,28,28) (28,28,28) (26,65,108) (23,114,214)
```
**bottom-right 8×8 RGB:**

```text
(28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (35,35,35) (95,95,95) (30,30,30)
(28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (51,51,51) (101,101,101) (0,0,0)
(29,29,29) (29,29,29) (28,28,28) (28,28,28) (41,41,41) (96,96,96) (48,48,48) (0,0,0)
(29,29,29) (29,29,29) (29,29,29) (39,39,39) (80,80,80) (86,86,86) (0,0,0) (0,0,0)
(29,29,29) (29,29,29) (42,42,42) (81,81,81) (90,90,90) (0,0,0) (0,0,0) (0,0,0)
(36,36,36) (51,51,51) (97,97,97) (85,85,85) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(97,97,97) (105,105,105) (48,48,48) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(28,28,28) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-1 — display

Image `attempt-1-display.png`: 420×218; shape box=(281.00,56.00,83.00,82.00) px.
- top: RGB distances −8..+8: `(40,29,13) (42,29,11) (90,64,32) (216,189,135) (163,129,83) (104,67,34) (197,181,161) (167,139,111) (88,76,61) (54,45,31) (49,40,28) (48,38,25) (48,37,25) (47,35,24) (47,35,24) (46,34,23) (45,33,23)`; luma: `30.2,30.5,67.2,190.8,132.9,72.5,183.0,142.9,77.5,45.9,41.0,39.2,38.5,36.8,36.8,35.8,34.8`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=160.7); edge at −1 RGB=(167,139,111), Y=142.9; composited; inner 0–3 px mean lift over 5–8 px=+14.9 Y.
- right: RGB distances −8..+8: `(84,91,54) (75,81,43) (61,68,31) (66,73,35) (52,55,24) (10,10,0) (12,15,1) (60,67,32) (41,37,22) (45,35,20) (44,37,21) (43,37,22) (44,37,22) (45,36,21) (44,35,21) (43,35,22) (42,35,22)`; luma: `86.8,77.0,63.8,68.8,52.1,9.3,13.4,63.0,36.8,36.0,37.3,37.2,37.4,36.8,35.9,35.8,35.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=77.6); edge at −1 RGB=(60,67,32), Y=63.0; composited; inner 0–3 px mean lift over 5–8 px=+0.8 Y.
- bottom: RGB distances −8..+8: `(207,137,154) (143,78,78) (118,38,32) (190,53,46) (185,21,25) (205,62,52) (223,109,98) (233,83,94) (103,73,61) (63,43,28) (62,40,23) (60,38,21) (58,37,21) (57,36,23) (58,37,23) (58,36,20) (59,36,19)`; luma: `153.1,91.8,54.6,81.6,56.2,91.7,132.4,115.7,78.5,46.2,43.4,41.4,40.3,39.5,40.5,39.5,39.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=98.5); edge at −1 RGB=(233,83,94), Y=115.7; composited; inner 0–3 px mean lift over 5–8 px=+12.6 Y.
- left: RGB distances −8..+8: `(68,39,16) (68,39,16) (68,39,16) (68,39,16) (67,39,16) (67,39,16) (63,40,16) (61,41,16) (40,33,26) (39,34,27) (42,35,25) (44,36,26) (44,36,25) (44,36,25) (45,36,24) (45,36,24) (46,36,24)`; luma: `43.5,43.5,43.5,43.5,43.3,43.3,43.2,43.4,34.0,34.6,35.8,37.0,36.9,36.9,37.0,37.0,37.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.3); edge at −1 RGB=(61,41,16), Y=43.4; composited; inner 0–3 px mean lift over 5–8 px=-1.7 Y.
**top-left 8×8 RGB:**

```text
(224,122,142) (232,137,152) (217,119,134) (184,81,87) (201,115,118) (96,55,44) (147,94,34) (198,107,65)
(171,58,74) (216,111,127) (225,131,152) (231,146,161) (195,144,149) (80,57,27) (160,114,49) (112,67,46)
(157,58,61) (188,89,89) (197,97,103) (213,128,130) (119,82,81) (80,58,36) (49,37,33) (48,37,35)
(82,48,41) (106,32,28) (125,36,29) (165,96,89) (65,45,41) (46,36,35) (47,37,34) (49,37,33)
(64,41,31) (78,50,41) (148,74,66) (66,47,43) (45,36,35) (47,37,34) (50,37,33) (51,37,33)
(62,40,30) (61,40,30) (80,52,47) (44,35,35) (46,36,34) (50,38,33) (51,37,34) (51,37,34)
(61,40,30) (61,40,32) (45,36,34) (45,36,34) (48,37,34) (49,37,33) (50,37,33) (50,37,34)
(59,40,30) (59,42,37) (43,36,35) (45,36,34) (48,37,34) (49,37,34) (48,37,35) (49,37,37)
```
**bottom-right 8×8 RGB:**

```text
(53,36,25) (52,35,25) (51,35,25) (52,36,26) (53,36,26) (54,36,26) (118,98,96) (241,199,214)
(53,35,25) (52,35,25) (52,36,26) (53,36,26) (55,36,26) (54,36,25) (202,169,175) (245,163,184)
(54,37,26) (55,37,27) (55,37,26) (55,36,26) (55,36,26) (137,106,94) (240,175,178) (248,145,167)
(56,37,26) (56,37,27) (57,37,27) (56,37,27) (75,48,40) (225,178,144) (245,150,151) (248,136,157)
(57,37,27) (58,38,26) (56,37,26) (89,56,42) (216,151,97) (246,185,139) (246,133,130) (244,142,164)
(58,38,26) (57,37,26) (127,70,40) (218,119,47) (242,154,79) (239,144,94) (241,119,120) (246,173,192)
(91,62,53) (159,84,47) (211,108,34) (221,115,35) (233,123,47) (234,118,71) (233,127,131) (252,189,208)
(229,201,199) (186,143,115) (197,113,28) (219,125,36) (222,126,58) (220,121,90) (220,139,151) (195,127,146)
```

### menu-window-1 — single-window

Image `attempt-1-window-1-single.png`: 195×194; shape box=(56.00,52.00,83.00,82.00) px.
- top: RGB distances −8..+8: `(116,109,4) (116,111,3) (140,132,11) (126,118,15) (108,103,17) (77,76,11) (34,41,1) (104,79,22) (138,89,35) (129,94,35) (105,79,34) (212,89,119) (227,134,146) (234,183,159) (216,116,106) (162,27,44) (188,36,59)`; luma: `102.9,104.3,125.0,112.3,97.9,71.5,36.6,80.2,95.5,97.2,81.3,117.3,154.6,192.1,136.5,56.9,70.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-6, -5, -3, -2, -1] px; max ΔY=66.3); edge at −1 RGB=(104,79,22), Y=80.2; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-16.1 Y.
- right: RGB distances −8..+8: `(68,46,28) (170,120,138) (251,124,191) (164,66,102) (196,108,139) (215,117,141) (148,96,58) (214,173,146) (204,132,70) (101,98,7) (100,101,33) (102,106,32) (160,118,76) (114,74,34) (105,52,24) (95,54,33) (206,80,121)`; luma: `49.4,131.9,155.8,89.4,128.9,139.6,104.3,179.8,142.8,92.1,95.9,99.8,123.9,79.6,61.2,61.2,109.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=130.4); edge at −1 RGB=(214,173,146), Y=179.8; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+29.7 Y.
- bottom: RGB distances −8..+8: `(78,73,70) (38,45,28) (42,40,22) (28,9,4) (63,72,3) (96,96,19) (45,29,15) (37,49,18) (41,61,11) (56,59,20) (143,143,84) (65,80,26) (33,41,6) (30,36,1) (21,35,2) (67,72,34) (147,158,152)`; luma: `73.8,42.3,39.1,12.7,65.1,90.4,31.4,44.2,53.1,55.5,138.7,72.9,36.8,32.2,29.6,68.2,155.2`; alpha: `253,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=61.2); edge at −1 RGB=(37,49,18), Y=44.2; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+8.8 Y.
- left: RGB distances −8..+8: `(22,25,25) (49,57,57) (62,80,99) (91,101,99) (133,130,89) (136,144,145) (113,119,129) (182,194,230) (106,113,123) (103,111,152) (101,122,179) (142,169,223) (115,137,181) (70,92,96) (120,141,165) (98,126,128) (84,114,132)`; luma: `24.4,55.3,77.5,98.7,127.7,142.4,118.4,194.0,112.2,112.3,121.7,167.2,135.5,87.6,138.3,120.2,108.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=169.7); edge at −1 RGB=(182,194,230), Y=194.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+14.6 Y.
**top-left 8×8 RGB:**

```text
(102,117,62) (73,80,39) (37,42,28) (22,32,15) (48,59,11) (51,59,60) (55,63,49) (52,60,30)
(89,91,55) (89,91,58) (54,60,47) (35,45,21) (47,60,15) (27,35,0) (56,67,46) (59,71,58)
(113,114,81) (73,75,57) (41,44,35) (31,40,20) (50,61,21) (45,51,17) (72,80,29) (67,78,21)
(91,91,76) (75,74,63) (39,45,25) (26,39,3) (38,48,9) (59,65,17) (83,92,22) (78,88,14)
(41,47,46) (42,47,29) (44,53,26) (31,48,4) (48,63,16) (71,77,26) (159,150,82) (131,130,80)
(116,109,60) (160,143,91) (118,120,107) (61,74,35) (153,148,107) (181,164,118) (172,155,110) (157,149,123)
(106,94,41) (135,112,43) (123,119,63) (82,88,65) (154,133,80) (182,159,99) (172,150,93) (188,175,129)
(93,101,94) (131,126,98) (181,161,102) (93,90,45) (113,106,60) (166,151,101) (198,183,144) (174,157,106)
```
**bottom-right 8×8 RGB:**

```text
(139,124,111) (133,121,119) (125,115,112) (125,115,115) (133,125,125) (123,117,111) (116,113,112) (112,108,109)
(114,105,102) (110,101,102) (134,124,121) (147,134,128) (123,114,113) (124,116,113) (115,105,102) (113,104,103)
(138,125,123) (146,135,134) (125,118,120) (109,106,112) (108,104,110) (119,111,115) (121,112,114) (126,118,121)
(119,110,108) (107,102,104) (90,90,95) (96,96,102) (107,105,110) (117,113,118) (112,108,114) (108,105,110)
(113,107,112) (120,115,120) (122,116,121) (113,110,116) (97,95,102) (89,87,93) (94,92,97) (103,100,106)
(107,101,103) (105,99,101) (106,99,102) (111,107,111) (106,102,108) (108,105,110) (101,98,104) (102,99,105)
(108,105,109) (102,98,101) (117,109,109) (127,118,117) (104,98,97) (93,88,89) (87,83,89) (107,105,113)
(126,120,126) (112,108,114) (98,97,104) (104,103,110) (114,112,116) (122,116,116) (139,128,125) (154,143,139)
```

### menu-window-1 — cgwindow

Image `attempt-1-window-1-cgwindow.png`: 129×128; shape box=(23.00,19.00,83.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (27,27,27) (27,27,27)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,27.0,27.0`; alpha: `5,7,9,11,14,16,19,52,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=52; inner 0–3 px mean lift over 5–8 px=+24.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (27,27,27) (27,27,27) (27,27,27) (27,27,27) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,27.0,27.0,27.0,27.0,28.0,28.0,28.0,28.0`; alpha: `13,16,19,21,25,29,33,63,196,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=63; inner 0–3 px mean lift over 5–8 px=+16.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,28.0,28.0`; alpha: `25,28,33,36,40,44,48,76,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=76; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (27,27,27) (27,27,27) (27,27,27) (27,27,27) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,27.0,27.0,27.0,27.0,28.0,28.0,28.0,28.0`; alpha: `14,16,19,22,26,29,32,64,196,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (39,39,39)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (117,117,117) (98,98,98)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (98,98,98) (98,98,98) (52,52,52) (37,37,37)
(0,0,0) (0,0,0) (0,0,0) (99,99,99) (81,81,81) (42,42,42) (29,29,29) (29,29,29)
(0,0,0) (0,0,0) (97,97,97) (80,80,80) (39,39,39) (29,29,29) (29,29,29) (29,29,29)
(0,0,0) (56,56,56) (99,99,99) (41,41,41) (28,28,28) (29,29,29) (29,29,29) (29,29,29)
(0,0,0) (107,107,107) (51,51,51) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)
(34,34,34) (95,95,95) (35,35,35) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)
```
**bottom-right 8×8 RGB:**

```text
(28,28,28) (28,28,28) (28,28,28) (27,27,27) (27,27,27) (34,34,34) (95,95,95) (30,30,30)
(28,28,28) (28,28,28) (28,28,28) (27,27,27) (27,27,27) (50,50,50) (101,101,101) (0,0,0)
(29,29,29) (29,29,29) (29,29,29) (27,27,27) (40,40,40) (96,96,96) (49,49,49) (0,0,0)
(29,29,29) (29,29,29) (29,29,29) (38,38,38) (80,80,80) (82,82,82) (0,0,0) (0,0,0)
(29,29,29) (29,29,29) (42,42,42) (78,78,78) (89,89,89) (0,0,0) (0,0,0) (0,0,0)
(38,38,38) (52,52,52) (95,95,95) (83,83,83) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(98,98,98) (105,105,105) (47,47,47) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(30,30,30) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark-contrast\photo\swiftui-menu

Case: swiftui-menu; appearance=dark-contrast; background=photo; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

## macos27-captures\out\menu-outline\menus\dark-contrast\photo\swiftui-picker

Case: swiftui-picker; appearance=dark-contrast; background=photo; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

## macos27-captures\out\menu-outline\menus\dark-contrast\plain\appkit-popup

Case: appkit-popup; appearance=dark-contrast; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 342×218; shape box=(56.00,56.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (75,75,75) (45,45,45) (41,41,41) (39,39,39) (38,38,38) (24,117,219) (23,117,219) (23,116,218) (23,116,218)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,75.0,45.0,41.0,39.0,38.0,104.6,104.4,103.6,103.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=-54.0 Y.
- right: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (35,35,35) (35,35,35) (35,35,35)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,34.0,34.0,34.0,34.0,34.0,34.0,35.0,35.0,35.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=-0.8 Y.
- bottom: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (74,74,74) (43,43,43) (39,39,39) (37,37,37) (36,36,36) (35,35,35) (35,35,35) (34,34,34) (34,34,34)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,74.0,43.0,39.0,37.0,36.0,35.0,35.0,34.0,34.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+13.8 Y.
- left: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,34.0,34.0,34.0,34.0,34.0,34.0,34.0,34.0,34.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (36,36,36) (45,45,45)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (33,33,33) (42,42,42) (36,36,36) (36,36,36)
(32,32,32) (32,32,32) (32,32,32) (33,33,33) (43,43,43) (36,36,36) (36,36,36) (36,36,36)
(32,32,32) (32,32,32) (32,32,32) (43,43,43) (36,36,36) (36,36,36) (36,36,36) (36,36,36)
(32,32,32) (32,32,32) (39,39,39) (35,35,35) (35,35,35) (35,35,35) (36,36,36) (36,36,36)
(32,32,32) (34,34,34) (35,35,35) (35,35,35) (35,35,35) (35,35,35) (35,35,35) (30,69,112)
(32,32,32) (39,39,39) (35,35,35) (35,35,35) (35,35,35) (35,35,35) (30,70,113) (24,112,209)
```
**bottom-right 8×8 RGB:**

```text
(33,33,33) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (39,38,37) (32,32,32)
(33,33,33) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (34,34,34) (32,32,32)
(34,34,34) (34,34,34) (33,33,33) (33,33,33) (33,33,33) (39,39,39) (32,32,32) (32,32,32)
(34,34,34) (34,34,34) (34,34,34) (34,34,34) (42,42,42) (32,32,32) (32,32,32) (32,32,32)
(34,34,34) (34,34,34) (34,34,34) (42,42,42) (33,33,33) (32,32,32) (32,32,32) (32,32,32)
(34,34,34) (34,34,34) (41,41,41) (33,33,33) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(44,44,44) (35,35,35) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 342×218; shape box=(56.00,52.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 276×152; shape box=(23.00,19.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (24,117,219) (23,117,219) (23,116,218) (23,116,218)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,104.6,104.4,103.6,103.6`; alpha: `5,7,9,11,13,16,19,51,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=-51.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0`; alpha: `13,15,19,23,25,29,33,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,28.0,28.0`; alpha: `25,30,33,37,41,44,48,76,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=76; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0`; alpha: `13,15,20,22,26,29,32,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (115,115,115) (98,98,98)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (98,98,98) (99,99,99) (51,51,51) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (98,98,98) (82,82,82) (42,42,42) (29,29,29) (29,29,29)
(0,0,0) (0,0,0) (95,95,95) (80,80,80) (39,39,39) (29,29,29) (29,29,29) (29,29,29)
(0,0,0) (56,56,56) (98,98,98) (41,41,41) (28,28,28) (28,28,28) (29,29,29) (29,29,29)
(0,0,0) (107,107,107) (51,51,51) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (26,65,108)
(34,34,34) (96,96,96) (35,35,35) (28,28,28) (28,28,28) (28,28,28) (26,65,108) (23,114,214)
```
**bottom-right 8×8 RGB:**

```text
(28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (35,35,35) (95,95,95) (30,30,30)
(28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (51,51,51) (101,101,101) (0,0,0)
(29,29,29) (29,29,29) (28,28,28) (28,28,28) (41,41,41) (96,96,96) (48,48,48) (0,0,0)
(29,29,29) (29,29,29) (29,29,29) (39,39,39) (80,80,80) (86,86,86) (0,0,0) (0,0,0)
(29,29,29) (29,29,29) (42,42,42) (81,81,81) (90,90,90) (0,0,0) (0,0,0) (0,0,0)
(36,36,36) (51,51,51) (97,97,97) (85,85,85) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(97,97,97) (105,105,105) (48,48,48) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(28,28,28) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark-contrast\plain\appkit-pulldown

Case: appkit-pulldown; appearance=dark-contrast; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 338×194; shape box=(56.00,56.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (76,76,76) (43,43,43) (39,39,39) (37,37,37) (36,36,36) (34,34,34) (34,34,34) (33,33,33) (33,33,33)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,76.0,43.0,39.0,37.0,36.0,34.0,34.0,33.0,33.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+15.2 Y.
- right: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (73,73,73) (41,41,41) (37,37,37) (35,35,35) (34,34,34) (33,33,33) (33,33,33) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,73.0,41.0,37.0,35.0,34.0,33.0,33.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+14.0 Y.
- left: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (36,36,36) (42,42,42)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (33,33,33) (40,40,40) (34,34,34) (34,34,34)
(32,32,32) (32,32,32) (32,32,32) (33,33,33) (42,42,42) (34,34,34) (34,34,34) (34,34,34)
(32,32,32) (32,32,32) (32,32,32) (40,40,40) (34,34,34) (34,34,34) (34,34,34) (34,34,34)
(32,32,32) (32,32,32) (38,38,38) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (33,33,33)
(32,32,32) (34,34,34) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (33,33,33)
(32,32,32) (37,37,37) (32,32,33) (33,32,32) (33,32,33) (33,33,33) (32,32,32) (33,33,33)
```
**bottom-right 8×8 RGB:**

```text
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (36,36,36) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (34,34,34) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (37,37,37) (32,32,32) (32,32,32)
(33,33,33) (33,33,33) (33,33,33) (33,33,33) (39,39,39) (32,32,32) (32,32,32) (32,32,32)
(33,33,33) (33,33,33) (33,33,33) (40,40,40) (33,33,33) (32,32,32) (32,32,32) (32,32,32)
(33,33,33) (33,33,33) (39,39,39) (33,33,33) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(42,42,42) (36,36,36) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 338×194; shape box=(56.00,52.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 272×128; shape box=(23.00,19.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (27,27,27) (27,27,27)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,27.0,27.0`; alpha: `6,7,9,10,13,16,19,50,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=50; inner 0–3 px mean lift over 5–8 px=+24.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (27,27,27) (27,27,27) (27,27,27) (27,27,27) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,27.0,27.0,27.0,27.0,28.0,28.0,28.0,28.0`; alpha: `14,16,19,21,26,29,32,63,196,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=63; inner 0–3 px mean lift over 5–8 px=+16.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,28.0,28.0`; alpha: `25,30,32,37,41,44,48,77,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=77; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (27,27,27) (27,27,27) (27,27,27) (27,27,27) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,27.0,27.0,27.0,27.0,28.0,28.0,28.0,28.0`; alpha: `14,16,19,22,26,29,32,64,196,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (112,112,112) (98,98,98)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (98,98,98) (99,99,99) (51,51,51) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (98,98,98) (80,80,80) (42,42,42) (29,29,29) (29,29,29)
(0,0,0) (0,0,0) (97,97,97) (81,81,81) (39,39,39) (29,29,29) (29,29,29) (29,29,29)
(0,0,0) (56,56,56) (97,97,97) (41,41,41) (28,28,28) (28,28,28) (28,28,28) (28,28,28)
(0,0,0) (107,107,107) (51,51,51) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)
(34,34,34) (95,95,95) (35,35,35) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)
```
**bottom-right 8×8 RGB:**

```text
(28,28,28) (28,28,28) (28,28,28) (27,27,27) (27,27,27) (34,34,34) (94,94,94) (30,30,30)
(28,28,28) (28,28,28) (28,28,28) (27,27,27) (27,27,27) (50,50,50) (101,101,101) (0,0,0)
(28,28,28) (28,28,28) (28,28,28) (27,27,27) (40,40,40) (95,95,95) (48,48,48) (0,0,0)
(29,29,29) (29,29,29) (29,29,29) (38,38,38) (79,79,79) (85,85,85) (0,0,0) (0,0,0)
(29,29,29) (29,29,29) (42,42,42) (79,79,79) (90,90,90) (0,0,0) (0,0,0) (0,0,0)
(36,36,36) (51,51,51) (97,97,97) (85,85,85) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(97,97,97) (104,104,104) (47,47,47) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(27,27,27) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark-contrast\plain\combobox

Case: combobox; appearance=dark-contrast; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 349×194; shape box=(56.00,56.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(16,16,16) (54,54,54) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (23,116,218) (23,116,218) (23,116,218) (23,116,218)`; luma: `16.0,54.0,32.0,32.0,32.0,32.0,32.0,32.0,38.0,38.0,38.0,38.0,38.0,103.6,103.6,103.6,103.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=38.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=-65.6 Y.
- right: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (34,34,34)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (33,33,33) (38,38,38) (38,38,38)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (34,34,34) (38,38,38) (38,38,38) (38,38,38)
(32,32,32) (32,32,32) (32,32,32) (34,34,34) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
(32,32,32) (32,32,32) (33,33,33) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
(32,32,32) (32,32,32) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (36,47,59)
(32,32,32) (34,34,34) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (36,50,65) (28,89,156)
```
**bottom-right 8×8 RGB:**

```text
(38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (34,34,34) (32,32,32)
(38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (32,32,32) (32,32,32)
(38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (33,33,33) (32,32,32) (32,32,32)
(38,38,38) (38,38,38) (38,38,38) (38,38,38) (34,34,34) (32,32,32) (32,32,32) (32,32,32)
(38,38,38) (38,38,38) (38,38,38) (34,34,34) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(38,38,38) (38,38,38) (33,33,33) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(34,34,34) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 349×194; shape box=(56.00,52.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 283×128; shape box=(23.00,19.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (204,204,204) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (23,116,218) (23,116,218) (23,116,218) (23,116,218)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,204.0,85.0,85.0,85.0,85.0,103.6,103.6,103.6,103.6`; alpha: `5,5,8,9,11,13,16,48,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=48; inner 0–3 px mean lift over 5–8 px=+11.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (204,204,204) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,204.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0`; alpha: `12,13,16,19,22,24,27,58,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+29.8 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (204,204,204) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,204.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0`; alpha: `21,24,27,30,34,37,40,69,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=69; inner 0–3 px mean lift over 5–8 px=+29.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (204,204,204) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,204.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0,85.0`; alpha: `12,14,16,18,22,24,27,59,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+29.8 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (158,158,158) (187,187,187)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (109,109,109) (181,181,181) (173,173,173) (134,134,134)
(0,0,0) (0,0,0) (0,0,0) (122,122,122) (188,188,188) (154,154,154) (103,103,103) (85,85,85)
(0,0,0) (0,0,0) (109,109,109) (187,187,187) (146,146,146) (88,88,88) (85,85,85) (85,85,85)
(0,0,0) (0,0,0) (181,181,181) (154,154,154) (88,88,88) (85,85,85) (85,85,85) (85,85,85)
(0,0,0) (156,156,156) (173,173,173) (103,103,103) (85,85,85) (85,85,85) (85,85,85) (77,89,102)
(0,0,0) (187,187,187) (134,134,134) (85,85,85) (85,85,85) (85,85,85) (77,89,102) (44,106,173)
```
**bottom-right 8×8 RGB:**

```text
(85,85,85) (85,85,85) (85,85,85) (85,85,85) (85,85,85) (134,134,134) (185,185,185) (0,0,0)
(85,85,85) (85,85,85) (85,85,85) (85,85,85) (104,104,104) (175,175,175) (148,148,148) (0,0,0)
(85,85,85) (85,85,85) (85,85,85) (87,87,87) (154,154,154) (181,181,181) (0,0,0) (0,0,0)
(85,85,85) (85,85,85) (90,90,90) (146,146,146) (188,188,188) (91,91,91) (0,0,0) (0,0,0)
(85,85,85) (101,101,101) (153,153,153) (187,187,187) (109,109,109) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (176,176,176) (179,179,179) (87,87,87) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(185,185,185) (144,144,144) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark-contrast\plain\context

Case: context; appearance=dark-contrast; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 212×205; shape box=(56.00,56.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (74,74,74) (42,42,42) (38,38,38) (36,36,36) (35,35,35) (34,34,34) (33,33,33) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,74.0,42.0,38.0,36.0,35.0,34.0,33.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+14.8 Y.
- right: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (33,33,33) (33,33,33) (33,33,33)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,33.0,33.0,33.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=-0.8 Y.
- bottom: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (74,74,74) (42,42,42) (38,38,38) (36,36,36) (35,35,35) (34,34,34) (34,34,34) (33,33,33) (33,33,33)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,74.0,42.0,38.0,36.0,35.0,34.0,34.0,33.0,33.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+14.0 Y.
- left: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (33,33,33) (33,33,33) (33,33,33)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,33.0,33.0,33.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=-0.8 Y.
**top-left 8×8 RGB:**

```text
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (36,36,36) (45,45,45)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (33,33,33) (41,41,41) (34,34,34) (35,35,35)
(32,32,32) (32,32,32) (32,32,32) (33,33,33) (41,41,41) (34,34,34) (34,34,34) (34,34,34)
(32,32,32) (32,32,32) (32,32,32) (42,42,42) (34,34,34) (34,34,34) (34,34,34) (34,34,34)
(32,32,32) (32,32,32) (38,38,38) (33,33,33) (33,33,33) (33,33,33) (34,34,34) (34,34,34)
(32,32,32) (34,34,34) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (32,32,32)
(32,32,32) (37,37,37) (33,33,33) (33,33,33) (33,33,33) (32,32,32) (32,32,32) (32,32,32)
```
**bottom-right 8×8 RGB:**

```text
(33,33,33) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (38,38,38) (32,32,32)
(33,33,33) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (34,34,34) (32,32,32)
(34,34,34) (33,33,33) (32,32,32) (32,32,32) (32,32,32) (39,39,39) (32,32,32) (32,32,32)
(34,34,34) (33,33,33) (33,33,33) (33,33,33) (40,40,40) (32,32,32) (32,32,32) (32,32,32)
(34,34,34) (33,33,33) (33,33,33) (41,41,41) (33,33,33) (32,32,32) (32,32,32) (32,32,32)
(35,35,35) (33,33,33) (41,41,41) (33,33,33) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(45,45,45) (36,36,36) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 212×205; shape box=(56.00,52.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
```
**bottom-right 8×8 RGB:**

```text
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 146×139; shape box=(23.00,19.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,28.0,28.0`; alpha: `6,7,10,12,14,16,19,51,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0`; alpha: `14,15,19,22,26,30,33,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,28.0,28.0`; alpha: `25,28,33,37,41,44,48,77,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=77; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0`; alpha: `13,17,19,22,26,29,33,63,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=63; inner 0–3 px mean lift over 5–8 px=+16.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (115,115,115) (98,98,98)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (98,98,98) (98,98,98) (51,51,51) (37,37,37)
(0,0,0) (0,0,0) (0,0,0) (99,99,99) (82,82,82) (42,42,42) (29,29,29) (29,29,29)
(0,0,0) (0,0,0) (97,97,97) (80,80,80) (39,39,39) (29,29,29) (29,29,29) (29,29,29)
(0,0,0) (56,56,56) (98,98,98) (41,41,41) (28,28,28) (28,28,28) (29,29,29) (29,29,29)
(0,0,0) (107,107,107) (51,51,51) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)
(34,34,34) (96,96,96) (35,35,35) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)
```
**bottom-right 8×8 RGB:**

```text
(28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (36,36,36) (92,92,92) (34,34,34)
(28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (51,51,51) (101,101,101) (0,0,0)
(29,29,29) (29,29,29) (28,28,28) (28,28,28) (41,41,41) (95,95,95) (49,49,49) (0,0,0)
(29,29,29) (29,29,29) (29,29,29) (39,39,39) (79,79,79) (81,81,81) (0,0,0) (0,0,0)
(29,29,29) (29,29,29) (42,42,42) (80,80,80) (90,90,90) (0,0,0) (0,0,0) (0,0,0)
(37,37,37) (51,51,51) (97,97,97) (82,82,82) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(98,98,98) (106,106,106) (47,47,47) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(28,28,28) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark-contrast\plain\submenu

Case: submenu; appearance=dark-contrast; background=plain; opened=True.

Visible captured menu windows: 1.

Nested submenu result: parent popup captured; no separate submenu window appeared.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 342×218; shape box=(56.00,56.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (75,75,75) (45,45,45) (41,41,41) (39,39,39) (38,38,38) (24,117,219) (23,117,219) (23,116,218) (23,116,218)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,75.0,45.0,41.0,39.0,38.0,104.6,104.4,103.6,103.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=-54.0 Y.
- right: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (35,35,35) (35,35,35) (35,35,35)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,34.0,34.0,34.0,34.0,34.0,34.0,35.0,35.0,35.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=-0.8 Y.
- bottom: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (74,74,74) (43,43,43) (39,39,39) (37,37,37) (36,36,36) (35,35,35) (35,35,35) (34,34,34) (34,34,34)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,74.0,43.0,39.0,37.0,36.0,35.0,35.0,34.0,34.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+13.8 Y.
- left: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34) (34,34,34)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,34.0,34.0,34.0,34.0,34.0,34.0,34.0,34.0,34.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (36,36,36) (45,45,45)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (33,33,33) (42,42,42) (36,36,36) (36,36,36)
(32,32,32) (32,32,32) (32,32,32) (33,33,33) (43,43,43) (36,36,36) (36,36,36) (36,36,36)
(32,32,32) (32,32,32) (32,32,32) (43,43,43) (36,36,36) (36,36,36) (36,36,36) (36,36,36)
(32,32,32) (32,32,32) (39,39,39) (35,35,35) (35,35,35) (35,35,35) (36,36,36) (36,36,36)
(32,32,32) (34,34,34) (35,35,35) (35,35,35) (35,35,35) (35,35,35) (35,35,35) (30,69,112)
(32,32,32) (39,39,39) (35,35,35) (35,35,35) (35,35,35) (35,35,35) (30,70,113) (24,112,209)
```
**bottom-right 8×8 RGB:**

```text
(33,33,33) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (39,38,37) (32,32,32)
(33,33,33) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (33,33,33) (34,34,34) (32,32,32)
(34,34,34) (34,34,34) (33,33,33) (33,33,33) (33,33,33) (39,39,39) (32,32,32) (32,32,32)
(34,34,34) (34,34,34) (34,34,34) (34,34,34) (42,42,42) (32,32,32) (32,32,32) (32,32,32)
(34,34,34) (34,34,34) (34,34,34) (42,42,42) (33,33,33) (32,32,32) (32,32,32) (32,32,32)
(34,34,34) (34,34,34) (41,41,41) (33,33,33) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(44,44,44) (35,35,35) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 342×218; shape box=(56.00,52.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)`; luma: `32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0,32.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(32,32,32), Y=32.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
(32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32) (32,32,32)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 276×152; shape box=(23.00,19.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (24,117,219) (23,117,219) (23,116,218) (23,116,218)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,104.6,104.4,103.6,103.6`; alpha: `5,7,9,11,13,16,19,51,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=-51.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0`; alpha: `13,15,19,23,25,29,33,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (108,108,108) (37,37,37) (33,33,33) (31,31,31) (30,30,30) (29,29,29) (29,29,29) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,108.0,37.0,33.0,31.0,30.0,29.0,29.0,28.0,28.0`; alpha: `25,30,33,37,41,44,48,76,245,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=76; inner 0–3 px mean lift over 5–8 px=+23.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (95,95,95) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,95.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0,28.0`; alpha: `13,15,20,22,26,29,32,64,195,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=64; inner 0–3 px mean lift over 5–8 px=+16.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (115,115,115) (98,98,98)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (98,98,98) (99,99,99) (51,51,51) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (98,98,98) (82,82,82) (42,42,42) (29,29,29) (29,29,29)
(0,0,0) (0,0,0) (95,95,95) (80,80,80) (39,39,39) (29,29,29) (29,29,29) (29,29,29)
(0,0,0) (56,56,56) (98,98,98) (41,41,41) (28,28,28) (28,28,28) (29,29,29) (29,29,29)
(0,0,0) (107,107,107) (51,51,51) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (26,65,108)
(34,34,34) (96,96,96) (35,35,35) (28,28,28) (28,28,28) (28,28,28) (26,65,108) (23,114,214)
```
**bottom-right 8×8 RGB:**

```text
(28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (35,35,35) (95,95,95) (30,30,30)
(28,28,28) (28,28,28) (28,28,28) (28,28,28) (28,28,28) (51,51,51) (101,101,101) (0,0,0)
(29,29,29) (29,29,29) (28,28,28) (28,28,28) (41,41,41) (96,96,96) (48,48,48) (0,0,0)
(29,29,29) (29,29,29) (29,29,29) (39,39,39) (80,80,80) (86,86,86) (0,0,0) (0,0,0)
(29,29,29) (29,29,29) (42,42,42) (81,81,81) (90,90,90) (0,0,0) (0,0,0) (0,0,0)
(36,36,36) (51,51,51) (97,97,97) (85,85,85) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(97,97,97) (105,105,105) (48,48,48) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(28,28,28) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\dark-contrast\plain\swiftui-menu

Case: swiftui-menu; appearance=dark-contrast; background=plain; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

## macos27-captures\out\menu-outline\menus\dark-contrast\plain\swiftui-picker

Case: swiftui-picker; appearance=dark-contrast; background=plain; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

## macos27-captures\out\menu-outline\menus\light\photo\appkit-popup

Case: appkit-popup; appearance=light; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 342×218; shape box=(56.00,56.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(59,50,29) (67,57,41) (73,63,50) (72,62,50) (70,62,49) (70,64,52) (70,65,55) (73,64,48) (254,213,168) (222,199,151) (217,195,152) (215,189,135) (213,188,130) (0,123,255) (0,123,255) (0,122,255) (0,122,255)`; luma: `50.4,58.0,64.2,63.3,62.8,64.4,65.3,64.8,218.5,200.4,196.6,190.6,189.1,106.4,106.4,105.7,105.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=14.9); edge at −1 RGB=(73,64,48), Y=64.8; composited; inner 0–3 px mean lift over 5–8 px=+95.5 Y.
- right: RGB distances −8..+8: `(248,214,56) (216,169,41) (227,190,45) (212,171,69) (243,196,102) (243,185,94) (238,215,163) (244,200,86) (217,175,118) (230,181,118) (229,181,119) (231,181,119) (232,181,118) (233,181,118) (234,181,119) (234,181,119) (236,182,119)`; luma: `209.8,169.8,187.4,172.4,199.2,190.8,216.1,201.1,179.8,186.9,186.7,187.2,187.3,187.5,187.8,187.8,188.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=40.1); edge at −1 RGB=(244,200,86), Y=201.1; composited; inner 0–3 px mean lift over 5–8 px=-2.9 Y.
- bottom: RGB distances −8..+8: `(54,60,14) (148,159,106) (156,168,131) (139,147,102) (158,173,130) (145,156,111) (110,114,51) (125,130,59) (217,216,155) (192,194,140) (192,194,146) (202,199,147) (194,194,148) (188,189,139) (186,187,135) (186,187,135) (186,188,135)`; luma: `55.4,152.8,162.8,142.1,166.7,150.4,108.6,123.8,211.8,189.7,190.1,195.9,190.7,185.2,183.0,183.0,183.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=111.3); edge at −1 RGB=(125,130,59), Y=123.8; composited; inner 0–3 px mean lift over 5–8 px=+13.1 Y.
- left: RGB distances −8..+8: `(34,48,3) (35,51,3) (57,76,4) (26,47,3) (22,41,1) (35,53,1) (54,76,5) (52,71,2) (168,181,145) (171,183,154) (173,183,155) (171,183,156) (173,184,157) (175,184,158) (173,185,159) (174,185,160) (175,187,160)`; luma: `41.8,44.1,66.8,39.4,34.1,45.4,66.2,62.0,175.6,178.4,178.9,178.5,179.7,180.2,180.6,180.9,182.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 4/8 ([-6, -4, -2, -1] px; max ΔY=25.0); edge at −1 RGB=(52,71,2), Y=62.0; composited; inner 0–3 px mean lift over 5–8 px=-3.2 Y.
**top-left 8×8 RGB:**

```text
(96,101,16) (43,46,11) (38,42,2) (32,37,0) (23,30,1) (29,35,3) (50,59,8) (94,96,8)
(93,101,26) (111,121,69) (111,122,73) (71,81,40) (32,41,4) (54,62,3) (102,109,33) (175,177,103)
(54,67,9) (45,59,19) (82,97,54) (135,151,114) (125,137,95) (153,157,98) (182,186,132) (182,186,132)
(59,75,17) (41,56,12) (35,48,3) (83,96,58) (185,187,136) (180,185,131) (180,185,132) (181,185,132)
(66,86,32) (55,71,23) (54,67,22) (184,187,135) (178,183,131) (178,183,131) (179,184,131) (179,184,131)
(84,104,71) (57,73,30) (131,136,89) (177,182,131) (177,182,131) (177,182,131) (177,182,131) (178,183,131)
(122,144,127) (78,89,53) (176,182,130) (175,181,130) (176,181,130) (176,182,130) (176,182,130) (103,157,183)
(68,79,44) (144,150,99) (174,181,130) (174,181,130) (175,181,130) (175,181,130) (100,156,183) (9,125,249)
```
**bottom-right 8×8 RGB:**

```text
(196,183,128) (196,183,128) (197,182,127) (197,182,127) (197,182,126) (209,181,125) (169,157,95) (96,109,18)
(196,183,129) (196,183,129) (196,183,129) (196,182,128) (199,182,127) (204,181,127) (110,119,46) (101,114,23)
(195,184,131) (195,184,130) (195,183,130) (196,182,129) (209,181,128) (166,159,97) (107,120,32) (92,104,24)
(194,185,133) (194,184,132) (195,183,131) (207,181,130) (202,182,133) (148,161,70) (130,141,44) (66,76,15)
(195,185,134) (198,184,133) (209,183,131) (193,178,125) (135,150,56) (149,161,55) (126,138,45) (51,61,14)
(208,183,134) (207,183,134) (164,156,99) (118,132,41) (138,153,50) (143,155,44) (85,95,27) (63,70,16)
(169,157,113) (97,106,37) (106,119,26) (129,143,45) (143,156,47) (115,126,36) (38,45,6) (67,76,7)
(62,71,3) (98,109,18) (121,133,33) (136,150,45) (135,148,41) (38,44,11) (28,36,2) (78,89,4)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 342×218; shape box=(56.00,52.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(31,23,10) (46,30,12) (52,36,10) (166,95,65) (230,161,110) (239,169,103) (190,108,83) (153,89,59) (131,91,64) (60,65,20) (30,36,0) (88,90,26) (148,152,88) (121,127,156) (95,98,170) (81,80,123) (58,59,88)`; luma: `23.8,32.1,37.5,107.9,172.0,179.1,123.6,100.4,97.6,60.7,32.1,85.0,146.5,127.8,102.6,83.3,60.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=155.4); edge at −1 RGB=(153,89,59), Y=100.4; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-24.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(51,55,31) (72,81,46) (107,113,83) (37,46,11) (48,58,16) (79,77,66) (85,78,68) (101,103,59) (115,115,63) (133,116,103) (161,142,164) (138,117,139) (141,136,147) (139,150,154) (154,159,165) (177,182,187) (171,176,181)`; luma: `52.4,76.6,109.6,41.6,52.8,76.6,78.8,99.4,111.2,118.7,147.6,123.1,137.9,148.0,158.4,181.3,175.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -3, -2, -1] px; max ΔY=57.1); edge at −1 RGB=(101,103,59), Y=99.4; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-40.6 Y.
- left: RGB distances −8..+8: `(236,124,189) (229,76,162) (230,80,160) (243,191,226) (233,145,196) (232,133,196) (233,149,211) (234,171,220) (240,211,235) (241,222,233) (221,143,157) (228,142,176) (244,173,216) (234,161,205) (232,150,198) (227,125,169) (233,132,177)`; luma: `152.5,114.7,117.7,204.6,167.4,158.6,171.3,187.9,218.9,226.8,160.6,162.7,191.2,179.7,170.9,149.9,156.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=52.1); edge at −1 RGB=(234,171,220), Y=187.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+28.0 Y.
**top-left 8×8 RGB:**

```text
(87,101,62) (47,54,28) (46,49,2) (33,40,4) (49,54,4) (97,95,32) (107,106,49) (44,42,10)
(5,9,0) (1,2,0) (46,48,1) (64,66,7) (58,61,6) (106,102,31) (84,88,16) (70,64,2)
(23,30,2) (19,22,2) (72,70,6) (78,80,5) (34,39,2) (49,49,3) (57,62,0) (87,79,3)
(20,24,1) (8,13,1) (93,88,14) (79,82,9) (37,41,2) (34,36,1) (63,67,4) (82,77,4)
(34,42,11) (4,7,0) (95,91,17) (39,41,7) (38,39,1) (27,28,1) (58,62,4) (60,69,2)
(40,46,8) (9,14,0) (89,85,19) (43,44,9) (56,60,3) (19,22,2) (40,46,1) (49,61,2)
(43,51,7) (28,35,1) (49,48,10) (45,48,7) (70,79,5) (41,49,0) (53,61,0) (78,87,13)
(89,102,45) (81,96,32) (52,63,6) (33,40,1) (84,95,27) (71,82,15) (53,60,1) (101,106,29)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 276×152; shape box=(23.00,19.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (214,214,214) (140,140,140) (137,137,137) (135,135,135) (134,134,134) (0,123,255) (0,123,255) (0,122,255) (0,122,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,214.0,140.0,137.0,135.0,134.0,106.4,106.4,105.7,105.7`; alpha: `4,6,7,9,10,14,16,50,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 5 px; α at −1=50; inner 0–3 px mean lift over 5–8 px=+50.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (195,195,195) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,195.0,132.0,132.0,132.0,132.0,132.0,132.0,133.0,133.0`; alpha: `10,13,16,19,21,24,28,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (212,212,212) (140,140,140) (137,137,137) (136,136,136) (135,135,135) (135,135,135) (134,134,134) (134,134,134) (134,134,134)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,212.0,140.0,137.0,136.0,135.0,135.0,134.0,134.0,134.0`; alpha: `21,25,27,30,34,37,40,72,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+22.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (195,195,195) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,195.0,132.0,132.0,132.0,132.0,132.0,132.0,133.0,133.0`; alpha: `11,12,16,18,22,24,26,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (26,26,26) (128,128,128) (189,189,189)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (66,66,66) (184,184,184) (140,140,140) (136,136,136)
(0,0,0) (0,0,0) (0,0,0) (89,89,89) (178,178,178) (137,137,137) (134,134,134) (134,134,134)
(0,0,0) (0,0,0) (66,66,66) (177,177,177) (136,136,136) (133,133,133) (134,134,134) (133,133,133)
(0,0,0) (26,26,26) (181,181,181) (136,136,136) (133,133,133) (133,133,133) (133,133,133) (133,133,133)
(0,0,0) (117,117,117) (139,139,139) (133,133,133) (133,133,133) (132,132,132) (132,132,132) (76,128,184)
(17,17,17) (188,188,188) (135,135,135) (133,133,133) (132,132,132) (132,132,132) (76,128,184) (3,122,253)
```
**bottom-right 8×8 RGB:**

```text
(133,133,133) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (134,134,134) (183,183,183) (15,15,15)
(133,133,133) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (138,138,138) (108,108,108) (0,0,0)
(133,133,133) (132,132,132) (132,132,132) (132,132,132) (135,135,135) (177,177,177) (23,23,23) (0,0,0)
(133,133,133) (133,133,133) (132,132,132) (135,135,135) (175,175,175) (61,61,61) (0,0,0) (0,0,0)
(133,133,133) (133,133,133) (136,136,136) (176,176,176) (83,83,83) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (139,139,139) (177,177,177) (60,60,60) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(189,189,189) (114,114,114) (23,23,23) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\photo\appkit-pulldown

Case: appkit-pulldown; appearance=light; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 338×194; shape box=(56.00,56.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(208,192,144) (220,219,187) (218,198,140) (204,181,129) (224,201,146) (229,209,166) (244,244,244) (241,238,227) (241,224,173) (219,206,162) (215,204,161) (214,203,160) (213,202,160) (213,201,159) (212,200,159) (211,200,158) (210,199,157)`; luma: `191.9,216.9,198.1,182.1,201.9,210.1,244.0,237.8,223.9,205.6,203.2,202.2,201.3,200.5,199.6,199.3,198.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=52.1); edge at −1 RGB=(241,238,227), Y=237.8; composited; inner 0–3 px mean lift over 5–8 px=+9.3 Y.
- right: RGB distances −8..+8: `(70,75,2) (70,74,1) (84,87,3) (80,84,1) (85,86,3) (139,133,12) (117,106,5) (77,75,0) (215,180,113) (205,190,121) (207,183,120) (208,179,114) (207,179,114) (207,179,114) (207,180,115) (207,180,115) (207,180,116)`; luma: `68.7,67.9,80.3,77.2,79.8,125.5,101.0,70.0,182.6,188.2,183.6,180.5,180.3,180.3,181.0,181.0,181.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-6, -5, -4, -3, -2] px; max ΔY=56.9); edge at −1 RGB=(77,75,0), Y=70.0; composited; inner 0–3 px mean lift over 5–8 px=+2.8 Y.
- bottom: RGB distances −8..+8: `(150,130,106) (109,88,73) (146,107,84) (199,142,106) (80,51,24) (191,183,157) (238,238,217) (163,161,106) (235,220,169) (200,196,145) (196,191,146) (198,196,140) (198,196,140) (194,192,141) (191,186,143) (190,186,142) (189,185,142)`; luma: `132.5,91.4,113.6,151.5,55.2,182.8,236.5,157.5,219.5,193.2,188.8,192.4,192.4,188.7,184.0,183.7,182.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=104.0); edge at −1 RGB=(163,161,106), Y=157.5; composited; inner 0–3 px mean lift over 5–8 px=+13.7 Y.
- left: RGB distances −8..+8: `(107,130,223) (106,117,202) (71,56,119) (116,113,158) (152,161,214) (96,110,186) (149,159,216) (198,199,220) (176,193,224) (192,207,237) (195,205,231) (186,199,222) (186,199,226) (186,200,233) (187,201,237) (188,201,236) (189,202,235)`; luma: `131.8,120.8,63.7,116.9,162.9,112.5,161.0,200.3,191.6,206.0,204.8,197.9,198.2,199.4,200.6,200.8,201.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=68.5); edge at −1 RGB=(198,199,220), Y=200.3; composited; inner 0–3 px mean lift over 5–8 px=-0.5 Y.
**top-left 8×8 RGB:**

```text
(191,206,157) (90,101,58) (24,34,0) (73,90,20) (134,158,85) (154,179,118) (147,167,113) (127,149,91)
(199,215,163) (123,135,89) (15,23,1) (22,34,6) (82,99,43) (135,158,96) (137,160,106) (160,177,155)
(201,213,158) (137,150,105) (16,23,1) (19,30,4) (33,44,13) (145,163,136) (175,189,202) (173,185,190)
(144,153,95) (123,134,81) (35,47,5) (53,68,21) (162,178,178) (175,189,200) (173,184,170) (174,184,169)
(56,62,11) (97,105,33) (90,104,36) (165,181,179) (174,186,196) (176,185,176) (179,188,174) (181,190,173)
(11,17,2) (32,39,9) (115,129,112) (176,190,206) (178,188,182) (185,194,181) (190,198,182) (188,196,180)
(6,14,1) (34,43,30) (174,188,204) (177,187,188) (186,194,184) (196,204,191) (191,199,184) (189,197,182)
(7,16,0) (115,129,122) (177,190,207) (184,192,187) (194,202,191) (194,202,187) (191,199,185) (190,199,186)
```
**bottom-right 8×8 RGB:**

```text
(196,194,181) (193,192,178) (189,189,174) (185,185,166) (184,184,163) (183,184,161) (179,180,163) (210,209,207)
(197,195,181) (193,191,178) (187,187,173) (185,186,166) (184,185,164) (182,183,163) (212,211,205) (242,239,237)
(195,193,180) (189,189,176) (186,186,169) (184,185,167) (183,185,165) (163,165,154) (143,142,145) (154,152,154)
(190,190,176) (186,187,172) (185,186,169) (184,186,167) (176,178,161) (140,142,143) (178,177,178) (215,214,213)
(188,189,173) (187,188,170) (186,187,169) (187,188,172) (222,221,216) (251,250,247) (255,255,255) (253,254,252)
(187,188,173) (185,186,172) (185,185,177) (190,190,189) (192,191,192) (178,176,177) (160,158,157) (138,138,136)
(160,160,153) (112,113,113) (100,101,104) (103,104,105) (111,111,111) (129,129,128) (153,151,150) (169,168,166)
(123,124,126) (126,127,129) (132,132,135) (161,159,160) (211,209,208) (233,230,227) (242,238,234) (240,237,232)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 338×194; shape box=(56.00,52.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(166,125,94) (178,138,104) (166,108,89) (151,34,49) (132,8,35) (159,17,56) (115,61,35) (136,51,57) (132,11,53) (81,12,24) (73,8,20) (51,4,13) (43,10,12) (39,46,7) (45,54,7) (37,36,12) (63,54,31)`; luma: `131.5,144.0,119.0,60.0,36.3,50.0,70.6,69.5,39.8,27.5,22.7,14.6,17.2,41.7,48.7,34.5,54.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=95.2); edge at −1 RGB=(136,51,57), Y=69.5; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-18.6 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(124,127,133) (126,129,135) (126,129,134) (123,124,128) (134,134,137) (154,152,154) (151,149,151) (136,134,138) (147,144,147) (152,146,146) (118,114,109) (57,71,28) (66,84,16) (87,106,32) (70,85,18) (52,67,11) (67,84,27)`; luma: `126.8,128.8,128.7,124.1,134.2,152.6,149.6,134.7,144.9,147.3,114.5,64.9,75.3,96.6,77.0,59.8,76.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 4/8 ([-4, -3, -2, -1] px; max ΔY=25.8); edge at −1 RGB=(136,134,138), Y=134.7; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+40.5 Y.
- left: RGB distances −8..+8: `(234,162,214) (235,183,222) (239,211,231) (224,152,172) (223,116,152) (239,166,206) (219,146,188) (224,126,177) (234,135,184) (236,147,194) (236,149,201) (229,138,186) (225,143,178) (228,173,199) (231,182,217) (180,135,166) (94,87,59)`; luma: `181.1,196.9,218.4,168.8,141.3,184.4,164.6,150.5,159.6,169.3,171.3,160.8,163.0,186.6,194.9,146.8,86.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -2, -1] px; max ΔY=39.7); edge at −1 RGB=(224,126,177), Y=150.5; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+11.5 Y.
**top-left 8×8 RGB:**

```text
(93,100,21) (80,83,18) (71,71,14) (66,67,19) (32,35,10) (16,17,2) (42,43,4) (89,96,28)
(87,93,23) (91,90,21) (89,85,18) (39,39,9) (1,3,0) (3,5,0) (17,18,1) (66,71,11)
(100,112,40) (111,112,33) (88,82,16) (56,50,7) (44,41,5) (37,42,3) (29,37,3) (29,36,1)
(123,134,63) (99,98,38) (49,47,11) (37,32,6) (71,62,12) (80,83,7) (67,79,8) (54,63,10)
(124,121,56) (51,48,22) (19,19,4) (54,47,2) (87,78,17) (86,90,21) (74,86,14) (76,87,18)
(98,83,31) (64,56,21) (48,42,8) (40,33,4) (40,41,12) (81,91,40) (100,113,48) (86,99,39)
(122,104,48) (84,74,32) (37,38,7) (19,23,2) (16,21,0) (59,68,30) (107,121,65) (106,122,64)
(92,87,42) (34,35,16) (6,13,2) (12,17,7) (9,11,3) (38,43,23) (103,116,65) (123,141,80)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 272×128; shape box=(23.00,19.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (213,213,213) (140,140,140) (136,136,136) (134,134,134) (133,133,133) (133,133,133) (131,131,131) (131,131,131) (131,131,131)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,213.0,140.0,136.0,134.0,133.0,133.0,131.0,131.0,131.0`; alpha: `5,6,8,8,11,13,16,50,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=50; inner 0–3 px mean lift over 5–8 px=+24.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0`; alpha: `11,13,16,18,22,24,27,61,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=61; inner 0–3 px mean lift over 5–8 px=+15.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (209,209,209) (139,139,139) (137,137,137) (135,135,135) (134,134,134) (134,134,134) (133,133,133) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,209.0,139.0,137.0,135.0,134.0,134.0,133.0,133.0,133.0`; alpha: `21,25,26,31,34,37,40,72,244,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0`; alpha: `12,14,16,18,22,24,27,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (26,26,26) (125,125,125) (189,189,189)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (66,66,66) (182,182,182) (140,140,140) (136,136,136)
(0,0,0) (0,0,0) (0,0,0) (86,86,86) (178,178,178) (137,137,137) (134,134,134) (133,133,133)
(0,0,0) (0,0,0) (66,66,66) (176,176,176) (135,135,135) (132,132,132) (132,132,132) (132,132,132)
(0,0,0) (26,26,26) (181,181,181) (135,135,135) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(0,0,0) (114,114,114) (138,138,138) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(17,17,17) (186,186,186) (134,134,134) (132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131)
```
**bottom-right 8×8 RGB:**

```text
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131) (133,133,133) (183,183,183) (15,15,15)
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131) (137,137,137) (108,108,108) (0,0,0)
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (134,134,134) (176,176,176) (23,23,23) (0,0,0)
(132,132,132) (132,132,132) (131,131,131) (134,134,134) (172,172,172) (61,61,61) (0,0,0) (0,0,0)
(133,133,133) (132,132,132) (135,135,135) (174,174,174) (80,80,80) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (138,138,138) (178,178,178) (61,61,61) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(188,188,188) (115,115,115) (23,23,23) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\photo\combobox

Case: combobox; appearance=light; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 349×194; shape box=(56.00,56.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(245,238,223) (104,88,26) (77,75,42) (158,134,74) (208,192,144) (220,219,187) (218,198,140) (204,181,129) (221,213,189) (221,213,189) (221,213,189) (221,212,189) (220,212,188) (0,112,245) (0,112,245) (0,112,245) (0,112,245)`; luma: `238.4,86.9,73.0,134.8,191.9,216.9,198.1,182.1,213.0,213.0,213.0,212.3,212.0,97.8,97.8,97.8,97.8`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=165.4); edge at −1 RGB=(204,181,129), Y=182.1; composited; inner 0–3 px mean lift over 5–8 px=+115.0 Y.
- right: RGB distances −8..+8: `(156,44,2) (90,60,2) (106,113,4) (101,108,2) (84,87,2) (114,117,3) (102,100,2) (88,87,2) (221,204,177) (221,204,177) (221,204,177) (221,204,177) (221,204,177) (221,204,177) (221,204,177) (221,204,177) (221,203,177)`; luma: `64.8,62.2,103.6,98.9,80.2,108.1,93.3,81.1,205.7,205.7,205.7,205.7,205.7,205.7,205.7,205.7,204.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=43.4); edge at −1 RGB=(88,87,2), Y=81.1; composited; inner 0–3 px mean lift over 5–8 px=+0.2 Y.
- bottom: RGB distances −8..+8: `(80,51,24) (191,183,157) (238,238,217) (163,161,106) (117,117,44) (96,96,45) (163,163,120) (166,161,102) (206,205,178) (206,205,178) (206,205,178) (206,205,178) (206,205,178) (206,205,178) (206,205,178) (206,205,178) (206,205,178)`; luma: `55.2,182.8,236.5,157.5,111.7,92.3,159.9,157.8,203.3,203.3,203.3,203.3,203.3,203.3,203.3,203.3,203.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=181.3); edge at −1 RGB=(166,161,102), Y=157.8; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(42,85,178) (50,91,185) (107,133,210) (123,143,218) (83,101,188) (51,67,153) (53,73,163) (68,92,178) (211,217,214) (211,217,214) (211,217,214) (211,217,214) (211,217,214) (211,217,214) (211,217,214) (211,217,214) (211,217,213)`; luma: `82.6,89.1,133.0,144.2,103.5,69.8,75.2,93.1,215.5,215.5,215.5,215.5,215.5,215.5,215.5,215.5,215.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=61.6); edge at −1 RGB=(68,92,178), Y=93.1; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(12,18,0) (49,60,23) (155,173,138) (203,221,194) (148,168,113) (139,160,102) (118,142,68) (141,163,97)
(10,16,3) (25,33,1) (93,106,58) (209,224,197) (154,174,129) (169,186,136) (114,130,69) (162,175,132)
(16,26,1) (33,45,4) (48,59,12) (141,150,117) (166,185,143) (193,205,173) (195,200,194) (205,210,206)
(23,35,0) (34,47,3) (13,22,0) (67,74,47) (190,201,172) (206,210,206) (206,210,206) (206,210,206)
(27,42,0) (28,40,2) (17,24,7) (115,119,107) (206,210,207) (206,210,207) (206,210,207) (206,210,207)
(30,47,1) (23,33,3) (77,79,73) (206,210,207) (206,210,207) (206,210,207) (206,210,207) (206,210,207)
(33,50,1) (33,40,25) (195,200,197) (206,211,208) (206,211,208) (206,211,208) (206,211,208) (182,200,212)
(43,60,2) (111,120,95) (206,211,208) (206,211,208) (206,211,208) (206,211,208) (175,196,214) (71,146,232)
```
**bottom-right 8×8 RGB:**

```text
(211,206,181) (211,206,181) (211,206,181) (211,206,181) (211,206,181) (211,206,181) (159,164,156) (30,37,22)
(211,206,181) (211,206,181) (211,206,181) (211,206,181) (211,206,181) (208,205,180) (114,128,126) (21,29,12)
(211,206,181) (211,206,181) (211,206,181) (211,206,181) (211,206,181) (150,154,149) (91,104,98) (19,21,4)
(211,206,181) (211,206,181) (211,206,181) (211,206,181) (183,186,181) (136,144,144) (82,90,87) (50,53,44)
(211,206,181) (211,206,181) (211,206,181) (216,215,206) (198,205,206) (158,169,173) (89,97,102) (112,121,115)
(211,206,181) (214,207,184) (222,221,216) (170,175,178) (125,135,143) (91,100,109) (119,131,133) (73,78,64)
(178,175,170) (163,161,162) (121,123,129) (128,132,137) (131,135,139) (137,143,142) (89,97,88) (12,14,1)
(178,177,178) (215,214,213) (223,219,217) (247,243,237) (218,215,209) (159,164,160) (43,50,39) (2,5,0)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 349×194; shape box=(56.00,52.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(184,150,119) (187,153,122) (194,154,120) (168,126,92) (120,89,63) (161,120,101) (154,95,89) (93,16,24) (136,45,52) (144,92,70) (137,46,57) (126,36,47) (127,60,42) (169,108,96) (155,130,74) (133,125,44) (157,149,34)`; luma: `155.0,158.0,160.0,132.5,93.7,127.3,107.1,32.9,64.9,101.5,66.1,55.9,72.9,120.1,131.3,120.9,142.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-5, -4, -3, -2, -1] px; max ΔY=122.0); edge at −1 RGB=(93,16,24), Y=32.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-56.6 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(32,30,24) (33,32,28) (46,44,39) (69,66,61) (70,69,64) (74,75,69) (107,107,100) (136,135,128) (134,131,119) (157,154,130) (150,148,127) (111,113,83) (83,94,15) (72,87,9) (79,97,33) (90,113,45) (80,102,30)`; luma: `30.0,31.9,44.1,66.3,68.9,74.4,106.5,134.7,130.8,152.9,146.9,110.4,86.0,78.2,88.6,103.2,92.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=104.7); edge at −1 RGB=(136,135,128), Y=134.7; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+44.7 Y.
- left: RGB distances −8..+8: `(234,162,214) (235,183,222) (239,211,231) (224,152,172) (223,116,152) (239,166,206) (219,146,188) (224,126,177) (234,135,184) (236,147,194) (236,149,201) (229,138,186) (225,143,178) (228,173,199) (231,182,217) (180,135,166) (94,87,59)`; luma: `181.1,196.9,218.4,168.8,141.3,184.4,164.6,150.5,159.6,169.3,171.3,160.8,163.0,186.6,194.9,146.8,86.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -2, -1] px; max ΔY=39.7); edge at −1 RGB=(224,126,177), Y=150.5; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+11.5 Y.
**top-left 8×8 RGB:**

```text
(93,100,21) (80,83,18) (71,71,14) (66,67,19) (32,35,10) (16,17,2) (42,43,4) (89,96,28)
(87,93,23) (91,90,21) (89,85,18) (39,39,9) (1,3,0) (3,5,0) (17,18,1) (66,71,11)
(100,112,40) (111,112,33) (88,82,16) (56,50,7) (44,41,5) (37,42,3) (29,37,3) (29,36,1)
(123,134,63) (99,98,38) (49,47,11) (37,32,6) (71,62,12) (80,83,7) (67,79,8) (54,63,10)
(124,121,56) (51,48,22) (19,19,4) (54,47,2) (87,78,17) (86,90,21) (74,86,14) (76,87,18)
(98,83,31) (64,56,21) (48,42,8) (40,33,4) (40,41,12) (81,91,40) (100,113,48) (86,99,39)
(122,104,48) (84,74,32) (37,38,7) (19,23,2) (16,21,0) (59,68,30) (107,121,65) (106,122,64)
(92,87,42) (34,35,16) (6,13,2) (12,17,7) (9,11,3) (38,43,23) (103,116,65) (123,141,80)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 283×128; shape box=(23.00,19.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (232,233,232) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (0,112,245) (0,112,245) (0,112,245) (0,112,245)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,232.7,230.7,230.7,230.7,230.7,97.8,97.8,97.8,97.8`; alpha: `5,5,8,9,11,13,16,51,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=+133.4 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (232,233,232) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,232.7,230.7,230.7,230.7,230.7,230.7,230.7,230.7,230.7`; alpha: `12,13,16,19,22,24,27,61,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=61; inner 0–3 px mean lift over 5–8 px=+0.5 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (232,233,232) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,232.7,230.7,230.7,230.7,230.7,230.7,230.7,230.7,230.7`; alpha: `21,24,27,30,34,37,40,72,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+0.5 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (232,232,232) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,232.0,230.0,230.0,230.0,230.0,230.0,230.0,230.0,230.0`; alpha: `12,14,16,18,22,24,27,62,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+0.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (106,106,106) (213,213,213)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (43,43,43) (197,197,197) (233,233,233) (231,232,231)
(0,0,0) (0,0,0) (0,0,0) (51,51,51) (218,220,218) (231,232,231) (230,231,230) (230,231,230)
(0,0,0) (0,0,0) (43,43,43) (218,220,218) (231,232,231) (230,231,230) (230,231,230) (230,231,230)
(0,0,0) (0,0,0) (197,197,197) (231,232,231) (230,231,230) (230,231,230) (230,231,230) (230,231,230)
(0,0,0) (105,105,105) (233,233,233) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (200,215,232)
(0,0,0) (213,213,213) (231,232,231) (230,231,230) (230,231,230) (230,231,230) (200,215,232) (77,152,240)
```
**bottom-right 8×8 RGB:**

```text
(230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (231,232,231) (212,212,212) (0,0,0)
(230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (233,234,233) (96,96,96) (0,0,0)
(230,231,230) (230,231,230) (230,231,230) (230,231,230) (231,232,231) (192,192,192) (0,0,0) (0,0,0)
(230,231,230) (230,231,230) (230,231,230) (231,232,231) (216,218,216) (31,31,31) (0,0,0) (0,0,0)
(230,231,230) (230,231,230) (231,232,231) (217,217,217) (47,47,47) (0,0,0) (0,0,0) (0,0,0)
(231,232,231) (233,233,233) (186,186,186) (31,31,31) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(206,206,206) (88,88,88) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\photo\context

Case: context; appearance=light; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 212×205; shape box=(56.00,56.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(175,118,117) (133,74,51) (230,131,63) (190,89,27) (152,83,31) (188,123,60) (190,126,71) (165,100,53) (255,198,152) (240,181,130) (238,179,127) (237,177,125) (236,175,124) (237,174,123) (236,173,122) (237,172,121) (241,172,120)`; luma: `130.0,84.9,147.1,106.0,93.9,132.3,135.6,110.4,206.8,189.9,187.8,186.0,184.3,183.7,182.7,182.1,182.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-7, -6, -5, -4, -1] px; max ΔY=45.2); edge at −1 RGB=(165,100,53), Y=110.4; composited; inner 0–3 px mean lift over 5–8 px=+9.7 Y.
- right: RGB distances −8..+8: `(246,166,16) (240,161,3) (252,215,22) (214,157,40) (235,156,25) (249,140,10) (207,90,17) (213,106,20) (251,181,105) (237,180,109) (236,180,109) (236,180,109) (235,181,109) (236,181,109) (237,181,109) (250,180,108) (255,183,106)`; luma: `172.2,166.4,208.9,160.7,163.3,153.8,109.6,122.5,190.4,187.0,186.8,186.8,187.3,187.5,187.7,189.7,192.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=62.6); edge at −1 RGB=(213,106,20), Y=122.5; composited; inner 0–3 px mean lift over 5–8 px=-1.7 Y.
- bottom: RGB distances −8..+8: `(80,73,71) (16,13,11) (7,7,3) (10,10,4) (10,10,4) (10,9,3) (10,9,4) (8,9,3) (244,192,173) (221,167,155) (189,169,149) (181,168,147) (179,167,145) (179,167,145) (178,166,143) (178,166,142) (179,166,142)`; luma: `74.3,13.5,6.7,9.6,9.6,8.8,8.9,8.4,201.7,177.6,171.8,169.2,168.0,168.0,166.9,166.8,167.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=67.6); edge at −1 RGB=(8,9,3), Y=8.4; composited; inner 0–3 px mean lift over 5–8 px=+12.9 Y.
- left: RGB distances −8..+8: `(85,89,16) (77,80,19) (82,79,21) (96,92,26) (108,106,31) (144,141,109) (229,235,234) (208,193,155) (203,192,150) (213,193,153) (209,194,153) (217,198,160) (212,193,154) (213,193,156) (218,197,163) (220,201,163) (221,204,164)`; luma: `82.9,75.0,75.5,88.1,101.0,139.3,233.7,193.4,191.3,194.4,194.2,199.3,194.2,194.6,199.0,202.3,204.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=150.8); edge at −1 RGB=(208,193,155), Y=193.4; composited; inner 0–3 px mean lift over 5–8 px=-5.4 Y.
**top-left 8×8 RGB:**

```text
(142,130,113) (152,142,111) (179,124,83) (208,142,108) (159,132,123) (156,141,134) (141,129,120) (121,112,107)
(134,121,90) (151,146,104) (159,120,61) (211,122,40) (175,121,82) (157,139,128) (152,138,123) (196,173,146)
(122,112,56) (166,162,102) (145,144,101) (152,117,41) (167,129,59) (198,172,131) (216,187,148) (215,187,147)
(132,137,55) (181,170,108) (172,173,140) (141,139,90) (214,184,137) (215,188,147) (215,187,146) (215,187,146)
(140,138,56) (191,170,102) (183,170,132) (217,191,151) (215,188,147) (215,187,147) (215,187,147) (215,188,146)
(154,139,65) (208,151,86) (197,166,125) (214,188,148) (213,188,147) (214,188,148) (213,190,146) (213,188,145)
(189,142,84) (212,138,83) (214,189,148) (213,188,148) (214,189,148) (213,191,146) (213,189,145) (212,191,144)
(219,142,88) (211,159,116) (213,189,148) (213,189,148) (212,193,150) (213,190,146) (212,190,145) (214,187,145)
```
**bottom-right 8×8 RGB:**

```text
(188,188,141) (188,190,140) (187,189,140) (188,186,140) (188,187,139) (188,186,139) (151,153,107) (72,85,4)
(188,190,143) (188,189,143) (188,187,142) (188,185,143) (188,186,141) (188,183,142) (79,87,26) (64,77,0)
(189,188,146) (188,187,146) (188,186,145) (187,188,144) (188,185,144) (129,129,103) (82,84,51) (102,106,70)
(190,188,148) (190,186,148) (189,188,147) (189,188,146) (184,181,151) (125,131,138) (118,122,133) (115,119,131)
(189,190,151) (190,187,151) (189,187,150) (184,181,150) (106,101,92) (95,91,85) (86,83,76) (90,88,83)
(189,188,153) (189,187,153) (185,181,161) (165,160,152) (156,152,148) (146,142,140) (132,128,125) (120,118,117)
(188,186,166) (161,158,153) (169,167,168) (169,168,167) (154,155,156) (138,137,140) (129,129,131) (120,120,121)
(164,159,160) (166,163,163) (169,168,169) (146,145,147) (142,143,146) (137,138,141) (131,133,134) (107,109,110)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 212×205; shape box=(56.00,52.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(158,139,33) (138,128,14) (102,97,3) (85,83,3) (96,93,5) (115,109,11) (84,80,8) (110,103,21) (68,67,9) (65,56,10) (171,109,53) (228,109,53) (234,132,80) (212,123,73) (186,110,86) (230,75,115) (221,138,144)`; luma: `135.4,121.9,91.3,77.6,87.3,103.2,75.7,98.6,63.0,54.6,118.1,130.3,149.9,138.3,124.4,110.8,156.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=59.7); edge at −1 RGB=(110,103,21), Y=98.6; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-40.9 Y.
- right: RGB distances −8..+8: `(126,112,99) (178,155,140) (160,141,130) (126,117,115) (103,94,89) (65,60,53) (87,82,79) (203,182,188) (252,186,183) (200,117,111) (108,84,77) (116,105,83) (204,167,142) (236,160,142) (200,80,88) (189,128,131) (239,209,195)`; luma: `114.0,158.8,144.2,118.8,95.6,60.6,82.8,186.9,199.8,134.2,88.6,105.8,173.1,174.9,106.1,141.2,214.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=72.9); edge at −1 RGB=(203,182,188), Y=186.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-27.0 Y.
- bottom: RGB distances −8..+8: `(62,80,29) (43,57,14) (17,25,2) (65,76,37) (118,133,65) (96,107,71) (39,44,29) (35,44,10) (25,39,3) (36,39,8) (103,108,82) (118,129,114) (85,85,56) (89,94,36) (138,131,84) (179,137,148) (196,173,180)`; luma: `72.5,50.9,21.6,70.8,124.9,102.1,41.9,39.6,33.4,36.1,105.1,125.6,82.9,88.7,129.1,146.7,178.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=52.4); edge at −1 RGB=(35,44,10), Y=39.6; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-60.7 Y.
- left: RGB distances −8..+8: `(4,4,3) (27,24,24) (31,33,25) (7,19,0) (6,14,1) (8,15,3) (16,30,8) (42,59,52) (65,86,114) (56,79,113) (66,87,113) (111,123,115) (122,132,108) (157,173,174) (183,191,165) (149,146,65) (140,135,57)`; luma: `3.9,24.6,32.0,15.1,11.4,12.6,25.4,54.9,83.6,76.6,84.4,119.9,128.1,169.7,187.4,140.8,130.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=51.0); edge at −1 RGB=(42,59,52), Y=54.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-66.0 Y.
**top-left 8×8 RGB:**

```text
(102,119,63) (81,97,48) (64,74,39) (17,19,22) (29,29,81) (40,37,92) (41,47,29) (45,52,29)
(122,139,84) (96,114,65) (82,97,59) (37,44,61) (35,39,79) (17,22,8) (48,54,19) (47,56,79)
(105,121,71) (110,130,73) (82,97,55) (51,53,71) (46,49,59) (17,24,1) (46,54,13) (41,49,49)
(41,49,23) (105,122,66) (78,93,40) (25,29,14) (25,33,29) (24,32,17) (54,63,16) (49,56,83)
(18,25,9) (68,76,43) (109,116,65) (64,66,53) (43,52,29) (25,37,5) (57,72,14) (30,37,13)
(16,22,7) (77,79,48) (101,103,64) (44,48,36) (46,53,38) (35,46,26) (50,62,17) (18,25,1)
(74,76,57) (114,115,82) (77,78,63) (66,67,53) (24,29,18) (34,46,14) (54,65,20) (50,56,20)
(124,122,105) (107,107,88) (63,63,55) (74,76,58) (17,27,2) (32,44,6) (44,53,14) (57,62,21)
```
**bottom-right 8×8 RGB:**

```text
(149,141,116) (109,112,75) (116,119,99) (90,90,83) (107,101,100) (122,114,112) (134,122,117) (159,143,137)
(168,154,137) (108,108,87) (109,106,99) (126,120,123) (125,120,122) (119,112,116) (115,105,106) (115,105,103)
(167,143,129) (156,137,129) (136,125,117) (129,120,115) (124,115,111) (136,123,120) (133,119,115) (148,131,124)
(134,119,109) (172,147,136) (184,158,149) (160,140,132) (136,121,115) (113,101,97) (105,96,93) (101,96,96)
(125,119,115) (159,141,134) (167,144,136) (162,140,134) (165,145,138) (174,156,148) (175,158,150) (179,159,152)
(151,135,130) (137,123,121) (131,120,120) (126,116,116) (134,125,123) (145,139,139) (148,142,142) (143,132,129)
(124,114,111) (120,111,111) (133,124,125) (133,125,119) (113,110,104) (121,117,117) (105,101,102) (81,78,79)
(134,124,121) (156,140,134) (133,121,120) (129,120,117) (123,115,110) (113,104,99) (111,103,102) (127,118,118)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 146×139; shape box=(23.00,19.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (213,213,213) (140,140,140) (137,137,137) (134,134,134) (133,133,133) (133,133,133) (132,132,132) (131,131,131) (131,131,131)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,213.0,140.0,137.0,134.0,133.0,133.0,132.0,131.0,131.0`; alpha: `5,6,8,10,12,14,16,50,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=50; inner 0–3 px mean lift over 5–8 px=+24.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0,132.0`; alpha: `11,13,16,18,22,25,27,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+14.8 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (209,209,209) (140,140,140) (137,137,137) (135,135,135) (134,134,134) (134,134,134) (133,133,133) (133,133,133) (134,134,134)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,209.0,140.0,137.0,135.0,134.0,134.0,133.0,133.0,134.0`; alpha: `21,24,27,31,34,36,40,72,244,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0,132.0`; alpha: `11,14,16,18,21,24,27,61,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=61; inner 0–3 px mean lift over 5–8 px=+14.8 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (27,27,27) (128,128,128) (191,191,191)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (66,66,66) (182,182,182) (140,140,140) (136,136,136)
(0,0,0) (0,0,0) (0,0,0) (89,89,89) (178,178,178) (137,137,137) (134,134,134) (134,134,134)
(0,0,0) (0,0,0) (66,66,66) (177,177,177) (136,136,136) (133,133,133) (132,132,132) (133,133,133)
(0,0,0) (26,26,26) (181,181,181) (136,136,136) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(0,0,0) (114,114,114) (138,138,138) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(17,17,17) (186,186,186) (134,134,134) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
```
**bottom-right 8×8 RGB:**

```text
(132,132,132) (132,132,132) (132,132,132) (131,131,131) (131,131,131) (133,133,133) (178,178,178) (15,15,15)
(132,132,132) (132,132,132) (132,132,132) (131,131,131) (131,131,131) (137,137,137) (111,111,111) (0,0,0)
(132,132,132) (132,132,132) (132,132,132) (131,131,131) (135,135,135) (174,174,174) (23,23,23) (0,0,0)
(133,133,133) (132,132,132) (132,132,132) (134,134,134) (176,176,176) (58,58,58) (0,0,0) (0,0,0)
(133,133,133) (133,133,133) (135,135,135) (173,173,173) (84,84,84) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (139,139,139) (183,183,183) (61,61,61) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(186,186,186) (115,115,115) (22,22,22) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\photo\submenu

Case: submenu; appearance=light; background=photo; opened=True.

Visible captured menu windows: 1.

Nested submenu result: parent popup captured; no separate submenu window appeared.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 342×218; shape box=(56.00,56.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(59,50,29) (67,57,41) (73,63,50) (72,62,50) (70,62,49) (70,64,52) (70,65,55) (73,64,48) (254,213,168) (222,199,151) (217,195,152) (215,189,135) (213,188,130) (0,123,255) (0,123,255) (0,122,255) (0,122,255)`; luma: `50.4,58.0,64.2,63.3,62.8,64.4,65.3,64.8,218.5,200.4,196.6,190.6,189.1,106.4,106.4,105.7,105.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=14.9); edge at −1 RGB=(73,64,48), Y=64.8; composited; inner 0–3 px mean lift over 5–8 px=+95.5 Y.
- right: RGB distances −8..+8: `(248,214,56) (216,169,41) (227,190,45) (212,171,69) (243,196,102) (243,185,94) (238,215,163) (244,200,86) (217,175,118) (230,181,118) (229,181,119) (231,181,119) (232,181,118) (233,181,118) (234,181,119) (234,181,119) (236,182,119)`; luma: `209.8,169.8,187.4,172.4,199.2,190.8,216.1,201.1,179.8,186.9,186.7,187.2,187.3,187.5,187.8,187.8,188.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=40.1); edge at −1 RGB=(244,200,86), Y=201.1; composited; inner 0–3 px mean lift over 5–8 px=-2.9 Y.
- bottom: RGB distances −8..+8: `(54,60,14) (148,159,106) (156,168,131) (139,147,102) (158,173,130) (145,156,111) (110,114,51) (125,130,59) (217,216,155) (192,194,140) (192,194,146) (202,199,147) (194,194,148) (188,189,139) (186,187,135) (186,187,135) (186,188,135)`; luma: `55.4,152.8,162.8,142.1,166.7,150.4,108.6,123.8,211.8,189.7,190.1,195.9,190.7,185.2,183.0,183.0,183.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=111.3); edge at −1 RGB=(125,130,59), Y=123.8; composited; inner 0–3 px mean lift over 5–8 px=+13.1 Y.
- left: RGB distances −8..+8: `(34,48,3) (35,51,3) (57,76,4) (26,47,3) (22,41,1) (35,53,1) (54,76,5) (52,71,2) (168,181,145) (171,183,154) (173,183,155) (171,183,156) (173,184,157) (175,184,158) (173,185,159) (174,185,160) (175,187,160)`; luma: `41.8,44.1,66.8,39.4,34.1,45.4,66.2,62.0,175.6,178.4,178.9,178.5,179.7,180.2,180.6,180.9,182.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 4/8 ([-6, -4, -2, -1] px; max ΔY=25.0); edge at −1 RGB=(52,71,2), Y=62.0; composited; inner 0–3 px mean lift over 5–8 px=-3.2 Y.
**top-left 8×8 RGB:**

```text
(96,101,16) (43,46,11) (38,42,2) (32,37,0) (23,30,1) (29,35,3) (50,59,8) (94,96,8)
(93,101,26) (111,121,69) (111,122,73) (71,81,40) (32,41,4) (54,62,3) (102,109,33) (175,177,103)
(54,67,9) (45,59,19) (82,97,54) (135,151,114) (125,137,95) (153,157,98) (182,186,132) (182,186,132)
(59,75,17) (41,56,12) (35,48,3) (83,96,58) (185,187,136) (180,185,131) (180,185,132) (181,185,132)
(66,86,32) (55,71,23) (54,67,22) (184,187,135) (178,183,131) (178,183,131) (179,184,131) (179,184,131)
(84,104,71) (57,73,30) (131,136,89) (177,182,131) (177,182,131) (177,182,131) (177,182,131) (178,183,131)
(122,144,127) (78,89,53) (176,182,130) (175,181,130) (176,181,130) (176,182,130) (176,182,130) (103,157,183)
(68,79,44) (144,150,99) (174,181,130) (174,181,130) (175,181,130) (175,181,130) (100,156,183) (9,125,249)
```
**bottom-right 8×8 RGB:**

```text
(196,183,128) (196,183,128) (197,182,127) (197,182,127) (197,182,126) (209,181,125) (169,157,95) (96,109,18)
(196,183,129) (196,183,129) (196,183,129) (196,182,128) (199,182,127) (204,181,127) (110,119,46) (101,114,23)
(195,184,131) (195,184,130) (195,183,130) (196,182,129) (209,181,128) (166,159,97) (107,120,32) (92,104,24)
(194,185,133) (194,184,132) (195,183,131) (207,181,130) (202,182,133) (148,161,70) (130,141,44) (66,76,15)
(195,185,134) (198,184,133) (209,183,131) (193,178,125) (135,150,56) (149,161,55) (126,138,45) (51,61,14)
(208,183,134) (207,183,134) (164,156,99) (118,132,41) (138,153,50) (143,155,44) (85,95,27) (63,70,16)
(169,157,113) (97,106,37) (106,119,26) (129,143,45) (143,156,47) (115,126,36) (38,45,6) (67,76,7)
(62,71,3) (98,109,18) (121,133,33) (136,150,45) (135,148,41) (38,44,11) (28,36,2) (78,89,4)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 342×218; shape box=(56.00,52.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(31,23,10) (46,30,12) (52,36,10) (166,95,65) (230,161,110) (239,169,103) (190,108,83) (153,89,59) (131,91,64) (60,65,20) (30,36,0) (88,90,26) (148,152,88) (121,127,156) (95,98,170) (81,80,123) (58,59,88)`; luma: `23.8,32.1,37.5,107.9,172.0,179.1,123.6,100.4,97.6,60.7,32.1,85.0,146.5,127.8,102.6,83.3,60.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=155.4); edge at −1 RGB=(153,89,59), Y=100.4; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-24.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(51,55,31) (72,81,46) (107,113,83) (37,46,11) (48,58,16) (79,77,66) (85,78,68) (101,103,59) (115,115,63) (133,116,103) (161,142,164) (138,117,139) (141,136,147) (139,150,154) (154,159,165) (177,182,187) (171,176,181)`; luma: `52.4,76.6,109.6,41.6,52.8,76.6,78.8,99.4,111.2,118.7,147.6,123.1,137.9,148.0,158.4,181.3,175.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -3, -2, -1] px; max ΔY=57.1); edge at −1 RGB=(101,103,59), Y=99.4; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-40.6 Y.
- left: RGB distances −8..+8: `(236,124,189) (229,76,162) (230,80,160) (243,191,226) (233,145,196) (232,133,196) (233,149,211) (234,171,220) (240,211,235) (241,222,233) (221,143,157) (228,142,176) (244,173,216) (234,161,205) (232,150,198) (227,125,169) (233,132,177)`; luma: `152.5,114.7,117.7,204.6,167.4,158.6,171.3,187.9,218.9,226.8,160.6,162.7,191.2,179.7,170.9,149.9,156.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=52.1); edge at −1 RGB=(234,171,220), Y=187.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+28.0 Y.
**top-left 8×8 RGB:**

```text
(87,101,62) (47,54,28) (46,49,2) (33,40,4) (49,54,4) (97,95,32) (107,106,49) (44,42,10)
(5,9,0) (1,2,0) (46,48,1) (64,66,7) (58,61,6) (106,102,31) (84,88,16) (70,64,2)
(23,30,2) (19,22,2) (72,70,6) (78,80,5) (34,39,2) (49,49,3) (57,62,0) (87,79,3)
(20,24,1) (8,13,1) (93,88,14) (79,82,9) (37,41,2) (34,36,1) (63,67,4) (82,77,4)
(34,42,11) (4,7,0) (95,91,17) (39,41,7) (38,39,1) (27,28,1) (58,62,4) (60,69,2)
(40,46,8) (9,14,0) (89,85,19) (43,44,9) (56,60,3) (19,22,2) (40,46,1) (49,61,2)
(43,51,7) (28,35,1) (49,48,10) (45,48,7) (70,79,5) (41,49,0) (53,61,0) (78,87,13)
(89,102,45) (81,96,32) (52,63,6) (33,40,1) (84,95,27) (71,82,15) (53,60,1) (101,106,29)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 276×152; shape box=(23.00,19.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (214,214,214) (140,140,140) (137,137,137) (135,135,135) (134,134,134) (0,123,255) (0,123,255) (0,122,255) (0,122,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,214.0,140.0,137.0,135.0,134.0,106.4,106.4,105.7,105.7`; alpha: `4,6,7,9,10,14,16,50,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 5 px; α at −1=50; inner 0–3 px mean lift over 5–8 px=+50.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (195,195,195) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,195.0,132.0,132.0,132.0,132.0,132.0,132.0,133.0,133.0`; alpha: `10,13,16,19,21,24,28,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (212,212,212) (140,140,140) (137,137,137) (136,136,136) (135,135,135) (135,135,135) (134,134,134) (134,134,134) (134,134,134)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,212.0,140.0,137.0,136.0,135.0,135.0,134.0,134.0,134.0`; alpha: `21,25,27,30,34,37,40,72,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+22.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (195,195,195) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,195.0,132.0,132.0,132.0,132.0,132.0,132.0,133.0,133.0`; alpha: `11,12,16,18,22,24,26,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (26,26,26) (128,128,128) (189,189,189)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (66,66,66) (184,184,184) (140,140,140) (136,136,136)
(0,0,0) (0,0,0) (0,0,0) (89,89,89) (178,178,178) (137,137,137) (134,134,134) (134,134,134)
(0,0,0) (0,0,0) (66,66,66) (177,177,177) (136,136,136) (133,133,133) (134,134,134) (133,133,133)
(0,0,0) (26,26,26) (181,181,181) (136,136,136) (133,133,133) (133,133,133) (133,133,133) (133,133,133)
(0,0,0) (117,117,117) (139,139,139) (133,133,133) (133,133,133) (132,132,132) (132,132,132) (76,128,184)
(17,17,17) (188,188,188) (135,135,135) (133,133,133) (132,132,132) (132,132,132) (76,128,184) (3,122,253)
```
**bottom-right 8×8 RGB:**

```text
(133,133,133) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (134,134,134) (183,183,183) (15,15,15)
(133,133,133) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (138,138,138) (108,108,108) (0,0,0)
(133,133,133) (132,132,132) (132,132,132) (132,132,132) (135,135,135) (177,177,177) (23,23,23) (0,0,0)
(133,133,133) (133,133,133) (132,132,132) (135,135,135) (175,175,175) (61,61,61) (0,0,0) (0,0,0)
(133,133,133) (133,133,133) (136,136,136) (176,176,176) (83,83,83) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (139,139,139) (177,177,177) (60,60,60) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(189,189,189) (114,114,114) (23,23,23) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\photo\swiftui-menu

Case: swiftui-menu; appearance=light; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 272×194; shape box=(56.00,56.00,160.00,82.00) px.
- top: RGB distances −8..+8: `(106,70,54) (152,62,87) (80,23,33) (83,60,36) (82,65,40) (149,122,78) (165,80,63) (204,148,128) (233,199,161) (213,190,165) (215,179,158) (219,179,153) (223,176,151) (220,175,151) (218,175,150) (216,175,153) (215,178,154)`; luma: `76.5,82.9,35.8,63.2,66.8,124.6,96.8,158.5,203.5,193.1,185.1,185.6,184.2,182.8,182.3,182.1,184.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=82.0); edge at −1 RGB=(204,148,128), Y=158.5; composited; inner 0–3 px mean lift over 5–8 px=+9.0 Y.
- right: RGB distances −8..+8: `(107,113,2) (103,111,1) (113,117,27) (186,187,140) (183,179,113) (197,191,69) (106,105,5) (98,108,12) (199,187,121) (197,180,121) (197,180,121) (195,186,119) (195,186,119) (196,184,121) (197,183,122) (197,182,123) (197,182,124)`; luma: `103.7,101.4,109.7,183.4,175.1,183.5,98.0,98.9,184.8,179.4,179.4,183.1,183.1,182.0,181.6,180.9,181.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 3/8 ([-5, -4, -3] px; max ΔY=79.8); edge at −1 RGB=(98,108,12), Y=98.9; composited; inner 0–3 px mean lift over 5–8 px=+0.3 Y.
- bottom: RGB distances −8..+8: `(208,159,120) (202,151,115) (193,145,109) (188,141,105) (174,127,94) (133,98,76) (130,103,88) (147,118,100) (225,205,172) (212,198,164) (206,191,167) (206,192,169) (206,194,160) (207,196,156) (207,194,155) (206,192,158) (205,191,161)`; luma: `166.6,159.2,152.6,148.4,134.6,103.9,107.7,122.9,206.9,198.5,192.5,193.3,194.1,195.5,193.9,192.5,191.8`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=62.7); edge at −1 RGB=(147,118,100), Y=122.9; composited; inner 0–3 px mean lift over 5–8 px=+4.4 Y.
- left: RGB distances −8..+8: `(95,108,70) (49,69,22) (59,83,29) (72,96,44) (84,108,59) (62,85,43) (72,97,42) (63,90,31) (184,192,146) (179,187,139) (177,185,138) (176,185,137) (176,185,137) (176,185,137) (176,185,137) (176,185,137) (176,185,137)`; luma: `102.5,61.4,74.0,87.1,99.4,77.1,87.7,80.0,187.0,181.8,179.9,179.6,179.6,179.6,179.6,179.6,179.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -3, -2, -1] px; max ΔY=41.1); edge at −1 RGB=(63,90,31), Y=80.0; composited; inner 0–3 px mean lift over 5–8 px=+2.5 Y.
**top-left 8×8 RGB:**

```text
(199,199,158) (135,141,113) (189,187,150) (142,137,92) (76,77,35) (100,97,48) (77,81,34) (43,49,16)
(178,147,56) (98,92,41) (127,122,72) (144,135,77) (76,77,25) (83,82,28) (110,110,55) (158,158,115)
(186,148,56) (171,165,128) (126,119,65) (170,155,68) (88,88,35) (151,152,102) (191,191,152) (192,192,151)
(222,217,164) (221,227,215) (132,130,74) (126,113,34) (193,193,150) (190,191,150) (191,191,149) (192,192,152)
(227,217,161) (178,177,160) (117,110,65) (189,189,141) (189,189,148) (189,190,149) (190,191,150) (190,190,150)
(193,179,124) (183,178,143) (194,193,158) (187,188,148) (188,189,148) (188,189,149) (187,188,149) (188,188,148)
(210,205,172) (183,177,148) (185,187,148) (186,188,147) (186,188,148) (186,187,147) (186,187,147) (186,187,147)
(211,212,186) (195,196,159) (185,187,146) (185,187,147) (185,187,147) (184,186,147) (185,186,147) (185,187,147)
```
**bottom-right 8×8 RGB:**

```text
(199,198,192) (200,198,191) (200,198,191) (198,196,188) (194,193,183) (188,187,176) (185,185,174) (232,229,225)
(200,198,192) (200,198,191) (199,198,190) (195,194,186) (191,190,181) (184,185,173) (191,190,185) (213,209,207)
(200,198,191) (198,197,190) (196,194,187) (192,191,183) (187,186,177) (168,168,162) (171,169,170) (212,209,206)
(196,195,188) (194,193,186) (192,191,183) (188,187,179) (179,179,171) (159,158,160) (193,191,190) (211,207,205)
(193,192,185) (191,190,183) (188,188,179) (186,186,177) (147,149,152) (180,178,179) (211,209,206) (206,204,204)
(188,189,181) (187,188,180) (164,164,161) (134,137,142) (138,140,146) (188,186,186) (224,222,218) (185,186,187)
(176,178,175) (136,139,143) (127,131,136) (134,137,141) (143,145,149) (190,188,188) (218,216,213) (163,163,165)
(138,141,148) (123,129,135) (121,126,132) (136,140,145) (151,153,157) (192,191,192) (191,191,192) (163,164,167)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 272×194; shape box=(56.00,52.00,160.00,82.00) px.
- top: RGB distances −8..+8: `(91,84,21) (86,82,21) (75,71,19) (75,71,19) (73,49,6) (132,121,68) (161,155,101) (121,110,47) (101,82,42) (66,42,16) (58,39,15) (70,60,18) (44,45,11) (14,16,1) (67,65,17) (83,72,21) (36,29,6)`; luma: `80.9,78.4,68.1,68.1,51.0,119.5,152.4,107.8,83.2,45.2,41.3,59.1,42.3,14.5,62.0,70.7,28.8`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=71.4); edge at −1 RGB=(121,110,47), Y=107.8; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+13.2 Y.
- right: RGB distances −8..+8: `(175,140,111) (157,127,100) (127,92,57) (140,104,59) (190,155,110) (219,176,134) (209,169,125) (208,171,105) (224,182,108) (219,191,131) (202,189,125) (211,198,152) (194,171,118) (198,163,121) (184,152,91) (159,132,64) (190,131,101)`; luma: `145.3,131.4,96.9,108.4,159.2,182.1,174.3,174.1,185.6,192.6,187.1,197.4,172.1,167.4,154.4,132.8,141.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=48.4); edge at −1 RGB=(208,171,105), Y=174.1; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+41.7 Y.
- bottom: RGB distances −8..+8: `(134,112,97) (133,109,94) (135,108,92) (140,113,94) (141,114,96) (129,103,85) (129,102,82) (129,103,85) (127,103,87) (117,93,76) (95,71,52) (156,131,111) (196,180,164) (185,170,155) (189,174,160) (150,139,127) (115,106,96)`; luma: `115.6,113.0,112.6,117.4,118.4,107.2,106.3,107.2,106.9,96.9,74.7,134.9,182.2,172.1,176.2,140.5,107.2`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 3/8 ([-3, -2, -1] px; max ΔY=9.3); edge at −1 RGB=(129,103,85), Y=107.2; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-45.6 Y.
- left: RGB distances −8..+8: `(234,162,214) (235,183,222) (239,211,231) (224,152,172) (223,116,152) (239,166,206) (219,146,188) (224,126,177) (234,135,184) (236,147,194) (236,149,201) (229,138,186) (225,143,178) (228,173,199) (231,182,217) (180,135,166) (94,87,59)`; luma: `181.1,196.9,218.4,168.8,141.3,184.4,164.6,150.5,159.6,169.3,171.3,160.8,163.0,186.6,194.9,146.8,86.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -2, -1] px; max ΔY=39.7); edge at −1 RGB=(224,126,177), Y=150.5; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+11.5 Y.
**top-left 8×8 RGB:**

```text
(93,100,21) (80,83,18) (71,71,14) (66,67,19) (32,35,10) (16,17,2) (42,43,4) (89,96,28)
(87,93,23) (91,90,21) (89,85,18) (39,39,9) (1,3,0) (3,5,0) (17,18,1) (66,71,11)
(100,112,40) (111,112,33) (88,82,16) (56,50,7) (44,41,5) (37,42,3) (29,37,3) (29,36,1)
(123,134,63) (99,98,38) (49,47,11) (37,32,6) (71,62,12) (80,83,7) (67,79,8) (54,63,10)
(124,121,56) (51,48,22) (19,19,4) (54,47,2) (87,78,17) (86,90,21) (74,86,14) (76,87,18)
(98,83,31) (64,56,21) (48,42,8) (40,33,4) (40,41,12) (81,91,40) (100,113,48) (86,99,39)
(122,104,48) (84,74,32) (37,38,7) (19,23,2) (16,21,0) (59,68,30) (107,121,65) (106,122,64)
(92,87,42) (34,35,16) (6,13,2) (12,17,7) (9,11,3) (38,43,23) (103,116,65) (123,141,80)
```
**bottom-right 8×8 RGB:**

```text
(45,43,14) (49,49,23) (61,57,24) (78,72,28) (76,57,16) (80,63,25) (92,93,48) (83,87,41)
(25,21,7) (20,13,3) (66,73,30) (79,78,27) (77,54,17) (78,52,19) (98,92,44) (94,91,40)
(22,15,1) (33,22,6) (76,82,31) (84,85,31) (74,58,23) (74,53,25) (99,90,51) (98,84,38)
(71,53,37) (36,23,10) (54,48,14) (78,82,35) (86,90,41) (93,89,45) (105,89,45) (104,81,40)
(126,100,83) (42,34,23) (44,43,15) (84,91,45) (92,78,35) (91,62,24) (96,71,30) (92,73,29)
(66,51,40) (28,18,12) (47,47,19) (71,72,30) (69,44,12) (78,41,10) (87,51,17) (87,49,18)
(24,17,1) (15,15,0) (45,52,16) (60,67,27) (57,48,20) (75,66,33) (78,55,25) (75,37,16)
(79,66,46) (51,50,35) (52,53,30) (52,56,23) (60,65,31) (87,89,50) (81,76,39) (57,50,26)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 206×128; shape box=(23.00,19.00,160.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (213,213,213) (140,140,140) (136,136,136) (134,134,134) (133,133,133) (133,133,133) (131,131,131) (131,131,131) (131,131,131)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,213.0,140.0,136.0,134.0,133.0,133.0,131.0,131.0,131.0`; alpha: `4,6,7,10,11,13,16,51,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 5 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=+24.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0`; alpha: `11,13,16,18,21,24,27,61,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=61; inner 0–3 px mean lift over 5–8 px=+15.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (209,209,209) (139,139,139) (137,137,137) (135,135,135) (134,134,134) (134,134,134) (133,133,133) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,209.0,139.0,137.0,135.0,134.0,134.0,133.0,133.0,133.0`; alpha: `21,24,27,30,34,36,40,72,244,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0`; alpha: `12,14,16,18,22,24,27,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (26,26,26) (125,125,125) (190,190,190)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (66,66,66) (182,182,182) (140,140,140) (136,136,136)
(0,0,0) (0,0,0) (0,0,0) (89,89,89) (178,178,178) (137,137,137) (134,134,134) (133,133,133)
(0,0,0) (0,0,0) (66,66,66) (176,176,176) (135,135,135) (132,132,132) (132,132,132) (132,132,132)
(0,0,0) (26,26,26) (181,181,181) (135,135,135) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(0,0,0) (114,114,114) (138,138,138) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(17,17,17) (186,186,186) (134,134,134) (132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131)
```
**bottom-right 8×8 RGB:**

```text
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131) (133,133,133) (183,183,183) (15,15,15)
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131) (137,137,137) (109,109,109) (0,0,0)
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (134,134,134) (176,176,176) (23,23,23) (0,0,0)
(132,132,132) (132,132,132) (131,131,131) (134,134,134) (173,173,173) (61,61,61) (0,0,0) (0,0,0)
(133,133,133) (132,132,132) (135,135,135) (175,175,175) (80,80,80) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (138,138,138) (177,177,177) (61,61,61) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(189,189,189) (115,115,115) (23,23,23) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\photo\swiftui-picker

Case: swiftui-picker; appearance=light; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 211×194; shape box=(56.00,56.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(172,72,16) (227,89,30) (222,74,30) (203,59,27) (188,48,23) (177,47,18) (151,45,9) (120,60,5) (242,196,163) (219,180,143) (213,178,139) (211,176,138) (208,175,137) (208,174,136) (207,173,136) (206,173,135) (206,172,135)`; luma: `89.2,114.1,102.3,87.3,76.0,72.5,64.9,68.8,203.4,185.6,182.6,180.7,179.3,178.5,177.6,177.3,176.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=24.9); edge at −1 RGB=(120,60,5), Y=68.8; composited; inner 0–3 px mean lift over 5–8 px=+10.6 Y.
- right: RGB distances −8..+8: `(165,65,5) (140,60,4) (72,46,2) (33,33,3) (29,31,4) (53,56,7) (66,69,6) (66,68,4) (219,169,118) (216,164,122) (218,163,126) (229,161,134) (241,159,152) (243,159,161) (240,159,156) (236,159,147) (233,159,143)`; luma: `81.9,73.0,48.4,30.8,28.6,51.8,63.8,63.0,175.9,172.0,172.0,173.5,175.9,177.0,176.0,174.5,173.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=53.3); edge at −1 RGB=(66,68,4), Y=63.0; composited; inner 0–3 px mean lift over 5–8 px=-1.9 Y.
- bottom: RGB distances −8..+8: `(103,95,82) (119,111,76) (167,161,97) (134,126,103) (104,94,86) (100,92,80) (88,80,59) (175,172,85) (233,216,187) (213,201,156) (195,184,149) (192,183,148) (191,184,148) (193,186,148) (191,182,145) (191,182,145) (191,183,144)`; luma: `95.8,110.2,157.7,126.0,95.5,92.8,80.2,166.4,217.5,200.3,183.8,182.4,182.9,184.7,181.2,181.2,181.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-7, -6, -5, -2, -1] px; max ΔY=70.6); edge at −1 RGB=(175,172,85), Y=166.4; composited; inner 0–3 px mean lift over 5–8 px=+13.7 Y.
- left: RGB distances −8..+8: `(225,199,138) (207,188,148) (203,190,152) (154,133,85) (137,137,102) (219,217,202) (206,188,144) (206,153,32) (199,198,158) (196,193,149) (196,193,148) (196,193,149) (203,195,149) (212,200,149) (218,205,154) (219,208,161) (218,210,168)`; luma: `200.1,189.2,190.0,134.0,134.5,216.3,188.7,155.5,195.3,190.5,190.4,190.5,193.4,198.9,204.1,206.9,208.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=66.1); edge at −1 RGB=(206,153,32), Y=155.5; composited; inner 0–3 px mean lift over 5–8 px=-13.0 Y.
**top-left 8×8 RGB:**

```text
(133,132,8) (108,106,15) (116,106,11) (208,179,6) (180,153,15) (105,103,29) (53,61,23) (56,62,26)
(141,142,7) (176,161,15) (178,167,30) (144,120,14) (232,202,19) (189,182,62) (91,91,45) (179,173,113)
(149,148,10) (200,178,9) (250,232,20) (164,134,14) (215,195,33) (215,204,107) (220,208,158) (219,207,159)
(128,133,10) (150,139,7) (218,179,0) (200,164,16) (219,205,134) (219,206,158) (217,207,160) (215,205,158)
(122,121,6) (166,153,9) (212,183,39) (217,207,143) (217,206,158) (215,207,163) (213,203,157) (214,203,156)
(116,106,16) (123,99,8) (209,192,112) (217,206,159) (215,207,164) (214,204,159) (212,203,157) (210,200,153)
(188,184,149) (145,130,60) (217,206,159) (215,206,162) (214,205,161) (214,205,161) (211,201,155) (209,198,149)
(105,98,55) (176,170,117) (216,206,159) (214,206,165) (214,205,162) (212,204,160) (210,200,153) (208,197,145)
```
**bottom-right 8×8 RGB:**

```text
(213,160,150) (218,159,149) (218,159,143) (210,161,137) (200,163,133) (200,163,133) (149,129,102) (5,7,1)
(223,158,156) (219,159,147) (212,160,138) (204,162,135) (205,162,136) (187,165,133) (83,80,31) (18,18,1)
(218,159,147) (212,160,139) (205,161,136) (201,162,135) (194,163,132) (177,161,112) (102,105,22) (42,44,4)
(209,160,138) (204,161,136) (200,162,135) (196,163,133) (187,170,135) (146,151,73) (125,131,44) (66,70,9)
(200,162,136) (202,162,137) (192,164,134) (187,166,139) (149,151,86) (146,152,72) (133,139,56) (97,102,26)
(192,163,136) (187,165,136) (143,126,91) (51,49,12) (82,83,26) (136,144,64) (132,140,61) (116,126,43)
(157,136,107) (91,90,33) (68,71,5) (59,58,4) (74,75,10) (89,94,22) (125,133,51) (125,135,50)
(62,65,5) (55,57,0) (51,53,1) (36,35,1) (70,71,15) (109,114,28) (106,114,29) (129,138,50)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 211×194; shape box=(56.00,52.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(160,145,15) (128,120,7) (110,105,3) (108,104,3) (135,127,10) (140,130,18) (113,107,14) (126,118,25) (55,57,4) (47,50,5) (116,81,29) (160,92,40) (156,100,52) (117,82,27) (161,91,84) (244,86,135) (217,150,146)`; luma: `138.8,113.5,98.7,97.6,120.3,124.0,101.6,113.0,52.7,46.1,84.7,102.7,108.4,85.5,105.4,123.1,164.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=41.2); edge at −1 RGB=(126,118,25), Y=113.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-47.9 Y.
- right: RGB distances −8..+8: `(126,127,126) (162,152,146) (153,141,136) (108,106,95) (106,108,64) (111,110,44) (83,83,32) (81,81,48) (83,81,56) (74,72,31) (57,49,27) (67,49,20) (91,67,36) (123,82,52) (106,63,32) (94,51,18) (82,52,22)`; luma: `126.7,153.7,143.2,105.6,104.4,105.4,79.3,78.6,79.6,69.5,49.1,50.7,69.9,88.6,69.9,57.8,56.2`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=48.1); edge at −1 RGB=(81,81,48), Y=78.6; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-5.9 Y.
- bottom: RGB distances −8..+8: `(147,155,147) (156,173,171) (108,122,96) (70,86,40) (108,106,59) (138,133,97) (205,206,198) (185,190,166) (161,172,133) (145,153,90) (112,118,59) (123,133,97) (139,143,45) (179,176,25) (162,162,87) (145,146,107) (149,149,136)`; luma: `152.7,169.2,117.1,79.3,103.0,131.5,205.2,187.2,166.8,146.8,112.5,128.3,135.1,165.7,156.6,143.0,148.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=73.4); edge at −1 RGB=(185,190,166), Y=187.2; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-14.8 Y.
- left: RGB distances −8..+8: `(219,136,181) (224,144,179) (237,172,199) (240,171,210) (203,125,171) (106,80,89) (54,77,38) (64,85,46) (19,30,6) (15,24,3) (23,40,4) (20,38,3) (36,53,20) (81,108,48) (62,80,36) (77,84,30) (123,130,47)`; luma: `156.9,163.5,187.8,188.5,144.9,86.2,69.3,77.7,25.9,20.6,33.8,31.6,47.0,97.9,73.0,78.6,122.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=87.6); edge at −1 RGB=(64,85,46), Y=77.7; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-65.0 Y.
**top-left 8×8 RGB:**

```text
(99,116,64) (82,98,51) (55,65,37) (19,23,42) (27,28,85) (31,32,50) (49,56,25) (46,53,63)
(120,138,83) (97,116,65) (73,86,60) (45,48,87) (33,38,48) (21,27,0) (49,56,34) (46,55,76)
(98,114,65) (106,126,67) (63,74,42) (41,43,59) (31,37,34) (28,36,6) (46,54,23) (48,56,75)
(43,52,24) (105,121,63) (68,78,35) (31,35,20) (22,32,25) (34,44,9) (52,61,25) (54,61,85)
(20,24,11) (86,90,54) (102,105,65) (59,62,54) (38,48,22) (39,52,11) (46,59,10) (28,35,3)
(40,43,24) (104,105,68) (70,72,46) (43,48,37) (35,42,30) (44,55,27) (43,52,13) (26,33,7)
(104,104,80) (113,114,90) (76,77,66) (60,61,49) (15,22,4) (41,54,11) (58,66,27) (62,68,22)
(123,124,108) (74,75,63) (54,55,42) (53,61,36) (19,33,2) (35,48,7) (33,42,2) (62,68,14)
```
**bottom-right 8×8 RGB:**

```text
(117,121,128) (115,120,127) (138,142,146) (153,155,159) (113,114,112) (41,37,29) (41,33,24) (55,46,39)
(114,119,125) (115,121,128) (138,142,148) (124,130,138) (125,121,116) (56,48,37) (42,34,25) (54,45,38)
(124,109,126) (131,126,140) (125,130,138) (121,126,134) (131,120,112) (54,46,37) (33,27,20) (43,35,28)
(133,109,115) (132,120,135) (118,123,131) (123,128,134) (159,141,130) (60,50,40) (22,19,13) (30,24,18)
(121,119,85) (128,118,111) (115,120,128) (115,121,128) (73,70,68) (28,24,17) (29,25,19) (37,30,24)
(109,106,97) (106,108,100) (117,123,126) (120,124,128) (50,47,41) (28,23,15) (45,39,32) (52,44,38)
(110,114,113) (102,112,97) (123,119,76) (155,147,118) (147,123,104) (131,113,99) (102,94,91) (88,86,89)
(118,124,118) (121,122,117) (125,120,108) (184,166,143) (213,174,145) (225,183,151) (152,133,119) (106,101,100)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 145×128; shape box=(23.00,19.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (213,213,213) (140,140,140) (136,136,136) (134,134,134) (133,133,133) (133,133,133) (131,131,131) (131,131,131) (131,131,131)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,213.0,140.0,136.0,134.0,133.0,133.0,131.0,131.0,131.0`; alpha: `5,6,8,8,11,13,16,50,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=50; inner 0–3 px mean lift over 5–8 px=+24.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0`; alpha: `12,14,16,19,20,24,27,61,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=61; inner 0–3 px mean lift over 5–8 px=+15.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (209,209,209) (139,139,139) (137,137,137) (135,135,135) (134,134,134) (134,134,134) (133,133,133) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,209.0,139.0,137.0,135.0,134.0,134.0,133.0,133.0,133.0`; alpha: `21,25,26,31,34,37,40,72,244,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0`; alpha: `12,14,16,18,22,24,27,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (27,27,27) (128,128,128) (191,191,191)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (66,66,66) (182,182,182) (140,140,140) (136,136,136)
(0,0,0) (0,0,0) (0,0,0) (89,89,89) (177,177,177) (137,137,137) (134,134,134) (133,133,133)
(0,0,0) (0,0,0) (66,66,66) (176,176,176) (135,135,135) (132,132,132) (132,132,132) (133,133,133)
(0,0,0) (26,26,26) (181,181,181) (135,135,135) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(0,0,0) (114,114,114) (138,138,138) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(17,17,17) (186,186,186) (134,134,134) (132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131)
```
**bottom-right 8×8 RGB:**

```text
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131) (133,133,133) (183,183,183) (15,15,15)
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131) (137,137,137) (108,108,108) (0,0,0)
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (135,135,135) (177,177,177) (23,23,23) (0,0,0)
(133,133,133) (132,132,132) (131,131,131) (134,134,134) (173,173,173) (58,58,58) (0,0,0) (0,0,0)
(133,133,133) (132,132,132) (136,136,136) (176,176,176) (83,83,83) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (138,138,138) (174,174,174) (61,61,61) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(183,183,183) (118,118,118) (23,23,23) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\plain\appkit-popup

Case: appkit-popup; appearance=light; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-2-host-runtime.json`, `attempt-2-runtime-0.json`.

### menu-window-0 — display

Image `attempt-2-display.png`: 342×218; shape box=(56.00,56.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (251,251,251) (249,249,249) (249,248,249) (247,247,247) (0,123,255) (0,123,255) (0,122,255) (0,122,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,251.0,249.0,248.3,247.0,106.4,106.4,105.7,105.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+144.8 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (249,249,249) (248,248,248) (248,248,248) (248,248,248) (249,249,249) (249,249,249) (249,249,249) (250,250,250) (251,250,251)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,249.0,248.0,248.0,248.0,249.0,249.0,249.0,250.0,250.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.3 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (254,253,254) (254,253,254) (254,254,254)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,253.0,253.0,253.0,253.0,253.0,253.3,253.3,254.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.1 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (250,250,250) (250,250,250) (251,251,251) (251,251,251)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,249.0,249.0,249.0,249.0,249.0,250.0,250.0,251.0,251.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.5 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (253,253,253) (252,252,252) (251,251,251)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (251,251,251) (252,252,252) (250,250,250) (250,250,250)
(255,255,255) (255,255,255) (255,255,255) (251,251,251) (251,251,251) (250,250,250) (249,249,249) (249,249,249)
(255,255,255) (255,255,255) (251,251,251) (251,251,251) (249,249,249) (249,249,249) (249,249,249) (249,249,249)
(255,255,255) (253,253,253) (250,250,250) (249,249,249) (249,248,249) (249,249,249) (249,249,249) (249,248,248)
(255,255,255) (250,250,250) (249,249,249) (248,248,248) (248,248,248) (248,248,248) (248,248,248) (144,195,251)
(254,254,254) (250,250,250) (248,248,248) (248,248,248) (248,248,248) (248,248,248) (142,194,250) (12,128,255)
```
**bottom-right 8×8 RGB:**

```text
(251,251,251) (250,250,250) (250,250,250) (250,249,250) (249,249,249) (249,249,249) (249,249,249) (254,254,254)
(251,251,251) (250,250,250) (250,250,250) (250,249,250) (249,249,249) (249,249,249) (249,249,249) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (250,249,250) (249,249,249) (249,249,249) (253,253,253) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (250,249,250) (251,250,251) (250,250,250) (255,255,255) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (250,250,250) (250,250,250) (255,255,255) (255,255,255) (255,255,255)
(251,250,251) (250,250,250) (250,250,250) (250,250,250) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(251,251,251) (250,250,250) (253,253,253) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(254,254,254) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — single-window

Image `attempt-2-window-0-single.png`: 342×218; shape box=(56.00,52.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-2-window-0-cgwindow.png`: 276×152; shape box=(23.00,19.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (214,214,214) (140,140,140) (137,137,137) (135,135,135) (134,134,134) (0,123,255) (0,123,255) (0,122,255) (0,122,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,214.0,140.0,137.0,135.0,134.0,106.4,106.4,105.7,105.7`; alpha: `4,6,7,9,10,14,16,50,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 5 px; α at −1=50; inner 0–3 px mean lift over 5–8 px=+50.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (195,195,195) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,195.0,132.0,132.0,132.0,132.0,132.0,132.0,133.0,133.0`; alpha: `10,13,16,19,21,24,28,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (212,212,212) (140,140,140) (137,137,137) (136,136,136) (135,135,135) (135,135,135) (134,134,134) (134,134,134) (134,134,134)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,212.0,140.0,137.0,136.0,135.0,135.0,134.0,134.0,134.0`; alpha: `21,25,27,30,34,37,40,72,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+22.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (195,195,195) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,195.0,132.0,132.0,132.0,132.0,132.0,132.0,133.0,133.0`; alpha: `11,12,16,18,22,24,26,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (26,26,26) (128,128,128) (189,189,189)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (66,66,66) (184,184,184) (140,140,140) (136,136,136)
(0,0,0) (0,0,0) (0,0,0) (89,89,89) (178,178,178) (137,137,137) (134,134,134) (134,134,134)
(0,0,0) (0,0,0) (66,66,66) (177,177,177) (136,136,136) (133,133,133) (134,134,134) (133,133,133)
(0,0,0) (26,26,26) (181,181,181) (136,136,136) (133,133,133) (133,133,133) (133,133,133) (133,133,133)
(0,0,0) (117,117,117) (139,139,139) (133,133,133) (133,133,133) (132,132,132) (132,132,132) (76,128,184)
(17,17,17) (188,188,188) (135,135,135) (133,133,133) (132,132,132) (132,132,132) (76,128,184) (3,122,253)
```
**bottom-right 8×8 RGB:**

```text
(133,133,133) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (134,134,134) (183,183,183) (15,15,15)
(133,133,133) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (138,138,138) (108,108,108) (0,0,0)
(133,133,133) (132,132,132) (132,132,132) (132,132,132) (135,135,135) (177,177,177) (23,23,23) (0,0,0)
(133,133,133) (133,133,133) (132,132,132) (135,135,135) (175,175,175) (61,61,61) (0,0,0) (0,0,0)
(133,133,133) (133,133,133) (136,136,136) (176,176,176) (83,83,83) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (139,139,139) (177,177,177) (60,60,60) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(189,189,189) (114,114,114) (23,23,23) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\plain\appkit-pulldown

Case: appkit-pulldown; appearance=light; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 338×194; shape box=(56.00,56.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,251,251) (251,251,251) (251,251,251) (249,249,249) (249,249,249) (249,248,249) (248,248,248) (248,248,248)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,251.2,251.0,251.0,249.0,249.0,248.3,248.0,248.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+3.7 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (250,250,250) (250,250,250) (251,251,251) (252,251,252)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,249.0,249.0,249.0,249.0,249.0,250.0,250.0,251.0,251.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.6 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (254,253,254) (254,253,254)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,253.0,253.0,253.0,253.0,253.0,253.0,253.3,253.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.4 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (250,250,250) (250,250,250) (251,251,251) (252,251,252)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,249.0,249.0,249.0,249.0,249.0,250.0,250.0,251.0,251.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.6 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254) (252,252,252) (252,252,252)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (252,252,252) (251,251,251) (251,251,251)
(255,255,255) (255,255,255) (255,255,255) (251,251,251) (252,252,252) (251,251,251) (251,251,251) (251,251,251)
(255,255,255) (255,255,255) (251,251,251) (251,251,251) (251,251,251) (251,251,251) (251,250,250) (250,250,250)
(255,255,255) (253,253,253) (251,251,251) (251,251,251) (251,250,251) (250,250,250) (250,250,250) (250,250,250)
(255,255,255) (250,250,250) (251,251,251) (250,250,250) (250,250,250) (250,250,250) (250,250,250) (249,249,249)
(254,254,254) (251,251,251) (250,250,250) (250,250,250) (250,250,250) (249,249,249) (249,249,249) (249,249,249)
```
**bottom-right 8×8 RGB:**

```text
(251,251,251) (250,250,250) (250,250,250) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (254,254,254)
(251,251,251) (250,250,250) (250,250,250) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (249,249,249) (249,249,249) (248,248,248) (253,253,253) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (249,249,249) (250,250,250) (250,250,250) (255,255,255) (255,255,255)
(251,250,251) (250,250,250) (250,249,250) (250,250,250) (250,250,250) (255,255,255) (255,255,255) (255,255,255)
(250,250,250) (250,250,250) (250,250,250) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(251,251,251) (250,250,250) (253,253,253) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(254,254,254) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 338×194; shape box=(56.00,52.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 272×128; shape box=(23.00,19.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (213,213,213) (140,140,140) (136,136,136) (134,134,134) (133,133,133) (133,133,133) (131,131,131) (131,131,131) (131,131,131)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,213.0,140.0,136.0,134.0,133.0,133.0,131.0,131.0,131.0`; alpha: `5,6,8,8,11,13,16,50,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=50; inner 0–3 px mean lift over 5–8 px=+24.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0`; alpha: `11,13,16,18,22,24,27,61,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=61; inner 0–3 px mean lift over 5–8 px=+15.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (209,209,209) (139,139,139) (137,137,137) (135,135,135) (134,134,134) (134,134,134) (133,133,133) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,209.0,139.0,137.0,135.0,134.0,134.0,133.0,133.0,133.0`; alpha: `21,25,26,31,34,37,40,72,244,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0`; alpha: `12,14,16,18,22,24,27,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (26,26,26) (125,125,125) (189,189,189)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (66,66,66) (182,182,182) (140,140,140) (136,136,136)
(0,0,0) (0,0,0) (0,0,0) (86,86,86) (178,178,178) (137,137,137) (134,134,134) (133,133,133)
(0,0,0) (0,0,0) (66,66,66) (176,176,176) (135,135,135) (132,132,132) (132,132,132) (132,132,132)
(0,0,0) (26,26,26) (181,181,181) (135,135,135) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(0,0,0) (114,114,114) (138,138,138) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(17,17,17) (186,186,186) (134,134,134) (132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131)
```
**bottom-right 8×8 RGB:**

```text
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131) (133,133,133) (183,183,183) (15,15,15)
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131) (137,137,137) (108,108,108) (0,0,0)
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (134,134,134) (176,176,176) (23,23,23) (0,0,0)
(132,132,132) (132,132,132) (131,131,131) (134,134,134) (172,172,172) (61,61,61) (0,0,0) (0,0,0)
(133,133,133) (132,132,132) (135,135,135) (174,174,174) (80,80,80) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (138,138,138) (178,178,178) (61,61,61) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(188,188,188) (115,115,115) (23,23,23) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\plain\combobox

Case: combobox; appearance=light; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 349×194; shape box=(56.00,56.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(255,255,255) (235,235,235) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (0,112,245) (0,112,245) (0,112,245) (0,112,245)`; luma: `255.0,235.0,255.0,255.0,255.0,255.0,255.0,255.0,237.0,237.0,237.0,237.0,237.0,97.8,97.8,97.8,97.8`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 1/8 ([-7] px; max ΔY=20.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+139.2 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,237.0,237.0,237.0,237.0,237.0,237.0,237.0,237.0,237.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,237.0,237.0,237.0,237.0,237.0,237.0,237.0,237.0,237.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,237.0,237.0,237.0,237.0,237.0,237.0,237.0,237.0,237.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254) (250,250,250)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (240,240,240) (237,237,237)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (250,250,250) (237,237,237) (237,237,237) (237,237,237)
(255,255,255) (255,255,255) (255,255,255) (250,250,250) (237,237,237) (237,237,237) (237,237,237) (237,237,237)
(255,255,255) (255,255,255) (252,252,252) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237)
(255,255,255) (254,254,254) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (209,222,238)
(255,255,255) (250,250,250) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (202,218,238) (81,155,242)
```
**bottom-right 8×8 RGB:**

```text
(237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (250,250,250) (255,255,255)
(237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (254,254,254) (255,255,255)
(237,237,237) (237,237,237) (237,237,237) (237,237,237) (237,237,237) (252,252,252) (255,255,255) (255,255,255)
(237,237,237) (237,237,237) (237,237,237) (237,237,237) (250,250,250) (255,255,255) (255,255,255) (255,255,255)
(237,237,237) (237,237,237) (237,237,237) (250,250,250) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(237,237,237) (237,237,237) (252,252,252) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(250,250,250) (254,254,254) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 349×194; shape box=(56.00,52.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 283×128; shape box=(23.00,19.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (232,233,232) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (0,112,245) (0,112,245) (0,112,245) (0,112,245)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,232.7,230.7,230.7,230.7,230.7,97.8,97.8,97.8,97.8`; alpha: `5,5,8,9,11,13,16,51,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=+133.4 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (232,233,232) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,232.7,230.7,230.7,230.7,230.7,230.7,230.7,230.7,230.7`; alpha: `12,13,16,19,22,24,27,61,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=61; inner 0–3 px mean lift over 5–8 px=+0.5 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (232,233,232) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,232.7,230.7,230.7,230.7,230.7,230.7,230.7,230.7,230.7`; alpha: `21,24,27,30,34,37,40,72,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+0.5 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (232,232,232) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,232.0,230.0,230.0,230.0,230.0,230.0,230.0,230.0,230.0`; alpha: `12,14,16,18,22,24,27,62,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+0.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (106,106,106) (213,213,213)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (43,43,43) (197,197,197) (233,233,233) (231,232,231)
(0,0,0) (0,0,0) (0,0,0) (51,51,51) (218,220,218) (231,232,231) (230,231,230) (230,231,230)
(0,0,0) (0,0,0) (43,43,43) (218,220,218) (231,232,231) (230,231,230) (230,231,230) (230,231,230)
(0,0,0) (0,0,0) (197,197,197) (231,232,231) (230,231,230) (230,231,230) (230,231,230) (230,231,230)
(0,0,0) (105,105,105) (233,233,233) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (200,215,232)
(0,0,0) (213,213,213) (231,232,231) (230,231,230) (230,231,230) (230,231,230) (200,215,232) (77,152,240)
```
**bottom-right 8×8 RGB:**

```text
(230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (231,232,231) (212,212,212) (0,0,0)
(230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (233,234,233) (96,96,96) (0,0,0)
(230,231,230) (230,231,230) (230,231,230) (230,231,230) (231,232,231) (192,192,192) (0,0,0) (0,0,0)
(230,231,230) (230,231,230) (230,231,230) (231,232,231) (216,218,216) (31,31,31) (0,0,0) (0,0,0)
(230,231,230) (230,231,230) (231,232,231) (217,217,217) (47,47,47) (0,0,0) (0,0,0) (0,0,0)
(231,232,231) (233,233,233) (186,186,186) (31,31,31) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(206,206,206) (88,88,88) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\plain\context

Case: context; appearance=light; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 212×205; shape box=(56.00,56.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,253,253) (253,253,253) (252,251,252) (251,251,251) (251,250,250) (250,250,250) (250,249,249) (249,249,249)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,253.2,253.0,251.3,251.0,250.2,250.0,249.2,249.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+3.5 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (250,249,249) (250,250,250) (251,250,250) (251,251,251) (252,251,252)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,249.0,249.0,249.0,249.0,249.2,250.0,250.2,251.0,251.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.6 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (254,253,253) (254,253,254) (254,254,254)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,253.0,253.0,253.0,253.0,253.0,253.2,253.3,254.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.1 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (250,249,249) (250,250,250) (251,250,250) (251,251,251) (252,251,252)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,249.0,249.0,249.0,249.0,249.2,250.0,250.2,251.0,251.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.6 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254) (252,252,252) (252,252,252)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (252,252,252) (253,252,253) (253,252,252)
(255,255,255) (255,255,255) (255,255,255) (251,251,251) (252,252,252) (252,252,252) (252,252,252) (252,252,252)
(255,255,255) (255,255,255) (251,251,251) (253,253,253) (252,252,252) (252,252,252) (252,251,252) (252,251,251)
(255,255,255) (253,253,253) (251,251,251) (252,252,252) (252,251,251) (251,251,251) (251,251,251) (251,251,251)
(255,255,255) (250,250,250) (252,251,252) (251,251,251) (251,251,251) (251,251,251) (251,250,251) (250,250,250)
(254,254,254) (251,251,251) (251,251,251) (251,251,251) (251,250,250) (250,250,250) (250,250,250) (250,250,250)
```
**bottom-right 8×8 RGB:**

```text
(251,251,251) (250,250,250) (250,250,250) (250,249,249) (249,249,249) (249,249,249) (250,250,250) (254,254,254)
(251,251,251) (250,250,250) (250,250,250) (250,249,249) (249,249,249) (249,249,249) (249,249,249) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (250,249,249) (249,249,249) (249,248,249) (253,253,253) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (250,249,249) (250,250,250) (250,250,250) (255,255,255) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (250,250,250) (250,250,250) (255,255,255) (255,255,255) (255,255,255)
(251,250,250) (250,250,250) (250,250,250) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(251,251,251) (250,250,250) (253,253,253) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(254,254,254) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 212×205; shape box=(56.00,52.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 146×139; shape box=(23.00,19.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (213,213,213) (140,140,140) (137,137,137) (134,134,134) (133,133,133) (133,133,133) (132,132,132) (131,131,131) (131,131,131)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,213.0,140.0,137.0,134.0,133.0,133.0,132.0,131.0,131.0`; alpha: `5,6,8,10,12,14,16,50,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=50; inner 0–3 px mean lift over 5–8 px=+24.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0,132.0`; alpha: `11,13,16,18,22,25,27,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+14.8 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (209,209,209) (140,140,140) (137,137,137) (135,135,135) (134,134,134) (134,134,134) (133,133,133) (133,133,133) (134,134,134)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,209.0,140.0,137.0,135.0,134.0,134.0,133.0,133.0,134.0`; alpha: `21,24,27,31,34,36,40,72,244,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0,132.0`; alpha: `11,14,16,18,21,24,27,61,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=61; inner 0–3 px mean lift over 5–8 px=+14.8 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (27,27,27) (128,128,128) (191,191,191)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (66,66,66) (182,182,182) (140,140,140) (136,136,136)
(0,0,0) (0,0,0) (0,0,0) (89,89,89) (178,178,178) (137,137,137) (134,134,134) (134,134,134)
(0,0,0) (0,0,0) (66,66,66) (177,177,177) (136,136,136) (133,133,133) (132,132,132) (133,133,133)
(0,0,0) (26,26,26) (181,181,181) (136,136,136) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(0,0,0) (114,114,114) (138,138,138) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(17,17,17) (186,186,186) (134,134,134) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
```
**bottom-right 8×8 RGB:**

```text
(132,132,132) (132,132,132) (132,132,132) (131,131,131) (131,131,131) (133,133,133) (178,178,178) (15,15,15)
(132,132,132) (132,132,132) (132,132,132) (131,131,131) (131,131,131) (137,137,137) (111,111,111) (0,0,0)
(132,132,132) (132,132,132) (132,132,132) (131,131,131) (135,135,135) (174,174,174) (23,23,23) (0,0,0)
(133,133,133) (132,132,132) (132,132,132) (134,134,134) (176,176,176) (58,58,58) (0,0,0) (0,0,0)
(133,133,133) (133,133,133) (135,135,135) (173,173,173) (84,84,84) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (139,139,139) (183,183,183) (61,61,61) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(186,186,186) (115,115,115) (22,22,22) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\plain\submenu

Case: submenu; appearance=light; background=plain; opened=True.

Visible captured menu windows: 1.

Nested submenu result: parent popup captured; no separate submenu window appeared.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 342×218; shape box=(56.00,56.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (251,251,251) (249,249,249) (249,248,249) (247,247,247) (0,123,255) (0,123,255) (0,122,255) (0,122,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,251.0,249.0,248.3,247.0,106.4,106.4,105.7,105.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+144.8 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (249,249,249) (248,248,248) (248,248,248) (248,248,248) (249,249,249) (249,249,249) (249,249,249) (250,250,250) (251,250,251)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,249.0,248.0,248.0,248.0,249.0,249.0,249.0,250.0,250.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.3 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (254,253,254) (254,253,254) (254,254,254)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,253.0,253.0,253.0,253.0,253.0,253.3,253.3,254.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.1 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (250,250,250) (250,250,250) (251,251,251) (251,251,251)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,249.0,249.0,249.0,249.0,249.0,250.0,250.0,251.0,251.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.5 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (253,253,253) (252,252,252) (251,251,251)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (251,251,251) (252,252,252) (250,250,250) (250,250,250)
(255,255,255) (255,255,255) (255,255,255) (251,251,251) (251,251,251) (250,250,250) (249,249,249) (249,249,249)
(255,255,255) (255,255,255) (251,251,251) (251,251,251) (249,249,249) (249,249,249) (249,249,249) (249,249,249)
(255,255,255) (253,253,253) (250,250,250) (249,249,249) (249,248,249) (249,249,249) (249,249,249) (249,248,248)
(255,255,255) (250,250,250) (249,249,249) (248,248,248) (248,248,248) (248,248,248) (248,248,248) (144,195,251)
(254,254,254) (250,250,250) (248,248,248) (248,248,248) (248,248,248) (248,248,248) (142,194,250) (12,128,255)
```
**bottom-right 8×8 RGB:**

```text
(251,251,251) (250,250,250) (250,250,250) (250,249,250) (249,249,249) (249,249,249) (249,249,249) (254,254,254)
(251,251,251) (250,250,250) (250,250,250) (250,249,250) (249,249,249) (249,249,249) (249,249,249) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (250,249,250) (249,249,249) (249,249,249) (253,253,253) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (250,249,250) (251,250,251) (250,250,250) (255,255,255) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (250,250,250) (250,250,250) (255,255,255) (255,255,255) (255,255,255)
(251,250,251) (250,250,250) (250,250,250) (250,250,250) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(251,251,251) (250,250,250) (253,253,253) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(254,254,254) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 342×218; shape box=(56.00,52.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 276×152; shape box=(23.00,19.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (214,214,214) (140,140,140) (137,137,137) (135,135,135) (134,134,134) (0,123,255) (0,123,255) (0,122,255) (0,122,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,214.0,140.0,137.0,135.0,134.0,106.4,106.4,105.7,105.7`; alpha: `4,6,7,9,10,14,16,50,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 5 px; α at −1=50; inner 0–3 px mean lift over 5–8 px=+50.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (195,195,195) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,195.0,132.0,132.0,132.0,132.0,132.0,132.0,133.0,133.0`; alpha: `10,13,16,19,21,24,28,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (212,212,212) (140,140,140) (137,137,137) (136,136,136) (135,135,135) (135,135,135) (134,134,134) (134,134,134) (134,134,134)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,212.0,140.0,137.0,136.0,135.0,135.0,134.0,134.0,134.0`; alpha: `21,25,27,30,34,37,40,72,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+22.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (195,195,195) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,195.0,132.0,132.0,132.0,132.0,132.0,132.0,133.0,133.0`; alpha: `11,12,16,18,22,24,26,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (26,26,26) (128,128,128) (189,189,189)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (66,66,66) (184,184,184) (140,140,140) (136,136,136)
(0,0,0) (0,0,0) (0,0,0) (89,89,89) (178,178,178) (137,137,137) (134,134,134) (134,134,134)
(0,0,0) (0,0,0) (66,66,66) (177,177,177) (136,136,136) (133,133,133) (134,134,134) (133,133,133)
(0,0,0) (26,26,26) (181,181,181) (136,136,136) (133,133,133) (133,133,133) (133,133,133) (133,133,133)
(0,0,0) (117,117,117) (139,139,139) (133,133,133) (133,133,133) (132,132,132) (132,132,132) (76,128,184)
(17,17,17) (188,188,188) (135,135,135) (133,133,133) (132,132,132) (132,132,132) (76,128,184) (3,122,253)
```
**bottom-right 8×8 RGB:**

```text
(133,133,133) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (134,134,134) (183,183,183) (15,15,15)
(133,133,133) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (138,138,138) (108,108,108) (0,0,0)
(133,133,133) (132,132,132) (132,132,132) (132,132,132) (135,135,135) (177,177,177) (23,23,23) (0,0,0)
(133,133,133) (133,133,133) (132,132,132) (135,135,135) (175,175,175) (61,61,61) (0,0,0) (0,0,0)
(133,133,133) (133,133,133) (136,136,136) (176,176,176) (83,83,83) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (139,139,139) (177,177,177) (60,60,60) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(189,189,189) (114,114,114) (23,23,23) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\plain\swiftui-menu

Case: swiftui-menu; appearance=light; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 272×194; shape box=(56.00,56.00,160.00,82.00) px.
- top: RGB distances −8..+8: `(213,213,213) (213,213,213) (213,213,213) (213,213,213) (213,213,213) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (251,251,251) (249,249,249) (249,249,249) (248,248,248) (247,247,247) (247,247,247) (247,247,247) (247,247,247)`; luma: `213.0,213.0,213.0,213.0,213.0,255.0,255.0,255.0,255.0,251.0,249.0,249.0,248.0,247.0,247.0,247.0,247.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 3/8 ([-3, -2, -1] px; max ΔY=42.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+4.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (250,250,250) (250,250,250) (251,251,251) (252,251,252)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,249.0,249.0,249.0,249.0,249.0,250.0,250.0,251.0,251.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.6 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (254,253,254) (254,253,254)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,253.0,253.0,253.0,253.0,253.0,253.0,253.3,253.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.4 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (250,250,250) (250,250,250) (251,251,251) (252,251,252)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,249.0,249.0,249.0,249.0,249.0,250.0,250.0,251.0,251.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.6 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254) (252,252,252) (252,252,252)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (251,251,251) (250,250,250) (250,250,250)
(255,255,255) (255,255,255) (255,255,255) (251,251,251) (251,251,251) (250,250,250) (250,250,250) (250,250,250)
(255,255,255) (255,255,255) (251,251,251) (251,250,251) (250,250,250) (250,250,250) (250,250,250) (250,249,250)
(255,255,255) (253,253,253) (251,251,251) (250,250,250) (250,250,250) (250,250,250) (249,249,249) (249,249,249)
(255,255,255) (250,250,250) (250,250,250) (250,250,250) (250,249,249) (249,249,249) (249,249,249) (249,249,249)
(254,254,254) (251,251,251) (250,250,250) (250,249,250) (249,249,249) (249,249,249) (249,248,248) (248,248,248)
```
**bottom-right 8×8 RGB:**

```text
(251,251,251) (250,250,250) (250,250,250) (249,249,249) (249,249,249) (249,249,249) (250,250,250) (254,254,254)
(251,251,251) (250,250,250) (250,250,250) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (249,249,249) (249,249,249) (249,249,249) (253,253,253) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (249,249,249) (250,249,250) (250,250,250) (255,255,255) (255,255,255)
(251,250,251) (250,250,250) (250,249,250) (251,251,251) (250,250,250) (255,255,255) (255,255,255) (255,255,255)
(250,250,250) (250,250,250) (250,250,250) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(252,252,252) (250,250,250) (253,253,253) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(254,254,254) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 272×194; shape box=(56.00,52.00,160.00,82.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (253,253,253) (251,251,251) (248,248,248) (241,241,241) (233,233,233) (220,220,220) (218,218,218) (251,251,251) (251,251,251) (255,255,255) (206,205,205) (159,159,159)`; luma: `255.0,255.0,255.0,255.0,255.0,253.0,251.0,248.0,241.0,233.0,220.0,218.0,251.0,251.0,255.0,205.2,159.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 1/8 ([-1] px; max ΔY=7.0); edge at −1 RGB=(248,248,248), Y=248.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+10.4 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 206×128; shape box=(23.00,19.00,160.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (213,213,213) (140,140,140) (136,136,136) (134,134,134) (133,133,133) (133,133,133) (131,131,131) (131,131,131) (131,131,131)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,213.0,140.0,136.0,134.0,133.0,133.0,131.0,131.0,131.0`; alpha: `4,6,7,10,11,13,16,51,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 5 px; α at −1=51; inner 0–3 px mean lift over 5–8 px=+24.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0`; alpha: `11,13,16,18,21,24,27,61,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=61; inner 0–3 px mean lift over 5–8 px=+15.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (209,209,209) (139,139,139) (137,137,137) (135,135,135) (134,134,134) (134,134,134) (133,133,133) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,209.0,139.0,137.0,135.0,134.0,134.0,133.0,133.0,133.0`; alpha: `21,24,27,30,34,36,40,72,244,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0`; alpha: `12,14,16,18,22,24,27,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (26,26,26) (125,125,125) (190,190,190)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (66,66,66) (182,182,182) (140,140,140) (136,136,136)
(0,0,0) (0,0,0) (0,0,0) (89,89,89) (178,178,178) (137,137,137) (134,134,134) (133,133,133)
(0,0,0) (0,0,0) (66,66,66) (176,176,176) (135,135,135) (132,132,132) (132,132,132) (132,132,132)
(0,0,0) (26,26,26) (181,181,181) (135,135,135) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(0,0,0) (114,114,114) (138,138,138) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(17,17,17) (186,186,186) (134,134,134) (132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131)
```
**bottom-right 8×8 RGB:**

```text
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131) (133,133,133) (183,183,183) (15,15,15)
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131) (137,137,137) (109,109,109) (0,0,0)
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (134,134,134) (176,176,176) (23,23,23) (0,0,0)
(132,132,132) (132,132,132) (131,131,131) (134,134,134) (173,173,173) (61,61,61) (0,0,0) (0,0,0)
(133,133,133) (132,132,132) (135,135,135) (175,175,175) (80,80,80) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (138,138,138) (177,177,177) (61,61,61) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(189,189,189) (115,115,115) (23,23,23) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light\plain\swiftui-picker

Case: swiftui-picker; appearance=light; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 211×194; shape box=(56.00,56.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (246,246,246) (244,244,244) (242,242,242) (240,240,240) (239,238,238) (237,237,237) (236,236,236) (235,235,235)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,246.0,244.0,242.0,240.0,238.2,237.0,236.0,235.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+10.2 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (248,248,248) (247,247,247) (247,247,247) (247,247,247) (248,248,248) (248,248,248) (249,249,249) (249,249,249) (250,250,250)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,248.0,247.0,247.0,247.0,248.0,248.0,249.0,249.0,250.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.8 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (253,253,253) (254,253,254) (254,253,254)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,253.0,253.0,253.0,253.0,253.0,253.0,253.3,253.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.4 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (248,248,248) (248,248,248) (248,248,248) (248,248,248) (248,248,248) (249,249,249) (249,249,249) (250,250,250) (250,250,250)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,248.0,248.0,248.0,248.0,248.0,249.0,249.0,250.0,250.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-1.5 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254) (252,252,252) (251,251,251)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (251,251,251) (248,248,248) (247,247,247)
(255,255,255) (255,255,255) (255,255,255) (251,251,251) (250,250,250) (247,247,247) (247,247,247) (247,247,247)
(255,255,255) (255,255,255) (251,251,251) (249,249,249) (247,247,247) (247,247,247) (246,246,246) (246,246,246)
(255,255,255) (253,253,253) (249,249,249) (246,246,246) (246,246,246) (246,246,246) (246,246,246) (245,245,245)
(255,255,255) (250,250,250) (246,246,246) (246,245,245) (245,245,245) (245,245,245) (245,245,245) (244,244,244)
(254,254,254) (249,249,249) (245,245,245) (245,245,245) (245,245,245) (244,244,244) (244,244,244) (244,243,243)
```
**bottom-right 8×8 RGB:**

```text
(251,251,251) (250,250,250) (250,250,250) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (254,254,254)
(251,251,251) (250,250,250) (250,250,250) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (249,249,249) (249,249,249) (249,249,249) (253,253,253) (255,255,255)
(251,251,251) (250,250,250) (250,250,250) (249,249,249) (250,249,250) (250,250,250) (255,255,255) (255,255,255)
(251,250,251) (250,250,250) (250,249,250) (251,251,251) (250,250,250) (255,255,255) (255,255,255) (255,255,255)
(250,250,250) (250,250,250) (250,250,250) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(252,252,252) (250,250,250) (253,253,253) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(254,254,254) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 211×194; shape box=(56.00,52.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 145×128; shape box=(23.00,19.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (213,213,213) (140,140,140) (136,136,136) (134,134,134) (133,133,133) (133,133,133) (131,131,131) (131,131,131) (131,131,131)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,213.0,140.0,136.0,134.0,133.0,133.0,131.0,131.0,131.0`; alpha: `5,6,8,8,11,13,16,50,243,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=50; inner 0–3 px mean lift over 5–8 px=+24.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0`; alpha: `12,14,16,19,20,24,27,61,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=61; inner 0–3 px mean lift over 5–8 px=+15.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (209,209,209) (139,139,139) (137,137,137) (135,135,135) (134,134,134) (134,134,134) (133,133,133) (133,133,133) (133,133,133)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,209.0,139.0,137.0,135.0,134.0,134.0,133.0,133.0,133.0`; alpha: `21,25,26,31,34,37,40,72,244,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=72; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (194,194,194) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (131,131,131) (132,132,132) (132,132,132) (132,132,132)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,194.0,131.0,131.0,131.0,131.0,131.0,132.0,132.0,132.0`; alpha: `12,14,16,18,22,24,27,62,188,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=62; inner 0–3 px mean lift over 5–8 px=+15.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (27,27,27) (128,128,128) (191,191,191)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (66,66,66) (182,182,182) (140,140,140) (136,136,136)
(0,0,0) (0,0,0) (0,0,0) (89,89,89) (177,177,177) (137,137,137) (134,134,134) (133,133,133)
(0,0,0) (0,0,0) (66,66,66) (176,176,176) (135,135,135) (132,132,132) (132,132,132) (133,133,133)
(0,0,0) (26,26,26) (181,181,181) (135,135,135) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(0,0,0) (114,114,114) (138,138,138) (132,132,132) (132,132,132) (132,132,132) (132,132,132) (132,132,132)
(17,17,17) (186,186,186) (134,134,134) (132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131)
```
**bottom-right 8×8 RGB:**

```text
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131) (133,133,133) (183,183,183) (15,15,15)
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (131,131,131) (137,137,137) (108,108,108) (0,0,0)
(132,132,132) (132,132,132) (131,131,131) (131,131,131) (135,135,135) (177,177,177) (23,23,23) (0,0,0)
(133,133,133) (132,132,132) (131,131,131) (134,134,134) (173,173,173) (58,58,58) (0,0,0) (0,0,0)
(133,133,133) (132,132,132) (136,136,136) (176,176,176) (83,83,83) (0,0,0) (0,0,0) (0,0,0)
(135,135,135) (138,138,138) (174,174,174) (61,61,61) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(183,183,183) (118,118,118) (23,23,23) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light-contrast\photo\appkit-popup

Case: appkit-popup; appearance=light-contrast; background=photo; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

## macos27-captures\out\menu-outline\menus\light-contrast\photo\appkit-pulldown

Case: appkit-pulldown; appearance=light-contrast; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 338×194; shape box=(56.00,56.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(208,192,144) (220,219,187) (218,198,140) (204,181,129) (224,201,146) (229,209,166) (244,244,244) (241,238,227) (249,242,219) (233,227,207) (230,225,205) (229,224,203) (228,223,203) (228,222,202) (226,221,202) (226,221,201) (226,220,201)`; luma: `191.9,216.9,198.1,182.1,201.9,210.1,244.0,237.8,241.8,226.8,224.6,223.5,222.6,221.8,220.7,220.6,219.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=52.1); edge at −1 RGB=(241,238,227), Y=237.8; composited; inner 0–3 px mean lift over 5–8 px=+8.4 Y.
- right: RGB distances −8..+8: `(70,75,2) (70,74,1) (84,87,3) (80,84,1) (85,86,3) (139,133,12) (117,106,5) (77,75,0) (228,211,178) (224,216,182) (225,212,182) (225,210,179) (225,210,179) (225,211,179) (225,211,180) (225,212,180) (225,212,181)`; luma: `68.7,67.9,80.3,77.2,79.8,125.5,101.0,70.0,212.2,215.2,212.6,211.0,211.0,211.7,211.7,212.5,212.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-6, -5, -4, -3, -2] px; max ΔY=56.9); edge at −1 RGB=(77,75,0), Y=70.0; composited; inner 0–3 px mean lift over 5–8 px=+0.7 Y.
- bottom: RGB distances −8..+8: `(150,130,106) (109,88,73) (146,107,84) (199,142,106) (80,51,24) (191,183,157) (238,238,217) (163,161,106) (249,242,217) (225,223,198) (222,220,197) (223,222,194) (223,222,194) (221,219,194) (218,216,195) (218,216,194) (218,216,194)`; luma: `132.5,91.4,113.6,151.5,55.2,182.8,236.5,157.5,241.7,221.6,218.8,220.2,220.2,217.6,214.9,214.8,214.8`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=104.0); edge at −1 RGB=(163,161,106), Y=157.5; composited; inner 0–3 px mean lift over 5–8 px=+10.0 Y.
- left: RGB distances −8..+8: `(107,130,223) (106,117,202) (71,56,119) (116,113,158) (152,161,214) (96,110,186) (149,159,216) (198,199,220) (210,218,232) (218,226,240) (220,225,237) (215,221,232) (215,222,234) (216,223,237) (216,223,239) (217,224,239) (218,224,239)`; luma: `131.8,120.8,63.7,116.9,162.9,112.5,161.0,200.3,217.3,225.3,224.8,220.5,221.4,222.5,222.7,223.6,223.8`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=68.5); edge at −1 RGB=(198,199,220), Y=200.3; composited; inner 0–3 px mean lift over 5–8 px=-1.2 Y.
**top-left 8×8 RGB:**

```text
(191,206,157) (90,101,58) (24,34,0) (73,90,20) (134,158,85) (154,179,118) (147,167,113) (127,149,91)
(199,215,163) (123,135,89) (15,23,1) (22,34,6) (82,99,43) (136,158,96) (144,165,114) (184,197,176)
(201,213,158) (137,150,105) (16,23,1) (19,30,4) (35,46,16) (167,180,155) (211,217,222) (209,215,216)
(144,153,95) (123,134,81) (35,47,5) (57,71,25) (197,204,201) (210,217,221) (209,214,206) (210,214,206)
(56,62,11) (97,105,33) (92,106,38) (199,209,203) (209,215,218) (210,214,209) (211,216,208) (213,217,208)
(11,17,2) (33,40,9) (139,146,131) (211,217,223) (211,216,212) (215,219,212) (217,221,213) (216,220,212)
(6,14,1) (41,49,38) (209,216,222) (210,216,215) (215,219,213) (220,224,217) (218,222,214) (216,221,213)
(7,16,1) (141,149,142) (211,217,224) (214,218,215) (220,223,217) (219,223,215) (218,222,214) (217,221,214)
```
**bottom-right 8×8 RGB:**

```text
(220,219,212) (219,218,211) (216,216,208) (214,214,204) (213,213,202) (213,213,201) (200,201,193) (210,209,207)
(221,220,213) (219,218,210) (215,215,208) (214,214,204) (213,213,203) (212,212,202) (221,218,214) (242,239,237)
(220,219,212) (217,216,209) (214,215,206) (213,214,204) (213,213,203) (183,185,179) (144,142,145) (154,152,154)
(217,217,210) (215,215,207) (214,214,206) (213,214,205) (207,208,198) (143,145,147) (178,177,178) (215,214,213)
(216,217,209) (215,216,207) (215,215,206) (215,215,207) (226,225,222) (251,250,247) (255,255,255) (253,254,252)
(216,216,209) (215,215,208) (203,203,199) (192,192,192) (192,191,192) (178,176,177) (160,158,157) (138,138,136)
(179,180,176) (118,119,121) (101,102,105) (103,104,105) (111,111,111) (129,129,128) (153,151,150) (169,168,166)
(123,124,126) (126,127,129) (132,132,135) (161,159,160) (211,209,208) (233,230,227) (242,238,234) (240,237,232)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 338×194; shape box=(56.00,52.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(198,158,119) (195,162,126) (158,132,101) (74,61,31) (79,63,33) (104,82,44) (94,76,36) (94,82,42) (80,60,30) (100,56,40) (156,80,78) (185,51,87) (173,26,69) (146,53,57) (134,78,59) (131,94,65) (155,131,52)`; luma: `163.7,166.4,135.3,61.6,64.2,83.9,76.9,81.7,62.1,64.2,96.0,82.1,60.4,73.1,88.5,99.8,130.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=102.1); edge at −1 RGB=(94,82,42), Y=81.7; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-21.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(69,59,50) (64,53,48) (50,41,36) (51,42,34) (55,46,39) (63,53,46) (63,54,48) (67,58,52) (64,52,45) (60,51,43) (69,61,56) (74,66,55) (86,77,51) (68,66,43) (48,55,34) (70,78,57) (75,82,70)`; luma: `60.5,55.0,42.6,43.3,47.4,54.6,55.5,59.5,54.0,52.3,62.3,66.9,77.0,64.8,52.0,74.8,79.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 3/8 ([-6, -5, -4] px; max ΔY=17.9); edge at −1 RGB=(67,58,52), Y=59.5; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-8.9 Y.
- left: RGB distances −8..+8: `(229,125,185) (225,76,150) (235,110,178) (242,169,218) (236,146,202) (232,122,188) (234,143,198) (236,168,205) (237,173,204) (239,173,209) (245,181,221) (209,154,187) (144,86,95) (179,41,73) (236,74,138) (236,106,165) (234,120,174)`; luma: `151.4,113.0,141.5,188.1,169.2,150.2,166.3,185.1,188.8,189.6,197.5,168.1,99.0,72.6,113.1,137.9,148.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -2, -1] px; max ΔY=38.4); edge at −1 RGB=(236,168,205), Y=185.1; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+68.1 Y.
**top-left 8×8 RGB:**

```text
(60,58,11) (51,53,7) (35,39,1) (34,41,1) (66,73,3) (91,82,5) (105,79,2) (144,110,6)
(44,48,6) (55,62,7) (58,68,4) (57,65,4) (85,91,16) (76,79,16) (58,59,12) (65,66,19)
(64,78,18) (65,76,21) (86,98,34) (77,86,18) (87,92,21) (90,88,21) (74,71,14) (12,15,4)
(96,113,55) (77,91,40) (101,114,59) (107,123,54) (102,112,37) (106,104,28) (73,67,10) (43,38,5)
(92,104,49) (67,79,37) (75,87,41) (116,132,65) (118,126,60) (79,77,27) (33,31,3) (58,51,9)
(78,87,21) (58,64,16) (54,58,14) (98,100,40) (102,96,43) (35,31,13) (28,24,1) (72,62,9)
(83,85,14) (67,68,7) (47,50,0) (75,68,14) (106,88,34) (70,63,22) (47,43,5) (24,25,3)
(93,99,44) (88,93,34) (69,73,7) (94,90,23) (110,98,48) (42,41,16) (11,17,1) (12,16,1)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 272×128; shape box=(23.00,19.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (191,191,191) (188,188,188) (187,187,187) (185,185,185) (185,185,185) (183,183,183) (183,183,183) (183,183,183)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.0,188.0,187.0,185.0,185.0,183.0,183.0,183.0`; alpha: `5,6,8,8,11,13,16,47,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=47; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (184,184,184) (184,184,184) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,183.0,183.0,184.0,184.0,185.0`; alpha: `11,13,16,18,22,24,27,58,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+17.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (191,191,191) (188,188,188) (187,187,187) (187,187,187) (187,187,187) (186,186,186) (186,186,186) (186,186,186)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.0,188.0,187.0,187.0,187.0,186.0,186.0,186.0`; alpha: `21,25,26,31,34,37,40,69,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=69; inner 0–3 px mean lift over 5–8 px=+19.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (184,184,184) (184,184,184) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,183.0,183.0,184.0,184.0,185.0`; alpha: `12,14,16,18,22,24,27,59,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+17.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (111,111,111)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (145,145,145) (231,231,231) (253,253,253)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (198,198,198) (250,250,250) (210,210,210) (194,194,194)
(0,0,0) (0,0,0) (0,0,0) (209,209,209) (245,245,245) (200,200,200) (186,186,186) (186,186,186)
(0,0,0) (0,0,0) (195,195,195) (245,245,245) (196,196,196) (185,185,185) (185,185,185) (184,184,184)
(0,0,0) (139,139,139) (251,251,251) (199,199,199) (184,184,184) (184,184,184) (184,184,184) (184,184,184)
(0,0,0) (226,226,226) (209,209,209) (184,184,184) (184,184,184) (184,184,184) (184,184,184) (184,184,184)
(100,100,100) (250,250,250) (192,192,192) (184,184,184) (184,184,184) (184,184,184) (183,183,183) (183,183,183)
```
**bottom-right 8×8 RGB:**

```text
(184,184,184) (184,184,184) (183,183,183) (183,183,183) (183,183,183) (191,191,191) (250,250,250) (93,93,93)
(184,184,184) (184,184,184) (183,183,183) (183,183,183) (183,183,183) (208,208,208) (222,222,222) (0,0,0)
(184,184,184) (184,184,184) (183,183,183) (183,183,183) (197,197,197) (247,247,247) (129,129,129) (0,0,0)
(184,184,184) (184,184,184) (183,183,183) (195,195,195) (244,244,244) (187,187,187) (0,0,0) (0,0,0)
(185,185,185) (185,185,185) (198,198,198) (243,243,243) (202,202,202) (0,0,0) (0,0,0) (0,0,0)
(193,193,193) (209,209,209) (249,249,249) (189,189,189) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(251,251,251) (224,224,224) (126,126,126) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(90,90,90) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light-contrast\photo\combobox

Case: combobox; appearance=light-contrast; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 349×194; shape box=(56.00,56.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(245,238,223) (96,81,24) (77,75,42) (158,134,74) (208,192,144) (220,219,187) (218,198,140) (204,181,129) (221,213,189) (221,213,189) (221,213,189) (221,212,189) (220,212,188) (0,64,221) (0,64,221) (0,64,221) (0,64,221)`; luma: `238.4,80.1,73.0,134.8,191.9,216.9,198.1,182.1,213.0,213.0,213.0,212.3,212.0,61.7,61.7,61.7,61.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=165.4); edge at −1 RGB=(204,181,129), Y=182.1; composited; inner 0–3 px mean lift over 5–8 px=+151.1 Y.
- right: RGB distances −8..+8: `(156,44,2) (90,60,2) (106,113,4) (101,108,2) (84,87,2) (114,117,3) (102,100,2) (88,87,2) (221,204,177) (221,204,177) (221,204,177) (221,204,177) (221,204,177) (221,204,177) (221,204,177) (221,204,177) (221,203,177)`; luma: `64.8,62.2,103.6,98.9,80.2,108.1,93.3,81.1,205.7,205.7,205.7,205.7,205.7,205.7,205.7,205.7,204.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=43.4); edge at −1 RGB=(88,87,2), Y=81.1; composited; inner 0–3 px mean lift over 5–8 px=+0.2 Y.
- bottom: RGB distances −8..+8: `(80,51,24) (191,183,157) (238,238,217) (163,161,106) (117,117,44) (96,96,45) (163,163,120) (166,161,102) (206,205,178) (206,205,178) (206,205,178) (206,205,178) (206,205,178) (206,205,178) (206,205,178) (206,205,178) (206,205,178)`; luma: `55.2,182.8,236.5,157.5,111.7,92.3,159.9,157.8,203.3,203.3,203.3,203.3,203.3,203.3,203.3,203.3,203.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=181.3); edge at −1 RGB=(166,161,102), Y=157.8; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(42,85,178) (50,91,185) (107,133,210) (123,143,218) (83,101,188) (51,67,153) (53,73,163) (68,92,178) (211,217,214) (211,217,214) (211,217,214) (211,217,214) (211,217,214) (211,217,214) (211,217,214) (211,217,214) (211,217,213)`; luma: `82.6,89.1,133.0,144.2,103.5,69.8,75.2,93.1,215.5,215.5,215.5,215.5,215.5,215.5,215.5,215.5,215.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=61.6); edge at −1 RGB=(68,92,178), Y=93.1; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(12,18,0) (49,60,23) (155,173,138) (203,221,194) (148,168,113) (139,160,102) (118,142,68) (141,163,97)
(10,16,3) (25,33,1) (93,106,58) (209,224,197) (154,174,129) (169,186,136) (114,130,69) (162,175,132)
(16,26,1) (33,45,4) (48,59,12) (141,150,117) (166,185,143) (193,205,173) (195,200,194) (205,210,206)
(23,35,0) (34,47,3) (13,22,0) (67,74,47) (190,201,172) (206,210,206) (206,210,206) (206,210,206)
(27,42,0) (28,40,2) (17,24,7) (115,119,107) (206,210,207) (206,210,207) (206,210,207) (206,210,207)
(30,47,1) (23,33,3) (77,79,73) (206,210,207) (206,210,207) (206,210,207) (206,210,207) (206,210,207)
(33,50,1) (33,40,25) (195,200,197) (206,211,208) (206,211,208) (206,211,208) (206,211,208) (182,194,210)
(43,60,2) (111,120,95) (206,211,208) (206,211,208) (206,211,208) (206,211,208) (175,189,210) (71,114,217)
```
**bottom-right 8×8 RGB:**

```text
(211,206,181) (211,206,181) (211,206,181) (211,206,181) (211,206,181) (211,206,181) (159,164,156) (30,37,22)
(211,206,181) (211,206,181) (211,206,181) (211,206,181) (211,206,181) (208,205,180) (114,128,126) (21,29,12)
(211,206,181) (211,206,181) (211,206,181) (211,206,181) (211,206,181) (150,154,149) (91,104,98) (19,21,4)
(211,206,181) (211,206,181) (211,206,181) (211,206,181) (183,186,181) (136,144,144) (82,90,87) (50,53,44)
(211,206,181) (211,206,181) (211,206,181) (216,215,206) (198,205,206) (158,169,173) (89,97,102) (112,121,115)
(211,206,181) (214,207,184) (222,221,216) (170,175,178) (125,135,143) (91,100,109) (119,131,133) (73,78,64)
(178,175,170) (163,161,162) (121,123,129) (128,132,137) (131,135,139) (137,143,142) (89,97,88) (12,14,1)
(178,177,178) (215,214,213) (223,219,217) (247,243,237) (218,215,209) (159,164,160) (43,50,39) (2,5,0)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 349×194; shape box=(56.00,52.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(78,75,21) (80,83,36) (84,90,48) (53,49,7) (56,48,2) (71,75,17) (88,89,29) (87,88,32) (103,105,30) (123,124,48) (100,101,53) (79,79,18) (120,120,31) (120,122,70) (166,161,87) (171,166,66) (168,161,85)`; luma: `71.7,79.0,85.7,46.8,46.4,70.0,84.5,83.7,99.2,118.3,97.3,74.6,113.6,117.8,156.7,159.8,157.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -2, -1] px; max ΔY=25.4); edge at −1 RGB=(87,88,32), Y=83.7; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-50.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(97,88,88) (141,124,115) (130,112,102) (106,89,81) (104,92,85) (95,82,74) (91,78,70) (94,81,74) (91,78,69) (84,70,61) (129,111,87) (157,145,91) (123,113,68) (73,71,61) (78,81,80) (111,116,115) (125,131,109)`; luma: `89.9,127.0,115.1,92.0,94.0,84.2,80.2,83.3,80.1,72.3,113.1,143.7,111.9,70.7,80.3,114.9,128.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 4/8 ([-7, -6, -2, -1] px; max ΔY=37.1); edge at −1 RGB=(94,81,74), Y=83.3; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+3.8 Y.
- left: RGB distances −8..+8: `(229,125,185) (225,76,150) (235,110,178) (242,169,218) (236,146,202) (232,122,188) (234,143,198) (236,168,205) (237,173,204) (239,173,209) (245,181,221) (209,154,187) (144,86,95) (179,41,73) (236,74,138) (236,106,165) (234,120,174)`; luma: `151.4,113.0,141.5,188.1,169.2,150.2,166.3,185.1,188.8,189.6,197.5,168.1,99.0,72.6,113.1,137.9,148.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -2, -1] px; max ΔY=38.4); edge at −1 RGB=(236,168,205), Y=185.1; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+68.1 Y.
**top-left 8×8 RGB:**

```text
(60,58,11) (51,53,7) (35,39,1) (34,41,1) (66,73,3) (91,82,5) (105,79,2) (144,110,6)
(44,48,6) (55,62,7) (58,68,4) (57,65,4) (85,91,16) (76,79,16) (58,59,12) (65,66,19)
(64,78,18) (65,76,21) (86,98,34) (77,86,18) (87,92,21) (90,88,21) (74,71,14) (12,15,4)
(96,113,55) (77,91,40) (101,114,59) (107,123,54) (102,112,37) (106,104,28) (73,67,10) (43,38,5)
(92,104,49) (67,79,37) (75,87,41) (116,132,65) (118,126,60) (79,77,27) (33,31,3) (58,51,9)
(78,87,21) (58,64,16) (54,58,14) (98,100,40) (102,96,43) (35,31,13) (28,24,1) (72,62,9)
(83,85,14) (67,68,7) (47,50,0) (75,68,14) (106,88,34) (70,63,22) (47,43,5) (24,25,3)
(93,99,44) (88,93,34) (69,73,7) (94,90,23) (110,98,48) (42,41,16) (11,17,1) (12,16,1)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 283×128; shape box=(23.00,19.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (248,248,248) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (0,64,221) (0,64,221) (0,64,221) (0,64,221)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,248.0,230.7,230.7,230.7,230.7,61.7,61.7,61.7,61.7`; alpha: `5,5,8,9,11,13,16,48,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=48; inner 0–3 px mean lift over 5–8 px=+173.3 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (248,248,248) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,248.0,230.7,230.7,230.7,230.7,230.7,230.7,230.7,230.7`; alpha: `12,13,16,19,22,24,27,58,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+4.3 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (248,248,248) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,248.0,230.7,230.7,230.7,230.7,230.7,230.7,230.7,230.7`; alpha: `21,24,27,30,34,37,40,69,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=69; inner 0–3 px mean lift over 5–8 px=+4.3 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (248,248,248) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,248.0,230.0,230.0,230.0,230.0,230.0,230.0,230.0,230.0`; alpha: `12,14,16,18,22,24,27,59,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+4.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (200,200,200) (242,242,242)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (237,237,237) (243,243,243) (237,238,237)
(0,0,0) (0,0,0) (0,0,0) (144,144,144) (244,245,244) (240,241,240) (233,234,233) (230,231,230)
(0,0,0) (0,0,0) (125,125,125) (243,244,243) (239,240,239) (230,231,230) (230,231,230) (230,231,230)
(0,0,0) (0,0,0) (237,237,237) (240,241,240) (230,231,230) (230,231,230) (230,231,230) (230,231,230)
(0,0,0) (198,198,198) (243,243,243) (233,234,233) (230,231,230) (230,231,230) (230,231,230) (200,209,229)
(0,0,0) (242,242,242) (237,238,237) (230,231,230) (230,231,230) (230,231,230) (200,209,229) (77,120,224)
```
**bottom-right 8×8 RGB:**

```text
(230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (237,238,237) (241,241,241) (0,0,0)
(230,231,230) (230,231,230) (230,231,230) (230,231,230) (233,234,233) (244,245,244) (185,185,185) (0,0,0)
(230,231,230) (230,231,230) (230,231,230) (230,231,230) (240,241,240) (236,236,236) (0,0,0) (0,0,0)
(230,231,230) (230,231,230) (231,232,231) (239,240,239) (243,244,243) (101,101,101) (0,0,0) (0,0,0)
(230,231,230) (232,233,232) (240,241,240) (244,244,244) (128,128,128) (0,0,0) (0,0,0) (0,0,0)
(237,238,237) (244,244,244) (233,233,233) (101,101,101) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(240,240,240) (182,182,182) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light-contrast\photo\context

Case: context; appearance=light-contrast; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 212×205; shape box=(56.00,56.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(175,118,117) (133,74,51) (230,131,63) (190,89,27) (152,83,31) (188,123,60) (190,126,71) (165,100,53) (255,231,208) (245,215,190) (242,213,188) (242,212,186) (241,210,185) (239,209,184) (240,208,183) (240,207,182) (241,207,182)`; luma: `130.0,84.9,147.1,106.0,93.9,132.3,135.6,110.4,234.4,219.6,217.4,216.5,214.8,213.6,213.0,212.2,212.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-7, -6, -5, -4, -1] px; max ΔY=45.2); edge at −1 RGB=(165,100,53), Y=110.4; composited; inner 0–3 px mean lift over 5–8 px=+9.2 Y.
- right: RGB distances −8..+8: `(246,166,16) (240,161,3) (252,215,22) (214,157,40) (235,156,25) (249,140,10) (207,90,17) (213,106,20) (246,212,174) (240,211,176) (239,211,176) (239,211,176) (239,212,176) (240,212,176) (241,213,177) (247,213,177) (251,214,176)`; luma: `172.2,166.4,208.9,160.7,163.3,153.8,109.6,122.5,216.5,214.6,214.4,214.4,215.1,215.4,216.4,217.6,219.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=62.6); edge at −1 RGB=(213,106,20), Y=122.5; composited; inner 0–3 px mean lift over 5–8 px=-2.1 Y.
- bottom: RGB distances −8..+8: `(80,73,71) (16,13,11) (7,7,3) (10,10,4) (10,10,4) (10,9,3) (10,9,4) (8,9,3) (252,228,218) (233,209,201) (217,208,198) (213,207,196) (213,206,195) (213,206,195) (211,205,193) (212,205,193) (212,205,193)`; luma: `74.3,13.5,6.7,9.6,9.6,8.8,8.9,8.4,232.4,213.5,209.2,207.5,206.7,206.7,205.4,205.6,205.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=67.6); edge at −1 RGB=(8,9,3), Y=8.4; composited; inner 0–3 px mean lift over 5–8 px=+9.8 Y.
- left: RGB distances −8..+8: `(85,89,16) (77,80,19) (82,79,21) (96,92,26) (108,106,31) (144,141,109) (229,235,234) (208,193,155) (224,218,196) (228,218,197) (227,219,197) (231,221,201) (228,219,198) (229,219,199) (232,221,203) (233,223,203) (234,225,204)`; luma: `82.9,75.0,75.5,88.1,101.0,139.3,233.7,193.4,217.7,218.6,219.1,221.7,219.4,219.7,222.0,223.7,225.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=150.8); edge at −1 RGB=(208,193,155), Y=193.4; composited; inner 0–3 px mean lift over 5–8 px=-3.4 Y.
**top-left 8×8 RGB:**

```text
(142,130,113) (152,142,111) (179,124,83) (208,142,108) (159,132,123) (156,141,134) (141,129,120) (121,112,107)
(134,121,90) (151,146,104) (159,120,61) (211,122,40) (175,121,82) (157,139,128) (154,143,131) (206,193,177)
(122,112,56) (166,162,102) (145,144,101) (152,117,41) (167,130,62) (208,190,159) (232,217,195) (232,217,195)
(132,137,55) (181,170,108) (172,173,140) (143,142,96) (226,209,178) (232,218,195) (231,217,195) (231,217,194)
(140,138,56) (191,170,102) (184,172,136) (232,219,195) (230,217,195) (230,216,195) (230,216,195) (230,216,194)
(154,139,65) (208,151,87) (205,182,152) (230,217,195) (230,217,195) (230,217,195) (230,218,194) (230,217,194)
(189,142,84) (215,143,94) (230,217,195) (230,217,195) (230,217,195) (229,218,194) (229,217,194) (229,217,193)
(219,142,89) (222,179,149) (230,217,195) (230,217,195) (229,219,196) (229,217,194) (229,217,193) (229,215,193)
```
**bottom-right 8×8 RGB:**

```text
(217,216,193) (217,217,192) (216,216,192) (216,214,192) (216,214,191) (216,214,191) (174,176,144) (72,85,4)
(217,217,194) (216,216,193) (216,215,193) (216,214,193) (216,214,192) (215,213,192) (86,94,35) (64,77,0)
(217,216,195) (216,215,194) (216,214,194) (216,215,193) (215,213,193) (147,148,132) (82,84,52) (102,106,70)
(218,216,196) (216,215,195) (216,215,195) (216,215,194) (209,208,192) (127,133,142) (118,122,133) (115,119,131)
(217,217,197) (217,216,196) (217,215,196) (209,207,191) (109,105,98) (95,91,85) (86,83,76) (90,88,83)
(217,216,199) (217,215,198) (201,198,187) (167,162,156) (156,152,148) (146,142,140) (132,128,125) (120,118,117)
(207,206,195) (166,163,160) (170,168,168) (169,168,167) (154,155,156) (138,137,140) (129,129,131) (120,120,121)
(164,160,160) (166,163,163) (169,168,169) (146,145,147) (142,143,146) (137,138,141) (131,133,134) (107,109,110)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 212×205; shape box=(56.00,52.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(163,140,72) (160,136,59) (159,140,33) (136,126,13) (100,96,3) (84,82,3) (111,106,8) (104,98,10) (97,92,14) (95,91,18) (46,47,2) (137,94,41) (215,107,52) (226,126,73) (200,120,69) (188,105,88) (232,76,119)`; luma: `140.0,135.5,136.3,120.0,90.1,76.7,100.0,92.9,87.4,86.6,43.5,99.3,126.0,143.4,133.3,121.4,112.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-5, -4, -3, -2, -1] px; max ΔY=63.3); edge at −1 RGB=(104,98,10), Y=92.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-48.4 Y.
- right: RGB distances −8..+8: `(83,60,38) (159,110,74) (173,121,82) (170,122,85) (156,111,78) (141,100,74) (113,75,51) (77,40,20) (140,63,83) (237,117,182) (238,76,148) (186,34,70) (174,98,49) (199,174,143) (248,221,219) (206,133,148) (188,109,88)`; luma: `63.3,117.8,129.2,129.5,118.2,106.8,81.3,46.4,80.8,147.2,115.6,68.9,110.6,177.1,226.6,149.6,124.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=66.2); edge at −1 RGB=(77,40,20), Y=46.4; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-66.2 Y.
- bottom: RGB distances −8..+8: `(9,10,2) (49,48,19) (39,25,10) (35,31,5) (45,44,10) (38,33,13) (42,48,15) (60,80,27) (27,37,4) (38,47,19) (107,120,60) (104,117,67) (52,58,40) (33,41,9) (24,38,3) (38,41,8) (114,120,97)`; luma: `9.2,46.1,26.9,30.0,41.8,32.6,44.3,71.9,32.5,43.1,112.9,110.6,55.4,37.0,32.5,38.0,117.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=62.7); edge at −1 RGB=(60,80,27), Y=71.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+18.6 Y.
- left: RGB distances −8..+8: `(21,27,12) (49,57,29) (15,18,10) (2,2,2) (3,5,3) (3,5,3) (8,11,7) (19,28,16) (37,48,53) (81,99,157) (84,95,150) (112,117,145) (140,139,125) (151,153,144) (146,149,164) (184,193,208) (171,191,234)`; luma: `24.6,53.3,16.8,2.0,4.4,4.4,10.1,25.2,46.0,99.4,96.6,118.0,138.2,151.9,149.4,192.2,189.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -3, -2] px; max ΔY=28.6); edge at −1 RGB=(19,28,16), Y=25.2; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-80.9 Y.
**top-left 8×8 RGB:**

```text
(46,40,4) (42,43,12) (94,106,47) (93,106,42) (85,98,36) (75,91,27) (9,11,3) (17,19,46)
(14,19,2) (13,18,2) (75,85,42) (121,138,75) (91,108,52) (83,100,45) (33,38,19) (11,11,30)
(21,27,13) (22,26,14) (44,50,27) (130,146,88) (110,128,75) (92,109,61) (61,73,39) (27,32,69)
(25,29,13) (30,36,20) (22,26,13) (64,74,44) (121,139,83) (107,127,69) (69,82,53) (58,57,100)
(18,22,8) (26,33,16) (32,42,24) (14,22,0) (55,65,34) (118,139,72) (54,65,26) (29,32,28)
(10,13,1) (13,20,7) (43,54,35) (25,35,7) (11,17,4) (93,102,58) (94,98,57) (56,59,46)
(21,23,10) (10,18,4) (13,21,0) (23,32,1) (12,15,3) (102,103,66) (79,81,50) (48,54,44)
(101,94,84) (84,80,72) (71,70,61) (75,76,63) (84,84,61) (117,119,89) (75,75,62) (50,52,42)
```
**bottom-right 8×8 RGB:**

```text
(119,114,106) (117,114,114) (113,109,110) (86,82,82) (60,62,66) (68,71,78) (79,81,90) (93,95,103)
(128,119,114) (113,104,100) (112,103,101) (123,115,117) (138,123,116) (131,120,113) (103,99,98) (84,84,89)
(118,109,112) (120,110,112) (127,118,120) (128,120,123) (139,130,131) (141,133,134) (137,130,133) (134,126,128)
(125,119,124) (114,110,114) (111,108,112) (113,108,111) (106,102,107) (105,102,107) (108,106,111) (116,113,118)
(95,93,99) (99,97,103) (105,102,108) (108,104,110) (102,99,106) (104,101,105) (97,95,101) (110,109,118)
(99,96,100) (93,91,96) (99,96,103) (107,104,109) (103,102,108) (104,104,109) (106,105,114) (140,136,145)
(102,100,105) (99,96,104) (104,101,109) (110,109,117) (132,133,142) (152,147,153) (123,115,108) (110,106,106)
(100,93,92) (93,87,88) (119,116,121) (147,144,151) (161,152,155) (152,139,140) (162,150,149) (140,132,131)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 146×139; shape box=(23.00,19.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (192,191,191) (189,189,189) (187,187,187) (186,186,186) (185,185,185) (184,184,184) (184,184,184) (183,183,183)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.2,189.0,187.0,186.0,185.0,184.0,184.0,183.0`; alpha: `5,6,8,10,12,14,16,47,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=47; inner 0–3 px mean lift over 5–8 px=+21.6 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (184,184,184) (184,184,184) (184,184,184) (185,185,185) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,184.0,184.0,184.0,185.0,185.0`; alpha: `11,13,16,18,22,25,27,59,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+16.5 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (192,191,191) (189,189,189) (188,188,188) (187,187,187) (188,188,188) (187,187,187) (187,187,187) (187,187,187)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.2,189.0,188.0,187.0,188.0,187.0,187.0,187.0`; alpha: `21,24,27,31,34,36,40,69,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=69; inner 0–3 px mean lift over 5–8 px=+18.6 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (184,184,184) (184,184,184) (184,184,184) (185,185,185) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,184.0,184.0,184.0,185.0,185.0`; alpha: `11,14,16,18,21,24,27,58,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+16.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (111,111,111)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (145,145,145) (231,231,231) (254,254,254)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (198,198,198) (251,251,251) (211,211,211) (194,194,194)
(0,0,0) (0,0,0) (0,0,0) (209,209,209) (246,246,246) (200,200,200) (187,187,187) (187,187,187)
(0,0,0) (0,0,0) (198,198,198) (246,246,246) (197,197,197) (186,186,186) (185,185,185) (186,186,186)
(0,0,0) (139,139,139) (250,250,250) (199,199,199) (185,185,185) (185,185,185) (185,185,185) (185,185,185)
(0,0,0) (225,225,225) (209,209,209) (185,185,185) (185,185,185) (185,185,185) (185,185,185) (184,184,184)
(100,100,100) (251,251,251) (193,193,193) (185,185,185) (184,184,184) (184,184,184) (184,184,184) (184,184,184)
```
**bottom-right 8×8 RGB:**

```text
(185,185,185) (184,184,184) (184,184,184) (184,184,184) (183,183,183) (192,192,192) (248,248,248) (101,101,101)
(185,185,185) (184,184,184) (184,184,184) (184,184,184) (183,183,183) (208,208,208) (222,222,222) (0,0,0)
(185,185,185) (184,184,184) (184,184,184) (184,184,184) (198,198,198) (247,247,247) (134,134,134) (0,0,0)
(186,186,186) (184,184,184) (185,185,185) (195,195,195) (244,244,244) (187,187,187) (0,0,0) (0,0,0)
(186,186,186) (185,185,185) (199,199,199) (245,245,245) (202,202,202) (0,0,0) (0,0,0) (0,0,0)
(192,192,192) (209,209,209) (250,250,250) (187,187,187) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(251,251,251) (222,222,222) (129,129,129) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(86,86,86) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light-contrast\photo\submenu

Case: submenu; appearance=light-contrast; background=photo; opened=True.

Visible captured menu windows: 1.

Nested submenu result: parent popup captured; no separate submenu window appeared.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 342×218; shape box=(56.00,56.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(59,50,29) (67,57,41) (73,63,50) (72,62,50) (70,62,49) (70,64,52) (70,65,55) (73,64,48) (255,238,214) (235,220,195) (232,217,192) (230,216,187) (228,214,186) (1,65,222) (0,65,222) (0,64,221) (0,64,221)`; luma: `50.4,58.0,64.2,63.3,62.8,64.4,65.3,64.8,239.9,221.4,218.4,216.9,215.0,62.7,62.5,61.7,61.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=14.9); edge at −1 RGB=(73,64,48), Y=64.8; composited; inner 0–3 px mean lift over 5–8 px=+162.0 Y.
- right: RGB distances −8..+8: `(248,214,56) (216,169,41) (227,190,45) (212,171,69) (243,196,102) (243,185,94) (238,215,163) (244,200,86) (230,208,179) (236,212,180) (236,211,180) (237,211,180) (237,211,180) (238,211,180) (239,212,180) (239,212,181) (241,213,181)`; luma: `209.8,169.8,187.4,172.4,199.2,190.8,216.1,201.1,210.6,214.8,214.1,214.3,214.3,214.5,215.4,215.5,216.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=40.1); edge at −1 RGB=(244,200,86), Y=201.1; composited; inner 0–3 px mean lift over 5–8 px=-2.1 Y.
- bottom: RGB distances −8..+8: `(54,60,14) (148,159,106) (156,168,131) (139,147,102) (158,173,130) (145,156,111) (110,114,51) (125,130,59) (241,240,209) (221,222,194) (221,222,196) (226,224,196) (222,221,197) (218,218,192) (217,217,190) (217,217,190) (217,217,190)`; luma: `55.4,152.8,162.8,142.1,166.7,150.4,108.6,123.8,238.0,219.8,219.9,222.4,219.5,216.1,215.1,215.1,215.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=111.3); edge at −1 RGB=(125,130,59), Y=123.8; composited; inner 0–3 px mean lift over 5–8 px=+9.7 Y.
- left: RGB distances −8..+8: `(34,48,3) (35,51,3) (57,76,4) (26,47,3) (22,41,1) (35,53,1) (54,76,5) (52,71,2) (205,211,193) (206,212,198) (207,213,198) (206,213,199) (208,213,200) (209,214,200) (208,214,201) (209,215,201) (210,216,202)`; luma: `41.8,44.1,66.8,39.4,34.1,45.4,66.2,62.0,208.4,209.7,210.6,210.5,211.0,211.9,211.8,212.7,213.7`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 4/8 ([-6, -4, -2, -1] px; max ΔY=25.0); edge at −1 RGB=(52,71,2), Y=62.0; composited; inner 0–3 px mean lift over 5–8 px=-2.7 Y.
**top-left 8×8 RGB:**

```text
(96,101,16) (43,46,11) (38,42,2) (32,37,0) (23,30,1) (29,35,3) (50,59,8) (94,96,8)
(93,101,26) (111,121,69) (111,122,73) (71,81,40) (32,41,4) (54,62,3) (108,113,41) (195,196,141)
(54,67,9) (45,59,19) (82,97,54) (135,151,114) (126,139,99) (172,173,131) (214,215,188) (214,215,188)
(59,75,17) (41,56,12) (35,48,3) (86,99,63) (210,211,183) (213,215,187) (213,215,187) (213,215,187)
(66,86,32) (55,71,23) (56,69,25) (214,214,187) (211,213,186) (211,213,186) (211,214,186) (212,213,186)
(84,104,71) (57,73,30) (147,151,118) (211,213,186) (211,212,186) (211,213,186) (211,212,186) (211,212,186)
(122,144,127) (83,95,61) (210,212,186) (210,212,186) (210,212,186) (210,212,185) (210,212,185) (122,150,200)
(68,79,44) (165,170,134) (209,211,185) (209,211,185) (209,211,185) (209,211,185) (120,148,200) (10,71,219)
```
**bottom-right 8×8 RGB:**

```text
(221,213,186) (221,213,185) (221,213,185) (221,212,184) (221,212,184) (226,212,183) (183,179,136) (96,110,18)
(221,214,186) (221,213,186) (221,213,185) (220,212,185) (221,212,185) (224,212,184) (116,126,57) (101,114,23)
(221,214,187) (220,213,187) (220,213,186) (220,212,186) (226,212,185) (179,179,129) (108,120,33) (92,104,24)
(220,214,188) (221,213,187) (220,213,187) (225,212,186) (222,213,185) (151,163,74) (130,141,44) (66,76,15)
(221,215,189) (222,214,188) (227,214,187) (210,204,172) (139,154,61) (149,161,55) (126,138,45) (51,61,14)
(227,214,190) (226,214,189) (177,175,130) (120,134,44) (138,153,50) (143,155,44) (85,95,27) (63,70,16)
(183,177,146) (102,112,45) (106,120,26) (129,143,45) (143,156,47) (115,126,36) (38,45,6) (67,76,7)
(62,71,3) (98,109,18) (121,133,33) (136,150,45) (135,148,41) (38,44,11) (28,36,2) (78,89,4)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 342×218; shape box=(56.00,52.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(143,88,45) (96,44,0) (72,34,5) (14,5,0) (75,51,31) (107,78,50) (124,89,56) (126,92,57) (136,91,58) (178,123,75) (216,142,73) (207,92,87) (186,80,138) (139,69,125) (122,57,114) (101,44,90) (87,65,76)`; luma: `96.6,51.9,40.0,6.6,54.7,82.1,94.1,96.7,98.2,131.2,152.8,116.1,106.7,87.9,74.9,59.4,70.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-7, -6, -5, -4, -3] px; max ΔY=90.0); edge at −1 RGB=(126,92,57), Y=96.7; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+51.4 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(104,98,50) (66,84,67) (72,86,51) (94,103,51) (140,136,76) (179,165,120) (131,125,100) (55,60,36) (38,47,15) (35,42,6) (100,93,67) (170,158,159) (129,126,103) (87,98,41) (108,109,66) (113,91,79) (125,101,78)`; luma: `95.8,78.9,80.5,97.3,132.5,164.7,124.5,57.2,42.8,37.9,92.6,160.6,125.0,91.5,105.7,94.8,104.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=68.9); edge at −1 RGB=(55,60,36), Y=57.2; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-15.6 Y.
- left: RGB distances −8..+8: `(241,143,216) (239,125,193) (241,122,194) (233,151,202) (206,93,135) (224,117,170) (231,131,191) (223,88,156) (229,68,147) (243,157,212) (241,171,218) (234,128,193) (232,124,190) (234,144,199) (237,171,207) (236,175,205) (239,175,210)`; luma: `169.1,154.1,152.5,172.1,120.1,143.6,156.6,121.6,107.9,179.3,189.3,155.2,151.7,167.1,187.6,190.1,191.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=49.0); edge at −1 RGB=(223,88,156), Y=121.6; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-26.1 Y.
**top-left 8×8 RGB:**

```text
(97,98,33) (126,145,87) (129,154,94) (109,132,76) (90,107,45) (80,94,28) (79,95,23) (104,115,28)
(118,93,18) (116,129,72) (123,148,95) (112,137,81) (105,126,62) (104,123,57) (110,125,59) (86,93,37)
(107,95,16) (107,115,50) (118,144,90) (110,137,82) (110,134,78) (100,117,71) (74,83,41) (46,50,11)
(187,117,2) (178,141,33) (152,155,75) (135,148,80) (88,95,44) (25,28,12) (11,13,0) (42,45,2)
(126,85,7) (135,93,12) (176,141,45) (163,143,52) (83,77,13) (29,33,0) (27,30,2) (69,69,6)
(23,19,7) (44,28,3) (125,93,23) (182,139,28) (114,98,16) (34,36,4) (24,27,3) (80,79,11)
(93,54,3) (105,70,13) (125,86,8) (160,101,0) (120,93,11) (46,47,10) (31,33,5) (65,63,12)
(161,96,1) (144,93,12) (121,91,16) (97,74,5) (61,59,4) (32,39,2) (31,34,2) (58,57,12)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 276×152; shape box=(23.00,19.00,230.00,106.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (192,192,192) (189,189,189) (188,188,188) (187,187,187) (1,65,222) (0,65,222) (0,64,221) (0,64,221)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,192.0,189.0,188.0,187.0,62.7,62.5,61.7,61.7`; alpha: `4,6,7,9,10,14,16,47,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 5 px; α at −1=47; inner 0–3 px mean lift over 5–8 px=+143.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (184,184,184) (184,184,184) (184,184,184) (185,185,185) (185,185,185) (185,185,185) (186,186,186) (186,186,186)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,184.0,184.0,184.0,185.0,185.0,185.0,186.0,186.0`; alpha: `10,13,16,19,21,24,28,59,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+16.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (192,191,191) (190,190,190) (189,189,189) (188,188,188) (188,188,188) (188,188,188) (188,188,188) (188,188,188)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.2,190.0,189.0,188.0,188.0,188.0,188.0,188.0`; alpha: `21,25,27,30,34,37,40,69,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=69; inner 0–3 px mean lift over 5–8 px=+18.3 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (184,184,184) (184,184,184) (184,184,184) (185,185,185) (185,185,185) (185,185,185) (186,186,186) (186,186,186)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,184.0,184.0,184.0,185.0,185.0,185.0,186.0,186.0`; alpha: `11,12,16,18,22,24,26,59,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+16.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (111,111,111)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (145,145,145) (231,231,231) (254,254,254)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (198,198,198) (251,251,251) (211,211,211) (195,195,195)
(0,0,0) (0,0,0) (0,0,0) (209,209,209) (247,247,247) (201,201,201) (188,188,188) (187,187,187)
(0,0,0) (0,0,0) (198,198,198) (246,246,246) (197,197,197) (186,186,186) (187,187,187) (187,187,187)
(0,0,0) (139,139,139) (251,251,251) (200,200,200) (186,186,186) (186,186,186) (186,186,186) (186,186,186)
(0,0,0) (226,226,226) (210,210,210) (186,186,186) (186,186,186) (185,185,185) (185,185,185) (107,134,200)
(100,100,100) (251,251,251) (194,194,194) (186,186,186) (185,185,185) (185,185,185) (107,134,200) (4,66,220)
```
**bottom-right 8×8 RGB:**

```text
(186,186,186) (185,185,185) (185,185,185) (185,185,185) (184,184,184) (192,192,192) (251,251,251) (93,93,93)
(186,186,186) (185,185,185) (185,185,185) (185,185,185) (184,184,184) (209,209,209) (220,220,220) (0,0,0)
(186,186,186) (185,185,185) (185,185,185) (185,185,185) (198,198,198) (249,249,249) (128,128,128) (0,0,0)
(187,187,187) (186,186,186) (185,185,185) (196,196,196) (245,245,245) (189,189,189) (0,0,0) (0,0,0)
(186,186,186) (186,186,186) (200,200,200) (245,245,245) (202,202,202) (0,0,0) (0,0,0) (0,0,0)
(194,194,194) (210,210,210) (249,249,249) (187,187,187) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(251,251,251) (222,222,222) (128,128,128) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(90,90,90) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light-contrast\photo\swiftui-menu

Case: swiftui-menu; appearance=light-contrast; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 272×194; shape box=(56.00,56.00,160.00,82.00) px.
- top: RGB distances −8..+8: `(68,45,34) (98,40,56) (52,14,21) (53,38,23) (53,42,25) (149,122,78) (165,80,63) (204,148,128) (242,227,213) (229,219,206) (226,212,202) (230,212,198) (231,209,197) (230,208,196) (228,207,196) (227,208,197) (227,209,198)`; luma: `49.1,53.5,22.6,40.1,43.1,124.6,96.8,158.5,229.2,220.2,214.3,214.8,212.8,211.8,210.7,211.2,212.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-6, -5, -3, -2, -1] px; max ΔY=109.4); edge at −1 RGB=(204,148,128), Y=158.5; composited; inner 0–3 px mean lift over 5–8 px=+8.2 Y.
- right: RGB distances −8..+8: `(107,113,2) (103,111,1) (113,117,27) (186,187,140) (183,179,113) (197,191,69) (106,105,5) (98,108,12) (221,214,182) (220,210,182) (220,211,182) (219,214,181) (219,214,182) (220,213,182) (220,213,183) (220,212,184) (220,213,185)`; luma: `103.7,101.4,109.7,183.4,175.1,183.5,98.0,98.9,213.2,210.1,210.8,212.7,212.8,212.2,212.3,211.7,212.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 3/8 ([-5, -4, -3] px; max ΔY=79.8); edge at −1 RGB=(98,108,12), Y=98.9; composited; inner 0–3 px mean lift over 5–8 px=-0.5 Y.
- bottom: RGB distances −8..+8: `(208,159,120) (202,151,115) (193,145,109) (188,141,105) (174,127,94) (133,98,76) (130,103,88) (147,118,100) (243,234,218) (231,224,208) (227,220,208) (227,220,208) (227,221,204) (227,222,202) (227,220,202) (226,220,203) (226,219,204)`; luma: `166.6,159.2,152.6,148.4,134.6,103.9,107.7,122.9,234.8,224.3,220.6,220.6,221.0,221.6,220.2,220.0,219.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=62.7); edge at −1 RGB=(147,118,100), Y=122.9; composited; inner 0–3 px mean lift over 5–8 px=+4.8 Y.
- left: RGB distances −8..+8: `(95,108,70) (49,69,22) (59,83,29) (72,96,44) (84,108,59) (62,85,43) (72,97,42) (63,90,31) (213,217,194) (210,214,191) (209,213,190) (209,213,190) (209,213,190) (209,213,190) (210,214,190) (210,214,190) (210,214,191)`; luma: `102.5,61.4,74.0,87.1,99.4,77.1,87.7,80.0,214.5,211.5,210.5,210.5,210.5,210.5,211.4,211.4,211.5`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -3, -2, -1] px; max ΔY=41.1); edge at −1 RGB=(63,90,31), Y=80.0; composited; inner 0–3 px mean lift over 5–8 px=+0.5 Y.
**top-left 8×8 RGB:**

```text
(199,199,158) (135,141,113) (189,187,150) (142,137,92) (76,77,35) (100,97,48) (77,81,34) (44,50,16)
(178,147,56) (98,92,41) (127,122,72) (144,135,77) (76,77,25) (84,83,29) (114,115,63) (172,173,145)
(186,148,56) (171,165,128) (126,119,65) (170,155,68) (90,90,38) (164,165,128) (216,217,198) (217,217,198)
(222,217,164) (221,227,215) (132,130,74) (129,115,38) (217,217,194) (216,217,197) (217,217,197) (218,218,197)
(227,217,161) (178,177,160) (119,112,68) (212,210,181) (215,215,196) (215,216,196) (215,216,197) (215,215,197)
(193,179,124) (184,179,144) (211,210,188) (214,215,196) (214,215,196) (214,215,196) (214,214,196) (214,214,196)
(210,205,172) (188,182,157) (213,214,196) (214,214,195) (213,214,196) (213,214,195) (213,214,195) (213,214,195)
(211,212,186) (216,216,193) (213,214,195) (213,214,195) (212,213,195) (212,213,194) (212,213,194) (212,213,194)
```
**bottom-right 8×8 RGB:**

```text
(222,222,218) (222,222,218) (222,221,217) (221,220,215) (219,218,213) (215,214,209) (209,209,203) (232,229,226)
(223,222,218) (222,221,218) (222,221,217) (220,219,214) (217,216,211) (213,213,207) (198,196,194) (213,209,207)
(223,222,218) (222,221,217) (220,219,215) (218,217,213) (215,214,209) (188,188,186) (172,170,171) (212,209,206)
(221,220,216) (219,219,215) (218,217,213) (216,215,210) (205,205,200) (162,161,164) (193,191,190) (211,207,205)
(219,219,215) (218,217,213) (216,216,211) (214,214,209) (150,152,156) (180,178,179) (211,209,206) (206,204,204)
(217,216,212) (216,216,212) (180,181,181) (136,139,144) (138,140,146) (188,186,186) (224,222,218) (185,186,187)
(195,196,194) (142,146,150) (128,131,136) (134,137,141) (143,145,149) (190,188,188) (218,216,213) (163,163,165)
(138,141,149) (123,129,135) (121,126,132) (136,140,145) (151,153,157) (192,191,192) (191,191,192) (163,164,167)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 272×194; shape box=(56.00,52.00,160.00,82.00) px.
- top: RGB distances −8..+8: `(101,77,57) (149,116,87) (193,158,131) (115,88,53) (70,65,22) (87,79,46) (71,55,32) (62,42,17) (54,42,26) (58,58,31) (52,57,18) (63,69,24) (57,57,11) (72,69,20) (65,67,21) (82,77,31) (101,106,49)`; luma: `80.7,120.9,163.5,91.2,63.0,78.3,56.7,44.4,43.4,56.1,53.1,64.5,53.7,66.1,63.3,74.7,100.8`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -2, -1] px; max ΔY=82.8); edge at −1 RGB=(62,42,17), Y=44.4; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-22.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (7,0,7) (117,83,63) (142,87,54) (131,64,25) (126,65,28) (152,102,72) (211,185,172) (226,184,153) (207,162,115) (216,205,202) (212,207,210) (151,144,125) (165,170,163) (193,206,224) (211,201,217)`; luma: `0.0,0.0,2.0,88.8,96.3,75.4,75.3,110.5,189.6,190.7,168.2,207.1,208.3,144.1,168.4,204.5,204.3`; alpha: `28,35,39,105,222,254,254,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-5, -4, -3, -2, -1] px; max ΔY=110.5); edge at −1 RGB=(152,102,72), Y=110.5; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+8.6 Y.
- bottom: RGB distances −8..+8: `(59,69,28) (133,139,72) (135,138,58) (117,131,64) (111,112,60) (143,144,95) (117,129,94) (96,109,77) (110,108,87) (108,105,89) (46,40,36) (52,42,34) (25,24,21) (26,24,20) (39,35,29) (36,33,30) (34,32,28)`; luma: `63.9,132.9,131.6,123.2,108.0,140.2,123.9,103.9,106.9,104.5,41.0,43.5,24.0,24.1,35.4,33.4,32.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=76.3); edge at −1 RGB=(96,109,77), Y=103.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+42.7 Y.
- left: RGB distances −8..+8: `(229,125,185) (225,76,150) (235,110,178) (242,169,218) (236,146,202) (232,122,188) (234,143,198) (236,168,205) (237,173,204) (239,173,209) (245,181,221) (209,154,187) (144,86,95) (179,41,73) (236,74,138) (236,106,165) (234,120,174)`; luma: `151.4,113.0,141.5,188.1,169.2,150.2,166.3,185.1,188.8,189.6,197.5,168.1,99.0,72.6,113.1,137.9,148.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -5, -4, -2, -1] px; max ΔY=38.4); edge at −1 RGB=(236,168,205), Y=185.1; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+68.1 Y.
**top-left 8×8 RGB:**

```text
(60,58,11) (51,53,7) (35,39,1) (34,41,1) (66,73,3) (91,82,5) (105,79,2) (144,110,6)
(44,48,6) (55,62,7) (58,68,4) (57,65,4) (85,91,16) (76,79,16) (58,59,12) (65,66,19)
(64,78,18) (65,76,21) (86,98,34) (77,86,18) (87,92,21) (90,88,21) (74,71,14) (12,15,4)
(96,113,55) (77,91,40) (101,114,59) (107,123,54) (102,112,37) (106,104,28) (73,67,10) (43,38,5)
(92,104,49) (67,79,37) (75,87,41) (116,132,65) (118,126,60) (79,77,27) (33,31,3) (58,51,9)
(78,87,21) (58,64,16) (54,58,14) (98,100,40) (102,96,43) (35,31,13) (28,24,1) (72,62,9)
(83,85,14) (67,68,7) (47,50,0) (75,68,14) (106,88,34) (70,63,22) (47,43,5) (24,25,3)
(93,99,44) (88,93,34) (69,73,7) (94,90,23) (110,98,48) (42,41,16) (11,17,1) (12,16,1)
```
**bottom-right 8×8 RGB:**

```text
(131,119,82) (126,119,86) (116,109,91) (132,118,95) (149,129,111) (133,125,128) (134,129,137) (143,135,140)
(109,104,104) (117,114,111) (135,133,140) (136,133,142) (131,127,132) (115,115,124) (109,109,120) (109,110,122)
(195,179,171) (175,165,165) (144,138,143) (123,120,125) (138,136,141) (164,161,162) (173,165,161) (180,169,161)
(166,153,143) (123,111,107) (151,138,133) (190,179,170) (218,209,200) (240,235,228) (247,239,229) (253,244,233)
(160,150,144) (192,179,170) (215,205,195) (194,185,176) (169,159,149) (155,143,129) (155,141,128) (181,170,160)
(255,253,245) (255,255,252) (250,247,242) (246,240,232) (247,244,238) (228,219,207) (202,188,175) (189,177,167)
(217,206,199) (231,217,208) (236,225,216) (244,241,235) (248,247,245) (249,250,249) (244,243,240) (243,240,235)
(104,102,109) (151,137,131) (215,203,195) (229,223,217) (231,226,220) (240,235,229) (246,239,230) (244,238,230)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 206×128; shape box=(23.00,19.00,160.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (191,191,191) (188,188,188) (187,187,187) (185,185,185) (185,185,185) (183,183,183) (183,183,183) (183,183,183)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.0,188.0,187.0,185.0,185.0,183.0,183.0,183.0`; alpha: `4,6,7,10,11,13,16,48,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 5 px; α at −1=48; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (184,184,184) (184,184,184) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,183.0,183.0,184.0,184.0,185.0`; alpha: `11,13,16,18,21,24,27,58,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+17.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (191,191,191) (188,188,188) (187,187,187) (187,187,187) (187,187,187) (186,186,186) (186,186,186) (186,186,186)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.0,188.0,187.0,187.0,187.0,186.0,186.0,186.0`; alpha: `21,24,27,30,34,36,40,69,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=69; inner 0–3 px mean lift over 5–8 px=+19.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (184,184,184) (184,184,184) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,183.0,183.0,184.0,184.0,185.0`; alpha: `12,14,16,18,22,24,27,59,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+17.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (111,111,111)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (145,145,145) (231,231,231) (253,253,253)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (198,198,198) (250,250,250) (210,210,210) (194,194,194)
(0,0,0) (0,0,0) (0,0,0) (209,209,209) (246,246,246) (200,200,200) (186,186,186) (186,186,186)
(0,0,0) (0,0,0) (195,195,195) (245,245,245) (196,196,196) (185,185,185) (186,186,186) (184,184,184)
(0,0,0) (139,139,139) (251,251,251) (199,199,199) (184,184,184) (184,184,184) (184,184,184) (184,184,184)
(0,0,0) (226,226,226) (209,209,209) (184,184,184) (184,184,184) (184,184,184) (184,184,184) (184,184,184)
(100,100,100) (250,250,250) (192,192,192) (184,184,184) (184,184,184) (184,184,184) (183,183,183) (183,183,183)
```
**bottom-right 8×8 RGB:**

```text
(184,184,184) (184,184,184) (183,183,183) (183,183,183) (183,183,183) (191,191,191) (250,250,250) (93,93,93)
(184,184,184) (184,184,184) (183,183,183) (183,183,183) (183,183,183) (208,208,208) (222,222,222) (0,0,0)
(184,184,184) (184,184,184) (183,183,183) (183,183,183) (197,197,197) (247,247,247) (129,129,129) (0,0,0)
(184,184,184) (185,185,185) (183,183,183) (195,195,195) (244,244,244) (187,187,187) (0,0,0) (0,0,0)
(185,185,185) (185,185,185) (198,198,198) (243,244,243) (202,202,202) (0,0,0) (0,0,0) (0,0,0)
(193,193,193) (209,209,209) (249,249,249) (189,189,189) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(251,251,251) (224,224,224) (126,126,126) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(90,90,90) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light-contrast\photo\swiftui-picker

Case: swiftui-picker; appearance=light-contrast; background=photo; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 211×194; shape box=(56.00,56.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(172,72,16) (227,89,30) (222,74,30) (203,59,27) (188,48,23) (177,47,18) (151,45,9) (120,60,5) (250,230,213) (229,212,195) (225,209,192) (223,208,191) (221,206,190) (220,206,190) (219,204,189) (218,203,188) (217,203,188)`; luma: `89.2,114.1,102.3,87.3,76.0,72.5,64.9,68.8,233.0,214.4,211.2,210.0,208.0,207.8,206.1,205.1,204.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=24.9); edge at −1 RGB=(120,60,5), Y=68.8; composited; inner 0–3 px mean lift over 5–8 px=+11.2 Y.
- right: RGB distances −8..+8: `(165,65,5) (140,60,4) (72,46,2) (33,33,3) (29,31,4) (53,56,7) (66,69,6) (66,68,4) (228,205,181) (225,201,182) (228,201,184) (233,200,188) (239,200,196) (240,201,201) (238,200,198) (236,200,195) (236,201,193)`; luma: `81.9,73.0,48.4,30.8,28.6,51.8,63.8,63.0,208.2,204.7,205.5,206.1,208.0,209.3,207.9,207.3,207.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=53.3); edge at −1 RGB=(66,68,4), Y=63.0; composited; inner 0–3 px mean lift over 5–8 px=-2.0 Y.
- bottom: RGB distances −8..+8: `(103,95,82) (119,111,76) (167,161,97) (134,126,103) (104,94,86) (100,92,80) (88,80,59) (175,172,85) (248,240,224) (231,226,204) (221,216,198) (219,215,197) (219,215,197) (220,216,197) (218,214,196) (218,214,196) (218,214,196)`; luma: `95.8,110.2,157.7,126.0,95.5,92.8,80.2,166.4,240.5,225.5,215.8,214.6,214.6,215.5,213.6,213.6,213.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-7, -6, -5, -2, -1] px; max ΔY=70.6); edge at −1 RGB=(175,172,85), Y=166.4; composited; inner 0–3 px mean lift over 5–8 px=+10.1 Y.
- left: RGB distances −8..+8: `(225,199,138) (207,188,148) (203,190,152) (154,133,85) (137,137,102) (219,217,202) (206,188,144) (206,153,32) (221,220,200) (219,217,195) (219,217,195) (219,217,195) (223,219,196) (228,222,197) (231,225,200) (232,226,203) (232,228,207)`; luma: `200.1,189.2,190.0,134.0,134.5,216.3,188.7,155.5,218.8,215.8,215.8,215.8,218.2,221.5,224.5,225.6,227.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=66.1); edge at −1 RGB=(206,153,32), Y=155.5; composited; inner 0–3 px mean lift over 5–8 px=-8.2 Y.
**top-left 8×8 RGB:**

```text
(133,132,8) (108,106,15) (116,106,11) (208,179,6) (180,153,15) (105,103,29) (53,61,23) (56,62,26)
(141,142,7) (176,161,15) (178,167,30) (144,120,14) (232,202,19) (189,182,63) (94,95,57) (187,184,150)
(149,148,10) (200,178,9) (250,232,20) (164,134,14) (217,196,37) (223,214,138) (227,221,195) (227,220,196)
(128,133,10) (150,139,7) (218,179,0) (201,167,22) (226,220,177) (226,220,195) (226,220,196) (226,220,194)
(122,121,6) (166,153,9) (214,185,43) (228,219,184) (225,219,195) (225,219,196) (225,219,194) (225,219,193)
(116,106,16) (123,99,9) (216,203,142) (224,219,195) (224,219,197) (224,219,195) (224,218,194) (224,218,192)
(188,184,149) (147,134,71) (224,219,195) (224,219,196) (224,218,195) (224,218,195) (223,218,193) (223,217,190)
(105,98,55) (187,182,151) (223,218,195) (223,218,197) (223,218,196) (223,218,195) (223,217,192) (223,217,189)
```
**bottom-right 8×8 RGB:**

```text
(226,201,196) (228,201,195) (227,201,192) (224,201,189) (219,201,187) (219,202,187) (165,154,140) (5,7,1)
(231,201,198) (228,201,194) (225,201,190) (221,201,188) (221,201,189) (213,203,187) (87,87,39) (18,18,1)
(228,201,194) (225,201,191) (221,201,189) (219,202,188) (216,202,187) (190,183,143) (103,106,22) (42,44,4)
(224,201,190) (222,201,189) (220,201,189) (217,202,188) (210,201,180) (147,153,75) (125,131,44) (66,70,9)
(220,203,190) (221,202,190) (216,202,189) (212,202,188) (151,155,90) (146,152,72) (133,139,56) (97,102,26)
(216,202,190) (213,203,190) (155,148,116) (53,52,14) (82,83,26) (136,144,64) (132,140,61) (116,126,43)
(171,163,138) (95,97,41) (69,72,5) (59,58,4) (74,75,10) (89,94,22) (125,133,51) (125,135,50)
(62,65,6) (55,57,0) (51,53,1) (36,35,1) (70,71,15) (109,114,28) (106,114,29) (129,138,50)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 211×194; shape box=(56.00,52.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(164,140,66) (158,135,54) (158,142,26) (123,115,9) (94,91,3) (86,84,3) (118,112,10) (94,89,9) (106,99,19) (73,73,11) (63,55,10) (171,104,50) (223,108,53) (224,132,81) (184,112,63) (208,95,107) (230,93,127)`; luma: `139.8,134.0,137.0,109.0,85.3,78.6,105.9,84.3,94.7,68.5,53.5,114.3,128.5,147.9,123.8,119.9,124.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-5, -4, -3, -2, -1] px; max ΔY=61.2); edge at −1 RGB=(94,89,9), Y=84.3; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-46.3 Y.
- right: RGB distances −8..+8: `(107,103,82) (186,169,157) (149,133,121) (114,107,99) (146,140,136) (154,145,139) (135,129,125) (92,92,89) (63,63,60) (101,102,105) (195,197,204) (139,143,147) (107,100,99) (82,49,25) (106,62,28) (134,90,81) (189,98,113)`; luma: `102.3,171.7,135.5,107.9,141.0,146.5,130.0,91.8,62.8,102.0,197.1,142.4,101.4,54.3,68.9,98.7,118.4`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-7, -6, -4, -3, -2, -1] px; max ΔY=69.4); edge at −1 RGB=(92,92,89), Y=91.8; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+41.0 Y.
- bottom: RGB distances −8..+8: `(113,126,62) (96,108,66) (43,48,30) (34,45,10) (20,33,0) (54,54,21) (124,133,115) (106,115,98) (81,84,41) (113,117,57) (171,137,132) (190,164,172) (221,211,214) (186,183,163) (164,166,95) (133,133,78) (150,157,133)`; luma: `118.6,102.4,45.6,40.1,27.9,51.6,129.8,111.9,80.3,111.8,143.9,170.1,213.3,182.2,160.4,129.0,153.8`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=90.8); edge at −1 RGB=(106,115,98), Y=111.9; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=-29.9 Y.
- left: RGB distances −8..+8: `(61,69,16) (39,33,26) (123,66,86) (166,88,104) (136,69,80) (197,94,122) (189,92,121) (203,113,153) (142,100,127) (48,51,40) (68,82,50) (15,22,13) (18,26,5) (30,45,4) (30,43,8) (39,52,25) (100,107,74)`; luma: `63.5,33.8,79.6,105.7,84.0,117.9,114.7,135.0,110.9,49.6,76.7,19.9,22.8,38.9,37.7,47.3,103.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=71.5); edge at −1 RGB=(203,113,153), Y=135.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+7.5 Y.
**top-left 8×8 RGB:**

```text
(37,34,3) (27,31,9) (91,104,49) (102,116,55) (85,100,41) (80,98,35) (12,13,7) (13,15,41)
(11,16,4) (13,17,3) (65,74,37) (127,145,81) (95,113,58) (84,101,49) (43,50,24) (14,15,35)
(27,32,15) (28,33,20) (37,42,23) (118,132,82) (119,137,82) (97,115,65) (68,80,48) (39,42,88)
(22,25,11) (28,34,17) (18,23,9) (38,46,23) (106,122,72) (111,133,71) (63,75,45) (52,52,82)
(17,21,7) (25,32,16) (44,56,36) (16,24,1) (34,42,18) (113,132,69) (62,72,30) (29,34,20)
(6,9,0) (6,13,0) (29,40,18) (24,34,4) (6,10,1) (89,94,56) (99,102,63) (60,64,54)
(42,41,30) (27,32,21) (23,29,11) (31,39,14) (30,33,16) (111,112,74) (69,71,46) (45,49,40)
(133,123,111) (116,108,97) (100,95,85) (101,98,87) (109,107,85) (111,112,89) (81,81,71) (51,53,41)
```
**bottom-right 8×8 RGB:**

```text
(128,133,137) (55,52,47) (23,18,11) (49,42,36) (53,45,39) (70,58,51) (82,70,66) (82,69,64)
(155,146,110) (157,131,114) (145,123,106) (105,98,96) (89,88,91) (94,86,80) (83,79,79) (85,81,83)
(183,166,144) (221,182,153) (231,185,150) (140,122,111) (96,94,96) (110,109,115) (109,108,112) (113,111,114)
(185,166,135) (224,182,154) (189,156,134) (110,98,96) (81,82,90) (122,117,117) (183,169,161) (210,189,177)
(113,112,83) (152,131,123) (167,153,150) (167,154,147) (174,155,145) (162,146,139) (137,125,121) (129,117,113)
(105,106,98) (96,93,95) (110,104,106) (114,106,104) (134,122,118) (150,137,133) (130,119,117) (124,113,109)
(119,114,112) (136,129,131) (134,126,128) (132,120,119) (136,121,116) (139,123,116) (156,137,127) (158,139,130)
(152,137,128) (121,110,104) (118,107,103) (108,99,96) (116,107,104) (140,126,119) (158,139,128) (168,146,135)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 145×128; shape box=(23.00,19.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (191,191,191) (188,188,188) (187,187,187) (185,185,185) (185,185,185) (183,183,183) (183,183,183) (183,183,183)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.0,188.0,187.0,185.0,185.0,183.0,183.0,183.0`; alpha: `5,6,8,8,11,13,16,47,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=47; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (184,184,184) (184,184,184) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,183.0,183.0,184.0,184.0,185.0`; alpha: `12,14,16,19,20,24,27,58,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+17.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (191,191,191) (188,188,188) (187,187,187) (187,187,187) (187,187,187) (186,186,186) (186,186,186) (186,186,186)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.0,188.0,187.0,187.0,187.0,186.0,186.0,186.0`; alpha: `21,25,26,31,34,37,40,69,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=69; inner 0–3 px mean lift over 5–8 px=+19.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (184,184,184) (184,184,184) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,183.0,183.0,184.0,184.0,185.0`; alpha: `12,14,16,18,22,24,27,59,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+17.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (111,111,111)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (145,145,145) (231,231,231) (253,253,253)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (198,198,198) (251,251,251) (210,210,210) (194,194,194)
(0,0,0) (0,0,0) (0,0,0) (209,209,209) (245,245,245) (200,200,200) (186,186,186) (186,186,186)
(0,0,0) (0,0,0) (195,198,195) (245,245,245) (196,196,196) (185,185,185) (185,185,185) (185,185,185)
(0,0,0) (139,139,139) (250,250,250) (199,199,199) (184,184,184) (184,184,184) (184,184,184) (184,184,184)
(0,0,0) (226,226,226) (209,209,209) (184,184,184) (184,184,184) (184,184,184) (184,184,184) (184,184,184)
(100,100,100) (250,250,250) (192,192,192) (184,184,184) (184,184,184) (184,184,184) (183,183,183) (183,183,183)
```
**bottom-right 8×8 RGB:**

```text
(184,184,184) (184,184,184) (183,183,183) (183,183,183) (183,183,183) (191,191,191) (250,250,250) (90,90,90)
(184,184,184) (184,184,184) (183,183,183) (183,183,183) (183,183,183) (208,208,208) (222,222,222) (0,0,0)
(184,184,184) (184,184,184) (183,183,183) (183,183,183) (197,197,197) (249,249,249) (131,131,131) (0,0,0)
(185,185,185) (184,184,184) (183,183,183) (194,194,194) (242,242,242) (188,188,188) (0,0,0) (0,0,0)
(185,185,185) (185,185,185) (198,198,198) (245,245,245) (202,202,202) (0,0,0) (0,0,0) (0,0,0)
(194,194,194) (209,209,209) (246,246,246) (189,189,189) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(249,249,249) (226,226,226) (130,130,130) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(101,101,101) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light-contrast\plain\appkit-popup

Case: appkit-popup; appearance=light-contrast; background=plain; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

## macos27-captures\out\menu-outline\menus\light-contrast\plain\appkit-pulldown

Case: appkit-pulldown; appearance=light-contrast; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 338×194; shape box=(56.00,56.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (251,251,251) (251,251,251) (251,251,251) (249,249,249) (249,249,249) (249,249,249) (249,249,249) (249,249,248)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,251.0,251.0,251.0,249.0,249.0,249.0,249.0,248.9`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+3.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (250,250,250) (250,250,250) (250,250,250) (250,250,250) (251,251,251) (251,251,251) (252,252,252) (252,252,252) (253,253,253)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,250.0,250.0,250.0,250.0,251.0,251.0,252.0,252.0,253.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-2.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254) (254,254,254) (254,254,254) (254,254,254) (254,254,254) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,254.0,254.0,254.0,254.0,254.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-0.5 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (250,250,250) (250,250,250) (250,250,250) (250,250,250) (251,251,251) (251,251,251) (252,252,252) (252,252,252) (253,253,253)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,250.0,250.0,250.0,250.0,251.0,251.0,252.0,252.0,253.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-2.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254) (252,252,252) (252,252,252)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (252,252,252) (252,252,252) (252,252,252)
(255,255,255) (255,255,255) (255,255,255) (251,251,251) (253,253,253) (252,252,252) (252,252,252) (252,252,252)
(255,255,255) (255,255,255) (251,251,251) (252,252,252) (252,252,252) (252,252,252) (251,251,251) (251,251,251)
(255,255,255) (253,253,253) (251,251,251) (252,252,252) (251,251,251) (251,251,251) (251,251,251) (251,251,251)
(255,255,255) (250,250,250) (252,252,252) (251,251,251) (251,251,251) (251,251,251) (251,250,250) (250,250,250)
(254,254,254) (251,251,251) (251,251,251) (251,251,251) (251,251,251) (250,250,250) (250,250,250) (250,250,250)
```
**bottom-right 8×8 RGB:**

```text
(252,252,252) (251,251,251) (251,251,251) (251,251,251) (250,250,250) (250,250,250) (249,249,249) (254,254,254)
(252,252,252) (251,251,251) (251,251,251) (251,251,251) (250,250,250) (250,250,250) (249,249,249) (255,255,255)
(252,252,252) (251,251,251) (251,251,251) (251,251,251) (250,250,250) (249,249,249) (253,253,253) (255,255,255)
(252,252,252) (251,251,251) (251,251,251) (251,251,251) (251,251,251) (250,250,250) (255,255,255) (255,255,255)
(252,252,252) (251,251,251) (251,251,251) (251,251,251) (250,250,250) (255,255,255) (255,255,255) (255,255,255)
(252,252,252) (251,251,251) (251,251,251) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(252,252,252) (250,250,250) (253,253,253) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(254,254,254) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 338×194; shape box=(56.00,52.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 272×128; shape box=(23.00,19.00,226.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (191,191,191) (188,188,188) (187,187,187) (185,185,185) (185,185,185) (183,183,183) (183,183,183) (183,183,183)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.0,188.0,187.0,185.0,185.0,183.0,183.0,183.0`; alpha: `5,6,8,8,11,13,16,47,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=47; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (184,184,184) (184,184,184) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,183.0,183.0,184.0,184.0,185.0`; alpha: `11,13,16,18,22,24,27,58,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+17.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (191,191,191) (188,188,188) (187,187,187) (187,187,187) (187,187,187) (186,186,186) (186,186,186) (186,186,186)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.0,188.0,187.0,187.0,187.0,186.0,186.0,186.0`; alpha: `21,25,26,31,34,37,40,69,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=69; inner 0–3 px mean lift over 5–8 px=+19.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (184,184,184) (184,184,184) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,183.0,183.0,184.0,184.0,185.0`; alpha: `12,14,16,18,22,24,27,59,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+17.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (111,111,111)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (145,145,145) (231,231,231) (253,253,253)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (198,198,198) (250,250,250) (210,210,210) (194,194,194)
(0,0,0) (0,0,0) (0,0,0) (209,209,209) (245,245,245) (200,200,200) (186,186,186) (186,186,186)
(0,0,0) (0,0,0) (195,195,195) (245,245,245) (196,196,196) (185,185,185) (185,185,185) (184,184,184)
(0,0,0) (139,139,139) (251,251,251) (199,199,199) (184,184,184) (184,184,184) (184,184,184) (184,184,184)
(0,0,0) (226,226,226) (209,209,209) (184,184,184) (184,184,184) (184,184,184) (184,184,184) (184,184,184)
(100,100,100) (250,250,250) (192,192,192) (184,184,184) (184,184,184) (184,184,184) (183,183,183) (183,183,183)
```
**bottom-right 8×8 RGB:**

```text
(184,184,184) (184,184,184) (183,183,183) (183,183,183) (183,183,183) (191,191,191) (250,250,250) (93,93,93)
(184,184,184) (184,184,184) (183,183,183) (183,183,183) (183,183,183) (208,208,208) (222,222,222) (0,0,0)
(184,184,184) (184,184,184) (183,183,183) (183,183,183) (197,197,197) (247,247,247) (129,129,129) (0,0,0)
(184,184,184) (184,184,184) (183,183,183) (195,195,195) (244,244,244) (187,187,187) (0,0,0) (0,0,0)
(185,185,185) (185,185,185) (198,198,198) (243,243,243) (202,202,202) (0,0,0) (0,0,0) (0,0,0)
(193,193,193) (209,209,209) (249,249,249) (189,189,189) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(251,251,251) (224,224,224) (126,126,126) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(90,90,90) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light-contrast\plain\combobox

Case: combobox; appearance=light-contrast; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-1-host-runtime.json`, `attempt-1-runtime-0.json`.

### menu-window-0 — display

Image `attempt-1-display.png`: 349×194; shape box=(56.00,56.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(191,151,54) (124,108,45) (90,88,58) (192,176,137) (236,230,211) (246,245,237) (241,233,211) (223,209,176) (226,206,154) (231,212,173) (245,245,245) (243,239,229) (239,206,133) (247,217,112) (237,202,87) (188,152,44) (147,133,86)`; luma: `152.5,106.9,86.3,176.6,229.9,244.6,233.1,209.6,206.5,213.2,245.0,239.1,207.7,215.8,201.1,151.9,132.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=92.1); edge at −1 RGB=(223,209,176), Y=209.6; composited; inner 0–3 px mean lift over 5–8 px=+50.6 Y.
- right: RGB distances −8..+8: `(156,44,2) (90,60,2) (106,113,4) (101,108,2) (84,87,2) (114,117,3) (102,100,2) (88,87,2) (75,72,2) (56,57,3) (176,160,15) (119,106,7) (73,72,4) (120,126,3) (95,102,4) (65,74,4) (66,71,4)`; luma: `64.8,62.2,103.6,98.9,80.2,108.1,93.3,81.1,67.6,52.9,152.9,101.6,67.3,115.8,93.4,67.0,65.1`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=43.4); edge at −1 RGB=(88,87,2), Y=81.1; composited; inner 0–3 px mean lift over 5–8 px=+8.4 Y.
- bottom: RGB distances −8..+8: `(80,51,24) (191,183,157) (238,238,217) (163,161,106) (117,117,44) (96,96,45) (163,163,120) (166,161,102) (123,129,38) (126,140,29) (107,118,17) (84,92,10) (73,82,8) (77,84,5) (129,136,61) (140,142,81) (120,119,22)`; luma: `55.2,182.8,236.5,157.5,111.7,92.3,159.9,157.8,121.2,129.0,108.4,84.4,74.7,76.8,129.1,137.2,112.2`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=181.3); edge at −1 RGB=(166,161,102), Y=157.8; composited; inner 0–3 px mean lift over 5–8 px=-3.1 Y.
- left: RGB distances −8..+8: `(42,85,178) (50,91,185) (107,133,210) (123,143,218) (83,101,188) (51,67,153) (53,73,163) (68,92,178) (73,91,164) (163,181,217) (76,82,147) (63,74,159) (138,166,226) (116,150,219) (82,123,211) (67,108,199) (70,107,192)`; luma: `82.6,89.1,133.0,144.2,103.5,69.8,75.2,93.1,92.4,179.8,85.4,77.8,164.4,147.8,120.6,105.9,105.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=61.6); edge at −1 RGB=(68,92,178), Y=93.1; composited; inner 0–3 px mean lift over 5–8 px=-11.0 Y.
**top-left 8×8 RGB:**

```text
(12,18,0) (49,60,23) (155,173,138) (203,221,194) (148,168,113) (139,160,102) (118,142,68) (141,163,97)
(10,16,3) (25,33,1) (93,106,58) (209,224,197) (154,174,129) (169,186,136) (99,116,48) (119,139,65)
(16,26,1) (33,45,4) (48,59,12) (141,150,117) (165,184,141) (177,193,147) (52,65,23) (64,79,18)
(23,35,0) (34,47,3) (13,22,0) (60,67,39) (164,181,131) (181,197,148) (60,73,32) (33,46,0)
(27,42,0) (28,40,2) (13,20,3) (23,27,6) (142,156,103) (191,206,157) (90,101,58) (24,34,0)
(30,47,1) (23,33,3) (7,9,1) (4,8,0) (107,119,69) (199,215,163) (123,135,89) (15,23,1)
(33,50,1) (10,17,1) (1,2,0) (0,0,0) (57,64,32) (201,213,158) (137,150,105) (16,23,1)
(43,60,2) (31,44,2) (21,28,2) (16,18,3) (23,28,3) (144,153,95) (123,134,81) (35,47,5)
```
**bottom-right 8×8 RGB:**

```text
(160,157,153) (214,208,205) (206,202,201) (173,174,177) (150,156,161) (124,131,132) (112,123,122) (30,37,22)
(184,180,178) (209,205,206) (194,192,194) (170,173,176) (142,151,155) (116,125,127) (99,115,114) (21,29,12)
(184,181,180) (207,205,205) (180,181,183) (159,165,168) (135,143,146) (112,119,119) (91,104,98) (19,21,4)
(169,168,168) (193,190,190) (165,167,170) (161,165,169) (148,155,160) (134,142,142) (82,90,87) (50,53,44)
(190,189,190) (211,210,208) (206,203,203) (208,208,207) (196,203,205) (158,169,173) (89,97,102) (112,121,115)
(233,229,228) (242,239,237) (218,218,218) (169,174,177) (125,135,143) (91,100,109) (119,131,133) (73,78,64)
(144,143,146) (154,152,154) (121,123,129) (128,132,137) (131,135,139) (137,143,142) (89,97,88) (12,14,1)
(178,177,178) (215,214,213) (223,219,217) (247,243,237) (218,215,209) (159,164,160) (43,50,39) (2,5,0)
```

### menu-window-0 — single-window

Image `attempt-1-window-0-single.png`: 349×194; shape box=(56.00,52.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### menu-window-0 — cgwindow

Image `attempt-1-window-0-cgwindow.png`: 283×128; shape box=(23.00,19.00,237.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (248,248,248) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (0,64,221) (0,64,221) (0,64,221) (0,64,221)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,248.0,230.7,230.7,230.7,230.7,61.7,61.7,61.7,61.7`; alpha: `5,5,8,9,11,13,16,48,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=48; inner 0–3 px mean lift over 5–8 px=+173.3 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (248,248,248) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,248.0,230.7,230.7,230.7,230.7,230.7,230.7,230.7,230.7`; alpha: `12,13,16,19,22,24,27,58,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+4.3 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (248,248,248) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,248.0,230.7,230.7,230.7,230.7,230.7,230.7,230.7,230.7`; alpha: `21,24,27,30,34,37,40,69,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=69; inner 0–3 px mean lift over 5–8 px=+4.3 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (248,248,248) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230) (230,230,230)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,248.0,230.0,230.0,230.0,230.0,230.0,230.0,230.0,230.0`; alpha: `12,14,16,18,22,24,27,59,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+4.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (200,200,200) (242,242,242)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (237,237,237) (243,243,243) (237,238,237)
(0,0,0) (0,0,0) (0,0,0) (144,144,144) (244,245,244) (240,241,240) (233,234,233) (230,231,230)
(0,0,0) (0,0,0) (125,125,125) (243,244,243) (239,240,239) (230,231,230) (230,231,230) (230,231,230)
(0,0,0) (0,0,0) (237,237,237) (240,241,240) (230,231,230) (230,231,230) (230,231,230) (230,231,230)
(0,0,0) (198,198,198) (243,243,243) (233,234,233) (230,231,230) (230,231,230) (230,231,230) (200,209,229)
(0,0,0) (242,242,242) (237,238,237) (230,231,230) (230,231,230) (230,231,230) (200,209,229) (77,120,224)
```
**bottom-right 8×8 RGB:**

```text
(230,231,230) (230,231,230) (230,231,230) (230,231,230) (230,231,230) (237,238,237) (241,241,241) (0,0,0)
(230,231,230) (230,231,230) (230,231,230) (230,231,230) (233,234,233) (244,245,244) (185,185,185) (0,0,0)
(230,231,230) (230,231,230) (230,231,230) (230,231,230) (240,241,240) (236,236,236) (0,0,0) (0,0,0)
(230,231,230) (230,231,230) (231,232,231) (239,240,239) (243,244,243) (101,101,101) (0,0,0) (0,0,0)
(230,231,230) (232,233,232) (240,241,240) (244,244,244) (128,128,128) (0,0,0) (0,0,0) (0,0,0)
(237,238,237) (244,244,244) (233,233,233) (101,101,101) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(240,240,240) (182,182,182) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light-contrast\plain\context

Case: context; appearance=light-contrast; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-3-host-runtime.json`, `attempt-3-runtime-0.json`.

### menu-window-0 — display

Image `attempt-3-display.png`: 212×205; shape box=(56.00,56.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254) (253,253,253) (253,253,253) (252,252,252) (252,252,252) (251,251,251) (251,251,251) (250,250,250)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,254.0,253.0,253.0,252.0,252.0,251.0,251.0,250.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+2.8 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (250,250,250) (250,250,250) (250,250,250) (250,250,250) (251,251,251) (251,251,251) (252,252,252) (252,252,252) (253,253,253)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,250.0,250.0,250.0,250.0,251.0,251.0,252.0,252.0,253.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-2.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254) (254,254,254) (254,254,254) (254,254,254) (254,254,254) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,254.0,254.0,254.0,254.0,254.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-0.5 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (250,250,250) (250,250,250) (250,250,250) (250,250,250) (251,251,251) (251,251,251) (252,252,252) (252,252,252) (253,253,253)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,250.0,250.0,250.0,250.0,251.0,251.0,252.0,252.0,253.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-2.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254) (252,252,252) (253,253,253)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (252,252,252) (254,254,254) (254,254,254)
(255,255,255) (255,255,255) (255,255,255) (251,251,251) (253,253,253) (253,253,253) (253,253,253) (253,253,253)
(255,255,255) (255,255,255) (251,251,251) (254,254,254) (253,253,253) (253,253,253) (253,253,253) (253,253,253)
(255,255,255) (253,253,253) (251,251,251) (253,253,253) (253,253,253) (252,252,252) (252,252,252) (252,252,252)
(255,255,255) (250,250,250) (253,253,253) (252,252,252) (252,252,252) (252,252,252) (252,252,252) (251,251,251)
(254,254,254) (252,252,252) (252,252,252) (252,252,252) (252,252,252) (251,251,251) (251,251,251) (251,251,251)
```
**bottom-right 8×8 RGB:**

```text
(252,252,252) (251,251,251) (251,251,251) (251,251,251) (250,250,250) (250,250,250) (250,250,250) (254,254,254)
(252,252,252) (251,251,251) (251,251,251) (251,251,251) (250,250,250) (250,250,250) (249,249,249) (255,255,255)
(252,252,252) (251,251,251) (251,251,251) (251,251,251) (250,250,250) (249,249,249) (253,253,253) (255,255,255)
(252,252,252) (251,251,251) (251,251,251) (251,251,251) (251,251,251) (250,250,250) (255,255,255) (255,255,255)
(252,252,252) (251,251,251) (251,251,251) (251,251,251) (250,250,250) (255,255,255) (255,255,255) (255,255,255)
(252,252,252) (251,251,251) (251,251,251) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(251,251,251) (250,250,250) (253,253,253) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(254,254,254) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — single-window

Image `attempt-3-window-0-single.png`: 212×205; shape box=(56.00,52.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — cgwindow

Image `attempt-3-window-0-cgwindow.png`: 146×139; shape box=(23.00,19.00,100.00,93.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (192,191,191) (189,189,189) (187,187,187) (186,186,186) (185,185,185) (184,184,184) (184,184,184) (183,183,183)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.2,189.0,187.0,186.0,185.0,184.0,184.0,183.0`; alpha: `5,6,8,10,12,14,16,47,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 6 px; α at −1=47; inner 0–3 px mean lift over 5–8 px=+21.6 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (184,184,184) (184,184,184) (184,184,184) (185,185,185) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,184.0,184.0,184.0,185.0,185.0`; alpha: `11,13,16,18,22,25,27,59,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+16.5 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (192,191,191) (189,189,189) (188,188,188) (187,187,187) (188,188,188) (187,187,187) (187,187,187) (187,187,187)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,191.2,189.0,188.0,187.0,188.0,187.0,187.0,187.0`; alpha: `21,24,27,31,34,36,40,69,251,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=69; inner 0–3 px mean lift over 5–8 px=+18.6 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (184,184,184) (184,184,184) (184,184,184) (185,185,185) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,184.0,184.0,184.0,185.0,185.0`; alpha: `11,14,16,18,21,24,27,58,233,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+16.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (111,111,111)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (145,145,145) (231,231,231) (254,254,254)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (198,198,198) (251,251,251) (211,211,211) (194,194,194)
(0,0,0) (0,0,0) (0,0,0) (209,209,209) (246,246,246) (200,200,200) (187,187,187) (187,187,187)
(0,0,0) (0,0,0) (198,198,198) (246,246,246) (197,197,197) (186,186,186) (185,185,185) (186,186,186)
(0,0,0) (139,139,139) (250,250,250) (199,199,199) (185,185,185) (185,185,185) (185,185,185) (185,185,185)
(0,0,0) (225,225,225) (209,209,209) (185,185,185) (185,185,185) (185,185,185) (185,185,185) (184,184,184)
(100,100,100) (251,251,251) (193,193,193) (185,185,185) (184,184,184) (184,184,184) (184,184,184) (184,184,184)
```
**bottom-right 8×8 RGB:**

```text
(185,185,185) (184,184,184) (184,184,184) (184,184,184) (183,183,183) (192,192,192) (248,248,248) (101,101,101)
(185,185,185) (184,184,184) (184,184,184) (184,184,184) (183,183,183) (208,208,208) (222,222,222) (0,0,0)
(185,185,185) (184,184,184) (184,184,184) (184,184,184) (198,198,198) (247,247,247) (134,134,134) (0,0,0)
(186,186,186) (184,184,184) (185,185,185) (195,195,195) (244,244,244) (187,187,187) (0,0,0) (0,0,0)
(186,186,186) (185,185,185) (199,199,199) (245,245,245) (202,202,202) (0,0,0) (0,0,0) (0,0,0)
(192,192,192) (209,209,209) (250,250,250) (187,187,187) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(251,251,251) (222,222,222) (129,129,129) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(86,86,86) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\menus\light-contrast\plain\submenu

Case: submenu; appearance=light-contrast; background=plain; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

Nested submenu result: no parent popup window appeared during the recorded attempts.

## macos27-captures\out\menu-outline\menus\light-contrast\plain\swiftui-menu

Case: swiftui-menu; appearance=light-contrast; background=plain; opened=False.

Menu-open result: `no visible menu window during tracking`; attempts=[{'attempt': 1, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 2, 'error': 'no visible menu window during tracking', 'opened': False}, {'attempt': 3, 'error': 'no visible menu window during tracking', 'opened': False}].

## macos27-captures\out\menu-outline\menus\light-contrast\plain\swiftui-picker

Case: swiftui-picker; appearance=light-contrast; background=plain; opened=True.

Visible captured menu windows: 1.

Runtime dumps: `attempt-2-host-runtime.json`, `attempt-2-runtime-0.json`.

### menu-window-0 — display

Image `attempt-2-display.png`: 211×194; shape box=(56.00,56.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(182,83,9) (220,92,18) (224,83,25) (210,79,37) (196,71,37) (182,56,22) (157,50,10) (124,62,5) (215,198,158) (211,196,154) (200,185,147) (201,178,145) (216,180,146) (214,176,143) (214,175,142) (215,178,143) (215,179,146)`; luma: `98.7,113.9,108.8,103.8,95.1,80.3,69.9,71.1,198.7,196.2,185.4,180.5,185.2,181.7,180.9,183.3,184.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-7, -6, -3, -2, -1] px; max ΔY=28.8); edge at −1 RGB=(124,62,5), Y=71.1; composited; inner 0–3 px mean lift over 5–8 px=+7.7 Y.
- right: RGB distances −8..+8: `(78,63,6) (98,52,5) (110,57,4) (80,48,2) (48,36,3) (28,27,3) (31,32,3) (51,54,4) (184,167,129) (182,165,130) (187,165,131) (199,163,136) (199,160,141) (194,160,141) (200,161,142) (230,169,146) (238,167,146)`; luma: `62.1,58.4,64.4,51.5,36.2,25.5,29.7,49.8,167.9,166.1,167.2,168.7,166.9,165.9,167.9,180.3,180.6`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 5/8 ([-5, -4, -3, -2, -1] px; max ΔY=36.6); edge at −1 RGB=(51,54,4), Y=49.8; composited; inner 0–3 px mean lift over 5–8 px=-6.2 Y.
- bottom: RGB distances −8..+8: `(102,93,85) (102,93,83) (106,97,80) (125,115,75) (145,137,94) (121,111,97) (105,95,85) (101,92,75) (211,203,179) (213,208,167) (202,198,161) (203,198,161) (209,205,165) (205,200,162) (204,198,160) (201,196,161) (193,186,156)`; luma: `94.3,94.2,97.7,114.2,135.6,112.1,96.4,92.7,203.0,206.1,196.2,196.4,203.0,198.3,196.5,194.5,185.3`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 3/8 ([-5, -4, -3] px; max ΔY=41.3); edge at −1 RGB=(101,92,75), Y=92.7; composited; inner 0–3 px mean lift over 5–8 px=+6.7 Y.
- left: RGB distances −8..+8: `(216,190,123) (206,189,147) (176,155,111) (151,134,93) (136,128,83) (94,96,64) (167,166,142) (223,214,181) (215,206,174) (213,202,165) (221,213,181) (222,218,192) (221,218,193) (202,199,171) (186,184,156) (202,199,171) (221,217,191)`; luma: `190.7,189.6,156.3,134.7,126.5,93.3,164.5,213.5,205.6,201.7,212.4,217.0,216.8,197.6,182.4,197.6,216.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 6/8 ([-6, -5, -4, -3, -2, -1] px; max ΔY=97.4); edge at −1 RGB=(223,214,181), Y=213.5; composited; inner 0–3 px mean lift over 5–8 px=+10.8 Y.
**top-left 8×8 RGB:**

```text
(99,100,5) (123,121,11) (112,106,13) (158,140,9) (195,167,10) (143,128,22) (79,82,26) (55,62,25)
(100,103,8) (156,150,10) (177,164,21) (163,146,23) (186,159,16) (211,192,42) (139,136,64) (154,154,117)
(124,126,11) (169,160,10) (220,200,13) (211,187,17) (191,166,28) (224,213,110) (215,208,158) (192,189,155)
(151,148,8) (137,135,9) (180,157,5) (209,174,19) (227,211,132) (223,211,149) (206,198,152) (193,190,153)
(146,137,13) (139,132,8) (185,165,29) (230,217,151) (232,221,173) (228,217,166) (220,211,164) (212,206,172)
(166,158,93) (123,108,23) (189,175,106) (230,221,176) (232,224,185) (230,218,173) (234,223,184) (237,228,193)
(191,189,162) (163,156,109) (206,197,156) (205,195,154) (214,203,163) (228,218,180) (234,224,188) (225,214,171)
(121,109,58) (171,166,130) (196,191,160) (193,188,156) (203,197,164) (221,209,172) (229,215,171) (228,217,168)
```
**bottom-right 8×8 RGB:**

```text
(169,162,137) (188,175,151) (210,192,167) (205,190,159) (192,179,145) (176,164,136) (123,121,99) (23,25,4)
(173,159,139) (181,164,145) (204,185,162) (205,191,160) (197,185,150) (181,174,140) (67,69,32) (17,20,1)
(177,161,139) (178,159,141) (189,172,150) (201,189,158) (196,186,152) (160,158,110) (65,69,15) (18,20,1)
(183,165,139) (175,160,137) (175,161,139) (188,178,148) (189,186,148) (127,134,59) (88,95,27) (30,34,5)
(178,165,136) (175,163,136) (172,160,136) (172,167,135) (117,123,53) (126,134,52) (109,118,40) (57,64,17)
(172,162,135) (168,161,135) (125,119,90) (85,86,26) (105,111,29) (117,125,40) (124,133,47) (89,97,31)
(136,131,103) (77,76,32) (40,39,3) (46,48,10) (93,98,27) (119,127,36) (125,134,41) (112,121,39)
(27,26,2) (51,51,1) (51,50,1) (33,31,3) (56,57,15) (112,118,34) (122,131,35) (119,128,36)
```

### menu-window-0 — single-window

Image `attempt-2-window-0-single.png`: 211×194; shape box=(56.00,52.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### menu-window-0 — cgwindow

Image `attempt-2-window-0-cgwindow.png`: 145×128; shape box=(23.00,19.00,99.00,82.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (192,192,192) (187,187,187) (187,187,187) (185,185,185) (185,185,185) (183,183,183) (183,183,183) (183,183,183)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,192.0,187.0,187.0,185.0,185.0,183.0,183.0,183.0`; alpha: `3,4,5,7,8,9,11,34,178,181,181,181,181,181,181,181,181`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 4 px; α at −1=34; inner 0–3 px mean lift over 5–8 px=+21.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (185,185,185) (185,185,185) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,183.0,183.0,185.0,185.0,185.0`; alpha: `7,10,11,13,15,18,18,41,165,181,181,181,181,181,181,181,181`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 7 px; α at −1=41; inner 0–3 px mean lift over 5–8 px=+16.5 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (192,192,192) (187,187,187) (187,187,187) (187,187,187) (187,187,187) (186,186,186) (186,186,186) (186,186,186)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,192.0,187.0,187.0,187.0,187.0,186.0,186.0,186.0`; alpha: `15,17,19,22,24,26,28,49,178,181,181,181,181,181,181,181,181`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=49; inner 0–3 px mean lift over 5–8 px=+19.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (183,183,183) (185,185,185) (185,185,185) (185,185,185)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,183.0,183.0,183.0,183.0,183.0,185.0,185.0,185.0`; alpha: `8,9,11,13,16,18,20,42,165,181,181,181,181,181,181,181,181`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=42; inner 0–3 px mean lift over 5–8 px=+16.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (107,107,107)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (144,144,144) (230,230,230) (253,253,253)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (199,199,199) (250,250,250) (210,210,210) (194,194,194)
(0,0,0) (0,0,0) (0,0,0) (208,208,208) (247,247,247) (200,200,200) (186,186,186) (186,186,186)
(0,0,0) (0,0,0) (194,197,194) (245,245,245) (196,196,196) (185,185,185) (185,185,185) (185,185,185)
(0,0,0) (139,139,139) (251,251,251) (199,199,199) (185,185,185) (185,185,185) (185,185,185) (185,185,185)
(0,0,0) (225,225,225) (209,209,209) (185,185,185) (185,185,185) (185,185,185) (185,185,185) (185,185,185)
(98,98,98) (252,252,252) (192,192,192) (185,185,185) (185,185,185) (185,185,185) (183,183,183) (183,183,183)
```
**bottom-right 8×8 RGB:**

```text
(185,185,185) (185,185,185) (183,183,183) (183,183,183) (183,183,183) (192,192,192) (250,250,250) (92,92,92)
(185,185,185) (185,185,185) (183,183,183) (183,183,183) (183,183,183) (209,209,209) (220,220,220) (0,0,0)
(185,185,185) (185,185,185) (183,183,183) (183,183,183) (197,197,197) (248,248,248) (132,132,132) (0,0,0)
(185,185,185) (185,185,185) (183,183,183) (194,194,194) (242,242,242) (187,187,187) (0,0,0) (0,0,0)
(185,185,185) (185,185,185) (199,199,199) (244,244,244) (203,203,203) (0,0,0) (0,0,0) (0,0,0)
(194,194,194) (209,209,209) (246,246,246) (190,190,190) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(248,248,248) (226,226,226) (132,132,132) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(99,99,99) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\step1\dark\black

Case: normal titled NSWindow; appearance=dark; background=black; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (1,1,1) (10,10,10)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (3,3,3) (19,19,19) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (4,4,4) (24,24,24) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (3,3,3) (24,24,24) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (1,1,1) (19,19,19) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (10,10,10) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (70,70,70) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (130,130,130) (4,4,4) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (164,164,164) (19,19,19) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (164,164,164) (24,24,24) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (130,130,130) (19,19,19) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(70,70,70) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,60.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,33,239,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=239; inner 0–3 px mean lift over 5–8 px=+5.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,69,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `126,129,132,134,137,140,145,247,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=247; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,70,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (5,5,5) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (14,14,14) (53,53,53) (51,51,51)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (17,17,17) (56,56,56) (48,48,48) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (14,14,14) (56,56,56) (47,47,47) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (5,5,5) (53,53,53) (48,48,48) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (36,36,36) (51,51,51) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (117,117,117) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (198,198,198) (9,9,9) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (227,227,227) (32,32,32) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (227,227,227) (40,40,40) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (197,197,197) (32,32,32) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(117,117,117) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,60.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,33,239,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=239; inner 0–3 px mean lift over 5–8 px=+5.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,69,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `126,129,132,134,137,140,145,247,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=247; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,70,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (5,5,5) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (14,14,14) (53,53,53) (51,51,51)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (17,17,17) (56,56,56) (48,48,48) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (14,14,14) (56,56,56) (47,47,47) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (5,5,5) (53,53,53) (48,48,48) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (36,36,36) (51,51,51) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (117,117,117) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (198,198,198) (9,9,9) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (227,227,227) (32,32,32) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (227,227,227) (40,40,40) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (197,197,197) (32,32,32) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(117,117,117) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\step1\dark\white

Case: normal titled NSWindow; appearance=dark; background=white; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (195,195,195)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (239,239,239) (144,144,144) (38,38,38)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (234,234,234) (115,115,115) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (255,255,255) (239,239,239) (115,115,115) (38,38,38) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (252,252,252) (144,144,144) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (195,195,195) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (185,185,185) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (251,251,251) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (91,91,91) (236,236,236) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (91,91,91) (231,231,231) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (125,125,125) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(185,185,185) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,60.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,33,239,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=239; inner 0–3 px mean lift over 5–8 px=+5.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,69,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `126,129,132,134,137,140,145,247,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=247; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,70,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (5,5,5) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (14,14,14) (53,53,53) (51,51,51)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (17,17,17) (56,56,56) (48,48,48) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (14,14,14) (56,56,56) (47,47,47) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (5,5,5) (53,53,53) (48,48,48) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (36,36,36) (51,51,51) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (15,15,15) (19,19,19) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (11,11,11) (26,26,26) (4,4,4) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (10,10,10) (25,25,25) (9,9,9) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (11,11,11) (25,25,25) (10,10,10) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (26,26,26) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(19,19,19) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,60.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,33,239,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=239; inner 0–3 px mean lift over 5–8 px=+5.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,69,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `126,129,132,134,137,140,145,247,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=247; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,70,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (5,5,5) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (14,14,14) (53,53,53) (51,51,51)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (17,17,17) (56,56,56) (48,48,48) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (14,14,14) (56,56,56) (47,47,47) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (5,5,5) (53,53,53) (48,48,48) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (36,36,36) (51,51,51) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (15,15,15) (19,19,19) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (11,11,11) (26,26,26) (4,4,4) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (10,10,10) (25,25,25) (9,9,9) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (11,11,11) (25,25,25) (10,10,10) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (26,26,26) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(19,19,19) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\step1\dark-contrast\black

Case: normal titled NSWindow; appearance=dark-contrast; background=black; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (39,39,38) (38,38,39) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,38.0,38.0,38.0,38.0,38.0,38.9,38.1,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=-0.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (1,1,1) (10,10,10)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (3,3,3) (20,19,19) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (4,4,4) (24,24,24) (38,38,38) (39,38,38)
(0,0,0) (0,0,0) (0,0,0) (3,3,3) (24,24,24) (38,38,38) (38,38,38) (38,39,38)
(0,0,0) (0,0,0) (1,1,1) (19,19,19) (39,38,38) (39,38,39) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (10,10,10) (38,38,38) (38,38,38) (38,39,38) (38,38,38) (39,38,38)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (70,70,70) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (130,130,130) (4,4,4) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (164,164,164) (19,19,19) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (164,164,164) (24,24,24) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (130,130,130) (19,19,19) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(70,70,70) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (81,81,81) (39,38,38) (38,38,38) (38,38,38) (39,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,81.0,38.2,38.0,38.0,38.2,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,30,58,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+10.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,69,74,77,80,84,107,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=107; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `126,129,132,134,137,140,143,159,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=159; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,70,74,77,80,84,108,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=108; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (36,36,36) (87,87,87)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (68,68,68) (88,88,88) (63,63,63)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (73,73,73) (82,82,82) (57,58,58) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (66,66,66) (82,82,82) (55,55,55) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (34,34,34) (87,87,87) (57,57,57) (39,39,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (87,87,87) (63,63,63) (38,38,39) (38,38,38) (38,38,39) (38,39,39)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (183,183,183) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (233,233,233) (26,26,26) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (244,244,244) (79,79,79) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (245,245,245) (91,91,91) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (233,233,233) (78,78,78) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(179,179,179) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (81,81,81) (39,38,38) (38,38,38) (38,38,38) (39,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,81.0,38.2,38.0,38.0,38.2,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,30,58,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+10.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,69,74,77,80,84,107,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=107; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `126,129,132,134,137,140,143,159,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=159; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,70,74,77,80,84,108,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=108; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (36,36,36) (87,87,87)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (68,68,68) (88,88,88) (63,63,63)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (73,73,73) (82,82,82) (57,58,58) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (66,66,66) (82,82,82) (55,55,55) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (34,34,34) (87,87,87) (57,57,57) (39,39,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (87,87,87) (63,63,63) (38,38,39) (38,38,38) (38,38,39) (38,39,39)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (183,183,183) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (233,233,233) (26,26,26) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (244,244,244) (79,79,79) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (245,245,245) (91,91,91) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (233,233,233) (78,78,78) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(179,179,179) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\step1\dark-contrast\white

Case: normal titled NSWindow; appearance=dark-contrast; background=white; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (39,39,38) (38,38,39) (38,38,38) (38,38,38)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,38.0,38.0,38.0,38.0,38.0,38.9,38.1,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-0.2 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (195,195,195)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (239,239,239) (145,144,144) (38,38,38)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (234,234,234) (115,115,115) (38,38,38) (39,38,38)
(255,255,255) (255,255,255) (255,255,255) (239,239,239) (115,115,115) (38,38,38) (38,38,38) (38,39,38)
(255,255,255) (255,255,255) (252,252,252) (144,144,144) (39,38,38) (39,38,39) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (195,195,195) (38,38,38) (38,38,38) (38,39,38) (38,38,38) (39,38,38)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (185,185,185) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (251,251,251) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (91,91,91) (236,236,236) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (91,91,91) (231,231,231) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (125,125,125) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(185,185,185) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (81,81,81) (39,38,38) (38,38,38) (38,38,38) (39,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,81.0,38.2,38.0,38.0,38.2,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,30,58,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+10.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (51,51,51) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,69,74,77,80,84,107,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=107; inner 0–3 px mean lift over 5–8 px=+12.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (51,51,51) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `126,129,132,134,137,140,143,159,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=159; inner 0–3 px mean lift over 5–8 px=+12.7 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (51,51,51) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,70,74,77,80,84,108,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=108; inner 0–3 px mean lift over 5–8 px=+12.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (36,36,36) (87,87,87)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (68,68,68) (88,88,88) (63,63,63)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (73,73,73) (82,82,82) (57,58,58) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (66,66,66) (82,82,82) (55,55,55) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (34,34,34) (87,87,87) (57,57,57) (39,39,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (87,87,87) (63,63,63) (38,38,39) (38,38,38) (38,38,39) (38,39,39)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (30,30,30) (56,56,56) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (22,22,22) (57,57,57) (16,16,16) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (20,20,20) (51,51,51) (35,35,35) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (22,22,22) (51,51,51) (38,38,38) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(30,30,30) (57,57,57) (34,34,34) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(54,54,54) (15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (81,81,81) (39,38,38) (38,38,38) (38,38,38) (39,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,81.0,38.2,38.0,38.0,38.2,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,30,58,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+10.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (51,51,51) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,69,74,77,80,84,107,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=107; inner 0–3 px mean lift over 5–8 px=+12.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (51,51,51) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `126,129,132,134,137,140,143,159,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=159; inner 0–3 px mean lift over 5–8 px=+12.7 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (51,51,51) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,70,74,77,80,84,108,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=108; inner 0–3 px mean lift over 5–8 px=+12.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (36,36,36) (87,87,87)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (68,68,68) (88,88,88) (63,63,63)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (73,73,73) (82,82,82) (57,58,58) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (66,66,66) (82,82,82) (55,55,55) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (34,34,34) (87,87,87) (57,57,57) (39,39,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (87,87,87) (63,63,63) (38,38,39) (38,38,38) (38,38,39) (38,39,39)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (30,30,30) (56,56,56) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (22,22,22) (57,57,57) (16,16,16) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (20,20,20) (51,51,51) (35,35,35) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (22,22,22) (51,51,51) (38,38,38) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(30,30,30) (57,57,57) (34,34,34) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(54,54,54) (15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\step1\light\black

Case: normal titled NSWindow; appearance=light; background=black; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (4,4,4) (70,70,70)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19) (130,130,130) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (24,24,24) (164,164,164) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (19,19,19) (164,164,164) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (4,4,4) (130,130,130) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (70,70,70) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (70,70,70) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (130,130,130) (4,4,4) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (164,164,164) (19,19,19) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (164,164,164) (24,24,24) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (130,130,130) (19,19,19) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(70,70,70) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,10,12,14,14,16,16,54,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=54; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `36,38,39,42,44,45,48,80,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=80; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `72,73,75,76,78,80,82,109,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=109; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `36,38,39,42,44,46,48,81,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=81; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (34,34,34) (187,187,187)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (79,79,79) (235,235,235) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (94,94,94) (248,248,248) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (77,77,77) (248,248,248) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (34,34,34) (235,235,235) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (187,187,187) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (170,170,170) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (229,229,229) (23,23,23) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (244,244,244) (64,64,64) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (244,244,244) (77,77,77) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (229,229,229) (63,63,63) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(170,170,170) (22,22,22) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,10,12,14,14,16,16,54,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=54; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `36,38,39,42,44,45,48,80,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=80; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `72,73,75,76,78,80,82,109,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=109; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `36,38,39,42,44,46,48,81,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=81; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (34,34,34) (187,187,187)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (79,79,79) (235,235,235) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (94,94,94) (248,248,248) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (77,77,77) (248,248,248) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (34,34,34) (235,235,235) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (187,187,187) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (170,170,170) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (229,229,229) (23,23,23) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (244,244,244) (64,64,64) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (244,244,244) (77,77,77) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (229,229,229) (63,63,63) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(170,170,170) (22,22,22) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\step1\light\white

Case: normal titled NSWindow; appearance=light; background=white; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (185,185,185) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (251,251,251) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (91,91,91) (236,236,236) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (91,91,91) (231,231,231) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (125,125,125) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(185,185,185) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,10,12,14,14,16,16,52,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=52; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `36,38,39,42,44,45,48,78,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=78; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `72,73,75,76,78,80,82,108,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=108; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `36,38,39,42,44,46,48,79,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=79; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (34,34,34) (187,187,187)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (79,79,79) (235,235,235) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (94,94,94) (248,248,248) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (77,77,77) (248,248,248) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (34,34,34) (235,235,235) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (187,187,187) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (15,15,15) (28,28,28) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (11,11,11) (30,30,30) (10,10,10) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (10,10,10) (27,27,27) (18,18,18) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (11,11,11) (27,27,27) (20,20,20) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (30,30,30) (18,18,18) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(28,28,28) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,10,12,14,14,16,16,52,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=52; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `36,38,39,42,44,45,48,78,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=78; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `72,73,75,76,78,80,82,108,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=108; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `36,38,39,42,44,46,48,79,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=79; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (34,34,34) (187,187,187)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (79,79,79) (235,235,235) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (94,94,94) (248,248,248) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (77,77,77) (248,248,248) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (34,34,34) (235,235,235) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (187,187,187) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (15,15,15) (28,28,28) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (11,11,11) (30,30,30) (10,10,10) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (10,10,10) (27,27,27) (18,18,18) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (11,11,11) (27,27,27) (20,20,20) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (30,30,30) (18,18,18) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(28,28,28) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\step1\light-contrast\black

Case: normal titled NSWindow; appearance=light-contrast; background=black; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (4,4,4) (70,70,70)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19) (130,130,130) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (24,24,24) (164,164,164) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (19,19,19) (164,164,164) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (4,4,4) (130,130,130) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (70,70,70) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (70,70,70) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (130,130,130) (4,4,4) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (164,164,164) (19,19,19) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (164,164,164) (24,24,24) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (130,130,130) (19,19,19) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(70,70,70) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,1,0,1,1,1,1,2,2,3,5,5,6,9,9,12`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=1; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (247,247,247) (239,240,241) (237,238,239) (235,235,239) (235,235,239) (237,238,239)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 686×538; shape box=(23.00,5.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,1,1,2,1,2,2,3,4,4,7`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=1; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,12,13,16,19,21,25,54,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=54; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,12,14,16,19,21,24,55,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=55; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (253,253,253)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (250,250,250)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (246,246,246)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (233,233,233)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (208,208,208)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (152,152,152)
```

## macos27-captures\out\menu-outline\step1\light-contrast\white

Case: normal titled NSWindow; appearance=light-contrast; background=white; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (185,185,185) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (251,251,251) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (91,91,91) (236,236,236) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (91,91,91) (231,231,231) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (125,125,125) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(185,185,185) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,1,0,1,1,1,1,2,2,3,5,5,6,9,9,12`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=1; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (247,247,247) (239,240,241) (237,238,239) (235,235,239) (235,235,239) (237,238,239)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 686×538; shape box=(23.00,5.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,1,1,2,1,2,2,3,4,4,7`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=1; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (179,179,179) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,179.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `10,12,13,16,19,21,25,54,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=54; inner 0–3 px mean lift over 5–8 px=+44.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (179,179,179) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,179.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `10,12,14,16,19,21,24,55,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=55; inner 0–3 px mean lift over 5–8 px=+44.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (20,20,20) (172,172,172)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (27,27,27) (170,170,170)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (34,34,34) (168,168,168)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (47,47,47) (165,165,165)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (62,62,62) (164,164,164)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (83,83,83) (158,158,158)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (110,110,110) (148,148,148)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (3,3,3) (140,140,140) (120,120,120)
```

## macos27-captures\out\menu-outline\window-contour\dark\black\active

Case: normal titled NSWindow; appearance=dark; background=black; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (1,1,1) (10,10,10)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (3,3,3) (19,19,19) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (4,4,4) (24,24,24) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (3,3,3) (24,24,24) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (1,1,1) (19,19,19) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (10,10,10) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (70,70,70) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (130,130,130) (4,4,4) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (164,164,164) (19,19,19) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (164,164,164) (24,24,24) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (130,130,130) (19,19,19) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(70,70,70) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,60.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,33,239,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=239; inner 0–3 px mean lift over 5–8 px=+5.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,69,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `126,129,132,134,137,140,145,247,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=247; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,70,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (5,5,5) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (14,14,14) (53,53,53) (51,51,51)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (17,17,17) (56,56,56) (48,48,48) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (14,14,14) (56,56,56) (47,47,47) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (5,5,5) (53,53,53) (48,48,48) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (36,36,36) (51,51,51) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (117,117,117) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (198,198,198) (9,9,9) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (227,227,227) (32,32,32) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (227,227,227) (40,40,40) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (197,197,197) (32,32,32) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(117,117,117) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,60.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,33,239,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=239; inner 0–3 px mean lift over 5–8 px=+5.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,69,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `126,129,132,134,137,140,145,247,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=247; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,70,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (5,5,5) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (14,14,14) (53,53,53) (51,51,51)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (17,17,17) (56,56,56) (48,48,48) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (14,14,14) (56,56,56) (47,47,47) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (5,5,5) (53,53,53) (48,48,48) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (36,36,36) (51,51,51) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (117,117,117) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (198,198,198) (9,9,9) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (227,227,227) (32,32,32) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (227,227,227) (40,40,40) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (197,197,197) (32,32,32) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(117,117,117) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\dark\black\inactive

Case: normal titled NSWindow; appearance=dark; background=black; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (1,1,1) (10,10,10)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (3,3,3) (19,19,19) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (4,4,4) (24,24,24) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (3,3,3) (24,24,24) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (1,1,1) (19,19,19) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (10,10,10) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (70,70,70) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (130,130,130) (4,4,4) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (164,164,164) (19,19,19) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (164,164,164) (24,24,24) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (130,130,130) (19,19,19) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(70,70,70) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,49.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `38.0,38.0,38.0,38.0,38.0,38.0,38.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 1/8 ([-1] px; max ΔY=217.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,2`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 686×538; shape box=(23.00,16.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (55,55,55) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,55.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `4,5,7,9,10,13,20,215,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 5 px; α at −1=215; inner 0–3 px mean lift over 5–8 px=+4.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `20,24,28,33,39,43,53,223,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=223; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `54,60,67,71,76,82,90,227,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=227; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `20,24,28,32,38,44,53,223,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=223; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (6,6,6) (35,35,35)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (12,12,12) (49,49,49) (48,48,48)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (15,15,15) (53,53,53) (46,46,46) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (12,12,12) (52,52,52) (45,45,45) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (6,6,6) (50,50,50) (46,46,46) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (33,33,33) (48,48,48) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (122,122,122) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (203,203,203) (10,10,10) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (228,228,228) (34,34,34) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (231,231,231) (44,44,44) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (199,199,199) (32,32,32) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(121,121,121) (11,11,11) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\dark\white\active

Case: normal titled NSWindow; appearance=dark; background=white; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (195,195,195)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (239,239,239) (144,144,144) (38,38,38)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (234,234,234) (115,115,115) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (255,255,255) (239,239,239) (115,115,115) (38,38,38) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (252,252,252) (144,144,144) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (195,195,195) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (185,185,185) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (251,251,251) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (91,91,91) (236,236,236) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (91,91,91) (231,231,231) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (125,125,125) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(185,185,185) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,60.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,33,239,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=239; inner 0–3 px mean lift over 5–8 px=+5.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,69,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `126,129,132,134,137,140,145,247,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=247; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,70,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (5,5,5) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (14,14,14) (53,53,53) (51,51,51)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (17,17,17) (56,56,56) (48,48,48) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (14,14,14) (56,56,56) (47,47,47) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (5,5,5) (53,53,53) (48,48,48) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (36,36,36) (51,51,51) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (15,15,15) (19,19,19) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (11,11,11) (26,26,26) (4,4,4) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (10,10,10) (25,25,25) (9,9,9) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (11,11,11) (25,25,25) (10,10,10) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (26,26,26) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(19,19,19) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (60,60,60) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,60.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,33,239,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=239; inner 0–3 px mean lift over 5–8 px=+5.5 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,69,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `126,129,132,134,137,140,145,247,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=247; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,70,74,77,80,87,243,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=243; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (5,5,5) (36,36,36)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (14,14,14) (53,53,53) (51,51,51)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (17,17,17) (56,56,56) (48,48,48) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (14,14,14) (56,56,56) (47,47,47) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (5,5,5) (53,53,53) (48,48,48) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (36,36,36) (51,51,51) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (15,15,15) (19,19,19) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (11,11,11) (26,26,26) (4,4,4) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (10,10,10) (25,25,25) (9,9,9) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (11,11,11) (25,25,25) (10,10,10) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (26,26,26) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(19,19,19) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\dark\white\inactive

Case: normal titled NSWindow; appearance=dark; background=white; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (195,195,195)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (239,239,239) (144,144,144) (38,38,38)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (234,234,234) (115,115,115) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (255,255,255) (239,239,239) (115,115,115) (38,38,38) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (252,252,252) (144,144,144) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (195,195,195) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (185,185,185) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (251,251,251) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (91,91,91) (236,236,236) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (91,91,91) (231,231,231) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (125,125,125) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(185,185,185) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,49.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (18,18,18) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `38.0,38.0,38.0,38.0,38.0,38.0,38.0,18.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 1/8 ([-1] px; max ΔY=20.0); edge at −1 RGB=(18,18,18), Y=18.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,2`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 686×538; shape box=(23.00,16.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (55,55,55) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,55.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `4,5,7,9,10,13,20,215,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 5 px; α at −1=215; inner 0–3 px mean lift over 5–8 px=+4.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (20,20,20) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,20.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `20,24,28,33,39,43,53,223,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=223; inner 0–3 px mean lift over 5–8 px=+5.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (20,20,20) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,20.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `54,60,67,71,76,82,90,227,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=227; inner 0–3 px mean lift over 5–8 px=+5.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (20,20,20) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,20.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `20,24,28,32,38,44,53,223,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=223; inner 0–3 px mean lift over 5–8 px=+5.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (6,6,6) (35,35,35)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (12,12,12) (49,49,49) (48,48,48)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (15,15,15) (53,53,53) (46,46,46) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (12,12,12) (52,52,52) (45,45,45) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (6,6,6) (50,50,50) (46,46,46) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (33,33,33) (48,48,48) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (12,12,12) (17,17,17) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (9,9,9) (22,22,22) (4,4,4) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (8,8,8) (21,21,21) (7,7,7) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (9,9,9) (20,20,20) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(12,12,12) (21,21,21) (7,7,7) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(17,17,17) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\dark-contrast\black\active

Case: normal titled NSWindow; appearance=dark-contrast; background=black; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (1,1,1) (10,10,10)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (3,3,3) (19,19,19) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (4,4,4) (24,24,24) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (3,3,3) (24,24,24) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (1,1,1) (19,19,19) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (10,10,10) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (39,38,38)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (70,70,70) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (130,130,130) (4,4,4) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (164,164,164) (19,19,19) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (164,164,164) (24,24,24) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (130,130,130) (19,19,19) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(70,70,70) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (81,81,81) (39,38,38) (38,38,38) (38,38,38) (39,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,81.0,38.2,38.0,38.0,38.2,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,30,58,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+10.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,69,74,77,80,84,107,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=107; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `126,129,132,134,137,140,143,159,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=159; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,70,74,77,80,84,108,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=108; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (36,36,36) (87,87,87)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (68,68,68) (88,88,88) (63,63,63)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (73,73,73) (82,82,82) (57,58,58) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (66,66,66) (82,82,82) (55,55,55) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (34,34,34) (87,87,87) (57,57,57) (39,39,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (87,87,87) (63,63,63) (38,38,39) (38,38,38) (38,38,39) (38,39,39)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (183,183,183) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (233,233,233) (26,26,26) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (244,244,244) (79,79,79) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (245,245,245) (91,91,91) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (233,233,233) (78,78,78) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(179,179,179) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (81,81,81) (39,38,38) (38,38,38) (38,38,38) (39,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,81.0,38.2,38.0,38.0,38.2,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,30,58,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+10.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,69,74,77,80,84,107,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=107; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `126,129,132,134,137,140,143,159,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=159; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `64,67,70,74,77,80,84,108,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=108; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (36,36,36) (87,87,87)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (68,68,68) (88,88,88) (63,63,63)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (73,73,73) (82,82,82) (57,58,58) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (66,66,66) (82,82,82) (55,55,55) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (34,34,34) (87,87,87) (57,57,57) (39,39,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (87,87,87) (63,63,63) (38,38,39) (38,38,38) (38,38,39) (38,39,39)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (183,183,183) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (233,233,233) (26,26,26) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (244,244,244) (79,79,79) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (245,245,245) (91,91,91) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (233,233,233) (78,78,78) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(179,179,179) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\dark-contrast\black\inactive

Case: normal titled NSWindow; appearance=dark-contrast; background=black; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (39,39,38) (38,38,39) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,38.0,38.0,38.0,38.0,38.0,38.9,38.1,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=-0.2 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (1,1,1) (10,10,10)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (3,3,3) (20,19,19) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (4,4,4) (24,24,24) (38,38,38) (39,38,38)
(0,0,0) (0,0,0) (0,0,0) (3,3,3) (24,24,24) (38,38,38) (38,38,38) (38,39,38)
(0,0,0) (0,0,0) (1,1,1) (19,19,19) (39,38,38) (39,38,39) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (10,10,10) (38,38,38) (38,38,38) (38,39,38) (38,38,38) (39,38,38)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (70,70,70) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (130,130,130) (4,4,4) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (164,164,164) (19,19,19) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (164,164,164) (24,24,24) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (130,130,130) (19,19,19) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(70,70,70) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,49.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(38,38,38) (39,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `38.0,38.2,38.0,38.0,38.0,38.0,38.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 1/8 ([-1] px; max ΔY=217.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,2`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 686×538; shape box=(23.00,16.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (77,77,77) (38,38,38) (38,38,39) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (39,38,38) (38,38,39)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,77.0,38.0,38.1,38.0,38.0,38.0,38.0,38.2,38.1`; alpha: `4,5,7,9,10,13,17,48,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 5 px; α at −1=48; inner 0–3 px mean lift over 5–8 px=+9.7 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `20,24,28,33,39,43,50,80,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=80; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `54,60,67,71,76,82,87,111,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=111; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `20,24,28,32,38,44,50,80,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=80; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38) (83,83,83)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (62,62,62) (83,83,85) (61,61,61)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (68,68,68) (80,79,79) (55,55,55) (38,38,39)
(0,0,0) (0,0,0) (0,0,0) (62,62,62) (78,78,78) (53,53,53) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (36,36,36) (82,82,82) (55,56,55) (38,38,38) (39,38,38) (38,38,38)
(0,0,0) (0,0,0) (80,80,80) (61,61,61) (39,39,39) (38,38,38) (38,38,38) (38,38,39)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (191,191,191) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (236,236,236) (32,32,32) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (245,245,245) (87,87,87) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (247,247,247) (104,104,104) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (232,232,232) (83,83,83) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(186,186,186) (33,33,33) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\dark-contrast\white\active

Case: normal titled NSWindow; appearance=dark-contrast; background=white; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (195,195,195)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (239,239,239) (144,144,144) (38,38,38)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (234,234,234) (115,115,115) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (255,255,255) (239,239,239) (115,115,115) (38,38,38) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (252,252,252) (144,144,144) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (195,195,195) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (39,38,38)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (185,185,185) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (251,251,251) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (91,91,91) (236,236,236) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (91,91,91) (231,231,231) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (125,125,125) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(185,185,185) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (81,81,81) (38,38,38) (38,38,38) (38,38,38) (39,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,81.0,38.0,38.0,38.0,38.2,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,30,58,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+10.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (51,51,51) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,69,74,77,80,84,107,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=107; inner 0–3 px mean lift over 5–8 px=+12.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (51,51,51) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `126,129,132,134,137,140,143,159,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=159; inner 0–3 px mean lift over 5–8 px=+12.7 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (51,51,51) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,70,74,77,80,84,108,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=108; inner 0–3 px mean lift over 5–8 px=+12.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (36,36,36) (87,87,87)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (68,68,68) (88,88,88) (63,63,63)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (73,73,73) (82,82,82) (57,57,58) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (66,66,66) (82,82,82) (55,55,55) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (34,34,34) (87,87,87) (57,57,57) (39,38,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (87,87,87) (63,63,63) (38,38,38) (38,38,38) (38,38,38) (38,38,38)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (30,30,30) (56,56,56) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (22,22,22) (57,57,57) (16,16,16) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (20,20,20) (51,51,51) (35,35,35) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (22,22,22) (51,51,51) (38,38,38) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(30,30,30) (57,57,57) (34,34,34) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(54,54,54) (15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (81,81,81) (39,38,38) (38,38,38) (38,38,38) (39,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,81.0,38.2,38.0,38.0,38.2,38.0,38.0,38.0,38.0`; alpha: `18,19,21,24,25,27,30,58,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=58; inner 0–3 px mean lift over 5–8 px=+10.8 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (51,51,51) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,69,74,77,80,84,107,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=107; inner 0–3 px mean lift over 5–8 px=+12.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (51,51,51) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `126,129,132,134,137,140,143,159,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=159; inner 0–3 px mean lift over 5–8 px=+12.7 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (51,51,51) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,51.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `64,67,70,74,77,80,84,108,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=108; inner 0–3 px mean lift over 5–8 px=+12.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (36,36,36) (87,87,87)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (68,68,68) (88,88,88) (63,63,63)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (73,73,73) (82,82,82) (57,58,58) (38,38,38)
(0,0,0) (0,0,0) (0,0,0) (66,66,66) (82,82,82) (55,55,55) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (34,34,34) (87,87,87) (57,57,57) (39,39,38) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (87,87,87) (63,63,63) (38,38,39) (38,38,38) (38,38,39) (38,39,39)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (30,30,30) (56,56,56) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (22,22,22) (57,57,57) (16,16,16) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (20,20,20) (51,51,51) (35,35,35) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (22,22,22) (51,51,51) (38,38,38) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(30,30,30) (57,57,57) (34,34,34) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(54,54,54) (15,15,15) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\dark-contrast\white\inactive

Case: normal titled NSWindow; appearance=dark-contrast; background=white; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (39,39,38) (38,38,39) (38,38,38) (38,38,38)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,38.0,38.0,38.0,38.0,38.0,38.9,38.1,38.0,38.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=-0.2 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (252,252,252) (195,195,195)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (239,239,239) (145,144,144) (38,38,38)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (234,234,234) (115,115,115) (38,38,38) (39,38,38)
(255,255,255) (255,255,255) (255,255,255) (239,239,239) (115,115,115) (38,38,38) (38,38,38) (38,39,38)
(255,255,255) (255,255,255) (252,252,252) (144,144,144) (39,38,38) (39,38,39) (38,38,38) (38,38,38)
(255,255,255) (255,255,255) (195,195,195) (38,38,38) (38,38,38) (38,39,38) (38,38,38) (39,38,38)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (185,185,185) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (251,251,251) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (91,91,91) (236,236,236) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (91,91,91) (231,231,231) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (125,125,125) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(185,185,185) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,49.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(38,38,38) (39,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (166,166,166) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `38.0,38.2,38.0,38.0,38.0,38.0,38.0,166.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 1/8 ([-1] px; max ΔY=128.0); edge at −1 RGB=(166,166,166), Y=166.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,2`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 686×538; shape box=(23.00,16.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (77,77,77) (38,38,38) (38,38,39) (38,38,38) (38,38,38) (38,38,38) (38,38,38) (39,38,38) (38,38,39)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,77.0,38.0,38.1,38.0,38.0,38.0,38.0,38.2,38.1`; alpha: `4,5,7,9,10,13,17,48,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 5 px; α at −1=48; inner 0–3 px mean lift over 5–8 px=+9.7 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (46,46,46) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,46.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `20,24,28,33,39,43,50,80,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=80; inner 0–3 px mean lift over 5–8 px=+11.5 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (46,46,46) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,46.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `54,60,67,71,76,82,87,111,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=111; inner 0–3 px mean lift over 5–8 px=+11.5 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (46,46,46) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,46.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `20,24,28,32,38,44,50,80,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=80; inner 0–3 px mean lift over 5–8 px=+11.5 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (38,38,38) (83,83,83)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (62,62,62) (83,83,85) (61,61,61)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (68,68,68) (80,79,79) (55,55,55) (38,38,39)
(0,0,0) (0,0,0) (0,0,0) (62,62,62) (78,78,78) (53,53,53) (38,38,38) (38,38,38)
(0,0,0) (0,0,0) (36,36,36) (82,82,82) (55,56,55) (38,38,38) (39,38,38) (38,38,38)
(0,0,0) (0,0,0) (80,80,80) (61,61,61) (39,39,39) (38,38,38) (38,38,38) (38,38,39)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (1,1,1) (27,27,27) (53,53,53) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (20,20,20) (53,53,53) (19,19,19) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (18,18,18) (47,47,47) (35,35,35) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (20,20,20) (47,47,47) (38,38,38) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(27,27,27) (52,52,52) (34,34,34) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(51,51,51) (18,18,18) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\light\black\active

Case: normal titled NSWindow; appearance=light; background=black; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (4,4,4) (70,70,70)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19) (130,130,130) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (24,24,24) (164,164,164) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (19,19,19) (164,164,164) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (4,4,4) (130,130,130) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (70,70,70) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (70,70,70) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (130,130,130) (4,4,4) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (164,164,164) (19,19,19) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (164,164,164) (24,24,24) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (130,130,130) (19,19,19) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(70,70,70) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,10,12,14,14,16,16,54,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=54; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `36,38,39,42,44,45,48,80,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=80; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `72,73,75,76,78,80,82,109,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=109; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `36,38,39,42,44,46,48,81,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=81; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (34,34,34) (187,187,187)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (79,79,79) (235,235,235) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (94,94,94) (248,248,248) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (77,77,77) (248,248,248) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (34,34,34) (235,235,235) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (187,187,187) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (170,170,170) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (229,229,229) (23,23,23) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (244,244,244) (64,64,64) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (244,244,244) (77,77,77) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (229,229,229) (63,63,63) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(170,170,170) (22,22,22) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,10,12,14,14,16,16,54,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=54; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `36,38,39,42,44,45,48,80,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=80; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `72,73,75,76,78,80,82,109,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=109; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `36,38,39,42,44,46,48,81,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=81; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (34,34,34) (187,187,187)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (79,79,79) (235,235,235) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (94,94,94) (248,248,248) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (77,77,77) (248,248,248) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (34,34,34) (235,235,235) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (187,187,187) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (170,170,170) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (229,229,229) (23,23,23) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (244,244,244) (64,64,64) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (244,244,244) (77,77,77) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (229,229,229) (63,63,63) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(170,170,170) (22,22,22) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\light\black\inactive

Case: normal titled NSWindow; appearance=light; background=black; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (4,4,4) (70,70,70)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19) (130,130,130) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (24,24,24) (164,164,164) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (19,19,19) (164,164,164) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (4,4,4) (130,130,130) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (70,70,70) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (70,70,70) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (130,130,130) (4,4,4) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (164,164,164) (19,19,19) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (164,164,164) (24,24,24) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (130,130,130) (19,19,19) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(70,70,70) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,49.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (229,229,229) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,229.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 1/8 ([-1] px; max ΔY=26.0); edge at −1 RGB=(229,229,229), Y=229.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 686×538; shape box=(23.00,16.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `2,2,3,4,4,7,8,43,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 2 px; α at −1=43; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `9,11,14,16,19,21,24,59,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `26,29,33,35,37,40,42,74,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=74; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,12,13,15,19,21,24,59,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (43,43,43) (194,194,194)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (82,82,82) (238,238,238) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (102,102,102) (248,248,248) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (84,84,84) (248,248,248) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (37,37,37) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (192,192,192) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (182,182,182) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (233,233,233) (29,29,29) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (245,245,245) (73,73,73) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (245,245,245) (92,92,92) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (230,230,230) (70,70,70) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(181,181,181) (32,32,32) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\light\white\active

Case: normal titled NSWindow; appearance=light; background=white; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (185,185,185) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (251,251,251) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (91,91,91) (236,236,236) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (91,91,91) (231,231,231) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (125,125,125) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(185,185,185) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,10,12,14,14,16,16,54,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=54; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `36,38,39,42,44,45,48,80,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=80; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `72,73,75,76,78,80,82,109,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=109; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `36,38,39,42,44,46,48,81,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=81; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (34,34,34) (187,187,187)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (79,79,79) (235,235,235) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (94,94,94) (248,248,248) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (77,77,77) (248,248,248) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (34,34,34) (235,235,235) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (187,187,187) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (15,15,15) (28,28,28) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (11,11,11) (30,30,30) (10,10,10) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (10,10,10) (27,27,27) (18,18,18) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (11,11,11) (27,27,27) (20,20,20) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (30,30,30) (18,18,18) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(28,28,28) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,10,12,14,14,16,16,54,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=54; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `36,38,39,42,44,45,48,80,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=80; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `72,73,75,76,78,80,82,109,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=109; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `36,38,39,42,44,46,48,81,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=81; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (34,34,34) (187,187,187)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (79,79,79) (235,235,235) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (94,94,94) (248,248,248) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (77,77,77) (248,248,248) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (34,34,34) (235,235,235) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (187,187,187) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (15,15,15) (28,28,28) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (11,11,11) (30,30,30) (10,10,10) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (10,10,10) (27,27,27) (18,18,18) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (11,11,11) (27,27,27) (20,20,20) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (30,30,30) (18,18,18) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(28,28,28) (9,9,9) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\light\white\inactive

Case: normal titled NSWindow; appearance=light; background=white; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (185,185,185) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (251,251,251) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (91,91,91) (236,236,236) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (91,91,91) (231,231,231) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (125,125,125) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(185,185,185) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,49.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 1/8 ([-1] px; max ΔY=255.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 686×538; shape box=(23.00,16.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `2,2,3,4,4,7,8,43,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 2 px; α at −1=43; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `9,11,14,16,19,21,24,59,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `26,29,33,35,37,40,42,74,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=74; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (25,25,25) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `10,12,13,15,19,21,24,59,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=59; inner 0–3 px mean lift over 5–8 px=+6.2 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (43,43,43) (194,194,194)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (82,82,82) (238,238,238) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (102,102,102) (248,248,248) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (84,84,84) (248,248,248) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (37,37,37) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (192,192,192) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (15,15,15) (30,30,30) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (11,11,11) (30,30,30) (12,12,12) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (10,10,10) (26,26,26) (21,21,21) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (11,11,11) (27,27,27) (23,23,23) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(15,15,15) (30,30,30) (20,20,20) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(29,29,29) (12,12,12) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\light-contrast\black\active

Case: normal titled NSWindow; appearance=light-contrast; background=black; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (4,4,4) (70,70,70)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19) (130,130,130) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (24,24,24) (164,164,164) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (19,19,19) (164,164,164) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (4,4,4) (130,130,130) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (70,70,70) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (70,70,70) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (130,130,130) (4,4,4) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (164,164,164) (19,19,19) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (164,164,164) (24,24,24) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (130,130,130) (19,19,19) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(70,70,70) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,1,0,1,1,1,1,2,2,3,5,5,6,9,9,12`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=1; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (247,247,247) (239,240,241) (237,238,239) (235,235,239) (235,235,239) (237,238,239)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 686×538; shape box=(23.00,5.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,1,1,2,1,2,2,3,4,4,7`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=1; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,12,13,16,19,21,25,54,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=54; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,12,14,16,19,21,24,55,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=55; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (254,254,254)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (253,253,253)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (250,250,250)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (246,246,246)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (233,233,233)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (208,208,208)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (152,152,152)
```

## macos27-captures\out\menu-outline\window-contour\light-contrast\black\inactive

Case: normal titled NSWindow; appearance=light-contrast; background=black; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (4,4,4) (70,70,70)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (19,19,19) (130,130,130) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (24,24,24) (164,164,164) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (19,19,19) (164,164,164) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (4,4,4) (130,130,130) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (70,70,70) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (70,70,70) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (130,130,130) (4,4,4) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (164,164,164) (19,19,19) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (164,164,164) (24,24,24) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (130,130,130) (19,19,19) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(70,70,70) (4,4,4) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,49.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (89,89,89) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,89.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 1/8 ([-1] px; max ΔY=166.0); edge at −1 RGB=(89,89,89), Y=89.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 686×538; shape box=(23.00,16.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `2,2,3,4,4,7,9,39,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 2 px; α at −1=39; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `9,11,14,16,19,21,25,55,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=55; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `26,29,33,35,37,40,43,70,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=70; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `10,12,13,15,19,21,25,55,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=55; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (128,128,128) (239,239,239)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (188,188,188) (251,251,251) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (201,201,201) (254,254,254) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (189,189,189) (253,253,253) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (121,121,121) (250,250,250) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (239,239,239) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (233,233,233) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (249,249,249) (101,101,101) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (255,255,255) (251,251,251) (167,167,167) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (255,255,255) (253,253,253) (182,182,182) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(255,255,255) (248,248,248) (163,163,163) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(230,230,230) (98,98,98) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## macos27-captures\out\menu-outline\window-contour\light-contrast\white\active

Case: normal titled NSWindow; appearance=light-contrast; background=white; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (185,185,185) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (125,125,125) (251,251,251) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (91,91,91) (236,236,236) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (91,91,91) (231,231,231) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (125,125,125) (236,236,236) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(185,185,185) (251,251,251) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,38.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(255,255,255), Y=255.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,1,0,1,1,1,1,2,2,3,5,5,6,9,9,12`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=1; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(255,255,255) (255,255,255) (247,247,247) (239,240,241) (237,238,239) (235,235,239) (235,235,239) (237,238,239)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 686×538; shape box=(23.00,5.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,1,1,2,1,2,2,3,4,4,7`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=1; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (179,179,179) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,179.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `10,12,13,16,19,21,25,54,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=54; inner 0–3 px mean lift over 5–8 px=+44.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (179,179,179) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,179.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `10,12,14,16,19,21,24,55,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=55; inner 0–3 px mean lift over 5–8 px=+44.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (20,20,20) (172,172,172)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (27,27,27) (170,170,170)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (34,34,34) (168,168,168)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (47,47,47) (165,165,165)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (62,62,62) (164,164,164)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (83,83,83) (158,158,158)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (110,110,110) (148,148,148)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (3,3,3) (140,140,140) (120,120,120)
```

## macos27-captures\out\menu-outline\window-contour\light-contrast\white\inactive

Case: normal titled NSWindow; appearance=light-contrast; background=white; opened=n/a.

Runtime dumps: `runtime.json`.

### normal — display

Image `display.png`: 768×620; shape box=(64.00,64.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(46,46,46) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `46.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 7/8 ([-7, -6, -5, -4, -3, -2, -1] px; max ΔY=16.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `30.0,30.0,30.0,30.0,30.0,30.0,30.0,30.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(30,30,30), Y=30.0; composited; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (33,33,33) (92,92,92)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (47,47,47) (145,145,145) (255,255,255)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (52,52,52) (175,175,175) (255,255,255) (255,255,255)
(30,30,30) (30,30,30) (30,30,30) (47,47,47) (175,175,175) (255,255,255) (255,255,255) (255,255,255)
(30,30,30) (30,30,30) (33,33,33) (145,145,145) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(30,30,30) (30,30,30) (92,92,92) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (22,22,22) (30,30,30) (30,30,30)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (15,15,15) (30,30,30) (30,30,30) (30,30,30)
(0,0,0) (0,0,0) (0,0,0) (11,11,11) (28,28,28) (30,30,30) (30,30,30) (30,30,30)
(0,0,0) (0,0,0) (11,11,11) (27,27,27) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(0,0,0) (15,15,15) (28,28,28) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(22,22,22) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
(30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30) (30,30,30)
```

### normal — single-window

Image `single-window.png`: 752×604; shape box=(56.00,49.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `255.0,255.0,255.0,255.0,255.0,255.0,255.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 1/8 ([-1] px; max ΔY=255.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 0 px; α at −1=0; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=255; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

### normal — cgwindow

Image `cgwindow.png`: 686×538; shape box=(23.00,16.00,640.00,492.00) px.
- top: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0,255.0`; alpha: `2,2,3,4,4,7,9,39,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 2 px; α at −1=39; inner 0–3 px mean lift over 5–8 px=+0.0 Y.
- right: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (179,179,179) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,179.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `9,11,14,16,19,21,25,55,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=55; inner 0–3 px mean lift over 5–8 px=+44.7 Y.
- bottom: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (179,179,179) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,179.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `26,29,33,35,37,40,43,70,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=70; inner 0–3 px mean lift over 5–8 px=+44.7 Y.
- left: RGB distances −8..+8: `(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (179,179,179) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)`; luma: `0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,179.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0`; alpha: `10,12,13,15,19,21,25,55,255,255,255,255,255,255,255,255,255`; outside pixels differing ≥6 luma from the −8 px backdrop sample: 0/8 (none px; max ΔY=0.0); edge at −1 RGB=(0,0,0), Y=0.0; α≥8 reaches 8 px; α at −1=55; inner 0–3 px mean lift over 5–8 px=+44.7 Y.
**top-left 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (128,128,128) (239,239,239)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (188,188,188) (251,251,251) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (201,201,201) (254,254,254) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (0,0,0) (189,189,189) (253,253,253) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (121,121,121) (250,250,250) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
(0,0,0) (0,0,0) (239,239,239) (255,255,255) (255,255,255) (255,255,255) (255,255,255) (255,255,255)
```
**bottom-right 8×8 RGB:**

```text
(0,0,0) (0,0,0) (0,0,0) (3,3,3) (105,105,105) (157,157,157) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (79,79,79) (165,165,165) (86,86,86) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (70,70,70) (155,155,155) (128,128,128) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (79,79,79) (157,157,157) (136,136,136) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(105,105,105) (163,163,163) (126,126,126) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(157,157,157) (84,84,84) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
(0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0) (0,0,0)
```

## Crops

Nearest-neighbour side profile PNGs enlarge each 17-pixel side by 8× and are under `menu-outline-edge-crops/`.

- `menu-outline-edge-crops\menu-outline-step1-dark-black-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-black-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-black-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-black-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-black-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-black-normal-display-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-black-normal-display-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-black-normal-display-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-black-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-black-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-black-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-black-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-black-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-black-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-black-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-black-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-black-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-black-normal-display-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-black-normal-display-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-black-normal-display-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-black-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-black-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-black-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-black-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-white-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-white-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-white-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-white-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-white-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-white-normal-display-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-white-normal-display-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-white-normal-display-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-white-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-white-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-white-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-contrast-white-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-white-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-white-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-white-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-white-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-white-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-white-normal-display-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-white-normal-display-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-white-normal-display-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-white-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-white-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-white-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-dark-white-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-black-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-black-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-black-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-black-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-black-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-black-normal-display-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-black-normal-display-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-black-normal-display-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-black-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-black-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-black-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-black-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-black-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-black-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-black-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-black-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-black-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-black-normal-display-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-black-normal-display-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-black-normal-display-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-black-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-black-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-black-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-black-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-white-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-white-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-white-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-white-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-white-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-white-normal-display-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-white-normal-display-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-white-normal-display-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-white-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-white-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-white-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-contrast-white-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-white-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-white-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-white-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-white-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-white-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-white-normal-display-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-white-normal-display-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-white-normal-display-top-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-white-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-white-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-white-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\menu-outline-step1-light-white-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-popup-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-popup-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-popup-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-popup-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-popup-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-popup-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-popup-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-popup-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-combobox-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-combobox-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-combobox-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-combobox-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-combobox-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-combobox-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-combobox-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-combobox-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-context-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-context-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-context-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-context-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-context-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-context-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-context-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-context-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-context-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-context-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-context-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-context-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-1-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-1-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-1-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-1-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-1-attempt-1-window-1-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-1-attempt-1-window-1-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-1-attempt-1-window-1-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-1-attempt-1-window-1-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-1-attempt-1-window-1-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-1-attempt-1-window-1-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-1-attempt-1-window-1-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-photo-submenu-menu-window-1-attempt-1-window-1-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-popup-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-popup-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-popup-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-popup-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-popup-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-popup-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-popup-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-popup-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-combobox-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-combobox-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-combobox-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-combobox-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-combobox-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-combobox-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-combobox-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-combobox-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-context-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-context-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-context-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-context-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-context-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-context-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-context-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-context-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-context-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-context-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-context-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-context-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-submenu-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-submenu-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-submenu-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-submenu-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-submenu-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-submenu-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-submenu-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-submenu-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-submenu-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-submenu-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-submenu-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-contrast-plain-submenu-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-appkit-popup-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-appkit-popup-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-appkit-popup-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-appkit-popup-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-appkit-popup-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-appkit-popup-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-appkit-popup-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-appkit-popup-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-combobox-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-combobox-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-combobox-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-combobox-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-combobox-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-combobox-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-combobox-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-combobox-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-context-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-context-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-context-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-context-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-context-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-context-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-context-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-context-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-context-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-context-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-context-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-photo-context-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-popup-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-popup-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-popup-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-popup-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-popup-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-popup-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-popup-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-popup-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-pulldown-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-pulldown-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-pulldown-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-pulldown-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-combobox-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-combobox-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-combobox-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-combobox-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-combobox-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-combobox-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-combobox-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-combobox-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-context-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-context-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-context-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-context-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-context-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-context-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-context-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-context-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-context-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-context-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-context-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-context-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-menu-menu-window-0-attempt-2-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-menu-menu-window-0-attempt-2-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-menu-menu-window-0-attempt-2-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-menu-menu-window-0-attempt-2-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-menu-menu-window-0-attempt-2-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-menu-menu-window-0-attempt-2-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-menu-menu-window-0-attempt-2-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-menu-menu-window-0-attempt-2-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-menu-menu-window-0-attempt-2-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-menu-menu-window-0-attempt-2-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-menu-menu-window-0-attempt-2-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-menu-menu-window-0-attempt-2-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-picker-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-picker-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-picker-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-picker-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-picker-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-picker-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-picker-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-dark-plain-swiftui-picker-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-combobox-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-combobox-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-combobox-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-combobox-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-combobox-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-combobox-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-combobox-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-combobox-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-context-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-context-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-context-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-context-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-context-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-context-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-context-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-context-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-context-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-context-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-context-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-context-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-submenu-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-submenu-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-submenu-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-submenu-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-submenu-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-submenu-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-submenu-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-submenu-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-submenu-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-submenu-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-submenu-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-submenu-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-menu-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-menu-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-menu-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-menu-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-menu-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-menu-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-menu-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-menu-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-menu-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-menu-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-menu-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-menu-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-picker-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-picker-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-picker-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-picker-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-picker-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-picker-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-picker-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-photo-swiftui-picker-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-combobox-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-combobox-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-combobox-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-combobox-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-combobox-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-combobox-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-combobox-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-combobox-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-context-menu-window-0-attempt-3-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-context-menu-window-0-attempt-3-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-context-menu-window-0-attempt-3-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-context-menu-window-0-attempt-3-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-context-menu-window-0-attempt-3-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-context-menu-window-0-attempt-3-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-context-menu-window-0-attempt-3-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-context-menu-window-0-attempt-3-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-context-menu-window-0-attempt-3-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-context-menu-window-0-attempt-3-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-context-menu-window-0-attempt-3-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-context-menu-window-0-attempt-3-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-swiftui-picker-menu-window-0-attempt-2-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-swiftui-picker-menu-window-0-attempt-2-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-swiftui-picker-menu-window-0-attempt-2-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-swiftui-picker-menu-window-0-attempt-2-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-swiftui-picker-menu-window-0-attempt-2-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-swiftui-picker-menu-window-0-attempt-2-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-swiftui-picker-menu-window-0-attempt-2-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-swiftui-picker-menu-window-0-attempt-2-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-swiftui-picker-menu-window-0-attempt-2-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-swiftui-picker-menu-window-0-attempt-2-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-swiftui-picker-menu-window-0-attempt-2-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-contrast-plain-swiftui-picker-menu-window-0-attempt-2-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-popup-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-popup-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-popup-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-popup-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-popup-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-popup-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-popup-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-popup-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-popup-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-pulldown-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-pulldown-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-pulldown-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-pulldown-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-appkit-pulldown-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-combobox-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-combobox-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-combobox-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-combobox-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-combobox-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-combobox-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-combobox-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-combobox-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-combobox-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-context-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-context-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-context-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-context-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-context-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-context-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-context-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-context-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-context-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-context-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-context-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-context-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-submenu-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-submenu-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-submenu-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-submenu-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-submenu-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-submenu-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-submenu-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-submenu-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-submenu-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-submenu-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-submenu-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-submenu-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-menu-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-menu-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-menu-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-menu-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-menu-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-menu-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-menu-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-menu-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-menu-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-menu-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-menu-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-menu-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-picker-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-picker-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-picker-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-picker-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-picker-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-picker-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-picker-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-photo-swiftui-picker-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-popup-menu-window-0-attempt-2-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-popup-menu-window-0-attempt-2-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-popup-menu-window-0-attempt-2-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-popup-menu-window-0-attempt-2-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-popup-menu-window-0-attempt-2-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-popup-menu-window-0-attempt-2-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-popup-menu-window-0-attempt-2-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-popup-menu-window-0-attempt-2-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-popup-menu-window-0-attempt-2-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-popup-menu-window-0-attempt-2-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-popup-menu-window-0-attempt-2-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-popup-menu-window-0-attempt-2-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-pulldown-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-pulldown-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-pulldown-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-pulldown-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-appkit-pulldown-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-combobox-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-combobox-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-combobox-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-combobox-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-combobox-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-combobox-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-combobox-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-combobox-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-combobox-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-context-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-context-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-context-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-context-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-context-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-context-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-context-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-context-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-context-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-context-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-context-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-context-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-submenu-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-submenu-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-submenu-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-submenu-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-submenu-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-submenu-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-submenu-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-submenu-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-submenu-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-submenu-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-submenu-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-submenu-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-menu-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-menu-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-menu-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-menu-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-menu-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-menu-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-menu-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-menu-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-menu-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-menu-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-menu-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-menu-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-picker-menu-window-0-attempt-1-display-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-picker-menu-window-0-attempt-1-display-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-picker-menu-window-0-attempt-1-display-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-picker-menu-window-0-attempt-1-display-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-picker-menu-window-0-attempt-1-window-0-cgwindow-top-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-picker-menu-window-0-attempt-1-window-0-single-bottom-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-picker-menu-window-0-attempt-1-window-0-single-left-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-picker-menu-window-0-attempt-1-window-0-single-right-8x.png`
- `menu-outline-edge-crops\menus-light-plain-swiftui-picker-menu-window-0-attempt-1-window-0-single-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-active-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-active-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-active-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-active-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-active-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-active-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-active-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-active-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-active-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-active-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-active-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-active-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-inactive-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-inactive-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-inactive-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-inactive-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-inactive-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-inactive-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-inactive-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-inactive-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-inactive-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-inactive-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-inactive-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-black-inactive-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-active-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-active-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-active-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-active-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-active-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-active-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-active-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-active-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-active-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-active-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-active-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-active-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-inactive-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-inactive-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-inactive-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-inactive-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-inactive-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-inactive-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-inactive-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-inactive-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-inactive-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-inactive-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-inactive-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-black-inactive-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-active-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-active-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-active-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-active-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-active-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-active-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-active-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-active-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-active-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-active-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-active-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-active-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-inactive-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-inactive-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-inactive-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-inactive-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-inactive-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-inactive-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-inactive-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-inactive-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-inactive-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-inactive-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-inactive-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-contrast-white-inactive-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-active-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-active-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-active-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-active-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-active-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-active-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-active-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-active-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-active-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-active-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-active-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-active-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-inactive-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-inactive-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-inactive-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-inactive-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-inactive-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-inactive-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-inactive-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-inactive-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-inactive-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-inactive-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-inactive-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-dark-white-inactive-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-active-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-active-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-active-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-active-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-active-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-active-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-active-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-active-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-active-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-active-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-active-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-active-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-inactive-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-inactive-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-inactive-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-inactive-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-inactive-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-inactive-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-inactive-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-inactive-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-inactive-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-inactive-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-inactive-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-black-inactive-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-active-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-active-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-active-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-active-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-active-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-active-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-active-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-active-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-active-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-active-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-active-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-active-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-inactive-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-inactive-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-inactive-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-inactive-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-inactive-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-inactive-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-inactive-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-inactive-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-inactive-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-inactive-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-inactive-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-black-inactive-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-active-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-active-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-active-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-active-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-active-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-active-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-active-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-active-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-active-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-active-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-active-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-active-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-inactive-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-inactive-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-inactive-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-inactive-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-inactive-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-inactive-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-inactive-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-inactive-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-inactive-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-inactive-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-inactive-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-contrast-white-inactive-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-active-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-active-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-active-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-active-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-active-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-active-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-active-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-active-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-active-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-active-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-active-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-active-normal-single-window-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-inactive-normal-cgwindow-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-inactive-normal-cgwindow-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-inactive-normal-cgwindow-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-inactive-normal-cgwindow-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-inactive-normal-display-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-inactive-normal-display-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-inactive-normal-display-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-inactive-normal-display-top-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-inactive-normal-single-window-bottom-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-inactive-normal-single-window-left-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-inactive-normal-single-window-right-8x.png`
- `menu-outline-edge-crops\window-contour-light-white-inactive-normal-single-window-top-8x.png`
