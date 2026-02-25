---
title: Linux - Remove Snap
date: 2025-06-05
tags:
  - Linux
---

This is more of personal preference as I don't like the performance of `snap`, and most applications I need can be found in `flatpak/flathub`.

Remove currently installed `snap` packages (user-input required, as wildcard won't work and will throw errors):

```bash
snap list
sudo snap remove <package-name>
```

- Once you're done removing all packages, remove `snap` files from `apt` and halt it from ever being installed as a dependency of another package:

```bash
sudo apt autoremove --purge snapd
sudo apt-mark hold snapd
```

## Sources

[How to remove snapd from Ubuntu](https://www.simplified.guide/ubuntu/remove-snapd)
