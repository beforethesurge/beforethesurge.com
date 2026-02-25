---
title: Setup WiFi with NetworkManager on Ubuntu Server
date: 2025-12-30
tags:
  - Linux
---

# Setup WiFi with NetworkManager on Ubuntu Server

## Reasoning

If you initially create a headless Ubuntu server, you will be needing to use Netplan

- Problem is, if you want to use NetworkManager, something with Netplan seems to conflict with NetworkManager's connection attempts and will not save the connection when session is terminated
- This means you will need to reconnect every time you lose connection as if you forgot the connection (not sure why this is, but is quite annoying)

## Instructions

Put the below into `/etc/netplan/50-cloud-init.yaml` then you should be able to reconnect to a dropped WiFi without issues:

```yaml
network:
  version: 2
  renderer: NetworkManager
  wifis:
    wlp3s0:
      dhcp4: true
      access-points:
        "yourssid":
          password: "yourwifipassword"
```

Then run the following commands to apply the settings:

```bash
sudo netplan generate
```
```bash
sudo netplan apply
```

## Netplan Method

If you want to keep using Netplan but still having issues, you may need to ensure you have `wpasupplicant` installed, as this has been an issue in the past
