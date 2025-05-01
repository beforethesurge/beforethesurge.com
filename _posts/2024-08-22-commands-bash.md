---
title: Commands (Bash)
categories: [Commands,Bash]
---

## Add i386 Architecture for steam-installer (If required)

```bash
sudo dpkg --add-architecture i386
```

- **Note:** Make sure you update after change. This also needs to have contrib repo added to `/etc/apt/sources.list` (can also add non-free).

---

## Redshift (Screen Dim)

```bash
redshift -O 3500K -r -P
```

- Install QRedshift to avoid this issue if applicable.

---

## Enable Virtual Network for virt-manager

```bash
sudo virsh net-start default
```

---

## Reboot/Shutdown Systemd Commands

### Reboot

```bash
systemctl restart
```

### Shutdown

```bash
systemctl poweroff
```

---

## Pull Systems Information

```bash
LANG=C inxi -Fxxxrzc0 --usb
```

---

## Find errors with journalctl

```bash
journalctl -p err
```

---

## Change Shell

```bash
chsh -s $(which zsh)
```

**Verify:**

```bash
echo $SHELL
```

---

## Create Symlink File

```bash
ln -s PATHTOFILETOLINK PATHTOSAVELINK
```

---

## Tar Decompression

```bash
tar -xzvf archive.tar.gz -C PATHTODIRECTORY
```

---

## Chaining Grep

```bash
grep -e bash -e rc
```

- Works like an AND/OR search
- Finds folders/files that have "bash", "rc" and "bashrc" in it

---

## Check Current Running Connections (at current time [will not update unless ran again])

```bash
netstat -ano | grep "443"
```
