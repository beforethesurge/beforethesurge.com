---
title: Windows 11 - Fixes and Tweaks
date: 2024-08-22
tags:
  - Windows
---

## Ram Clear Cache

1. Create a new shortcut and enter the following path:

    ```batch
    %windir%\\system32\\rundll32.exe advapi32.dll,ProcessIdleTasks
    ```

## Mini-Tray Clear Duplicates (Batch)

1. Open Command Prompt and type:

    ```batch
    reg.exe delete "HKCU\\Control Panel\\NotifyIconSettings" /f
    ```

2. You may need to restart Windows Explorer (it should do it automatically).

---

## Set Administrator Active

1. Open Terminal as Administrator.
2. Type:

    ```batch
    net user Administrator /active:yes
    ```

3. To disable, set "yes" to "no".
4. Set password:

    ```batch
    net user administrator *
    ```

---

## Install Software

1. Visit [Ninite](https://ninite.com)
