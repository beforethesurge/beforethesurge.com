---
title: Windows 11 - WSL
date: 2024-08-30
categories: [WSL]
---

## Disable Windows Commands through WSL Distro

1. Create the following file if not already created:

   ```bash
   sudo nano /etc/wsl.conf
   ```

2. Add the following to `wsl.conf`:

    ```ini
    [interop]
    enabled = false
    appendWindowsPath = false
    ```

3. Restart WSL Distro

    ```powershell
    wsl --shutdown
    ```

## Allow Network Tools (Ping)

```bash
sudo setcap cap_net_raw+p /bin/ping
```

Or you can use:

```bash
sudo chmod u+s /bin/ping
```
