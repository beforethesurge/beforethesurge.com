---
title: Linux - Blackscreen
categories: [OS,Linux]
---

## If you run into suspend/sleep/black screen issues

### Set to Startup:
```bash
xset dpms 0 0 0 && xset s noblank && xset s off
```

---

### Disable 'splash' on GRUB:
Navigate to `/etc/default/grub`
Remove `splash` from:
```bash
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```
Reboot

---

### IF RUNNING LINUX MINT ONLY (Need to test this)
Navigate to `/etc/xdg/autostart/cinnamon-settings-daemon-screensaver-proxy.desktop`
Edit `NoDisplay=true` to `NoDisplay=false`
