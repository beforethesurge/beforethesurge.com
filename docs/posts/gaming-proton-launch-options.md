---
title: Proton Launch Options
date: 2026-02-01
tags:
  - Gaming
---

# Proton Launch Options

These are the launch commands I use for gaming on Steam through Proton

1. `DXVK_HUD=full`: Shows FPS, GPU, and other information (useful when coupled with Wayland since Steam's overlay will not work under Wayland to show FPS)
2. `DXVK_FRAME_RATE`: Sets target frame rate to limit (usually better than game-specific frame limiters or vsync)
3. `PROTON_USE_NTSYNC`: Better Linux-to-Windows NT synchronization than `fsync` and `esync` hacks (good for CPU-intensive games)
4. `PROTON_ENABLE_WAYLAND`: Forces game to use Wayland instead of X11
5. `%command%`: Steam environmental value for when the executable should run in the launch option (should usually always be at the end)

`DXVK_HUD=full DXVK_FRAME_RATE=95 PROTON_USE_NTSYNC=1 PROTON_ENABLE_WAYLAND=1 %command%`

## Source:

[ProtonDB Users](https://www.protondb.com/)
