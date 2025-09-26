---
title: Disable Pipewire in Favor of Pulseaudio
date: 2025-08-14
categories: [Audio]
---

I have ran into several issues with crackling/popping noises with pipewire for a while

Found a way online on how to mask it in favor of using pulseaudio (which still isn't dead yet, because it just works)

```bash
systemctl --user mask pipewire.service pipewire.socket wireplumber.service pipewire-pulse.service pipewire-pulse.socket wireplumber.service
systemctl --user unmask pulseaudio pulseaudio.service pulseaudio.socket
```

If the above does not work, make sure the following packages are installed:

```bash
sudo apt install pulseaudio-module-bluetooth pulseaudio-utils pavucontrol
```

If you wish to revert the changes made in the first command, you can simply run the inverse below:

```bash
systemctl --user unmask pipewire.service pipewire.socket wireplumber.service pipewire-pulse.service pipewire-pulse.socket wireplumber.service
systemctl --user mask pulseaudio pulseaudio.service pulseaudio.socket
```
