---
title: Windows 11 - Fixes and Tweaks
categories: [OS,Windows]
---

## Ram Clear Cache

1. Create a new shortcut and enter the following path:

    ```c++
    %windir%/system32/rundll32.exe advapi32.dll,ProcessIdleTasks
    ```

## Mini-Tray Clear Duplicates (Batch)

1. Open Command Prompt and type:

    ```c++
    reg.exe delete "HKCU/Control Panel/NotifyIconSettings" /f
    ```

2. You may need to restart Windows Explorer (it should do it automatically).

---

## Spice Fixes (if running with KVM)

1. Download the ISO for [VirtIO](https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md) and run it through **before** fully installing Windows.
2. Tested EXE helps with performance, but most users suggest that Windows might agree with doing it after the installation. Test at your own risk.
3. Install this EXE and reboot:
    - [Windows Spice Guest Tools](https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md)

---

## Set Administrator Active

1. Open Terminal as Administrator.
2. Type:

    ```c++
    net user Administrator /active:yes
    ```

3. To disable, set "yes" to "no".
4. Set password:

    ```c++
    net user administrator *
    ```

---

## Install Software

1. Visit [Ninite](https://ninite.com)
