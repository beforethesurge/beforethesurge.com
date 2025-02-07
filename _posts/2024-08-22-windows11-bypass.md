---
title: Windows 11 - Bypass
categories: [OS,Windows]
---

## Format Drive (if unable to find valid Drive/Disk)

1. Open Command Prompt and type:

    ```sh
    diskpart
    list disk
    select disk NUMOFDISK
    ```

    **NOTE: BELOW THIS POINT, THESE COMMANDS WILL WIPE THE CONTENTS OF THE DRIVE**

    ```sh
    clean
    create partition primary
    assign letter=LETTER
    format fs=ntfs quick
    ```

---

## When Choosing Windows 11 Type

1. Press `Shift + F10` to open Command Prompt.
2. Type:

    ```sh
    regedit
    ```

3. Navigate to:

    ```
    HKEY_LOCAL_MACHINE/SYSTEM/SETUP
    ```

4. Create a folder named `LabConfig`.
5. Create DWORD entries for all files and set their values to `1`:
    - `BypassTPMCheck`
    - `BypassRAMCheck`
    - `BypassSecureBootCheck`
6. Exit the Registry Editor.

---

## Bypass Microsoft Account

1. Press `Shift + F10` to open Command Prompt.
2. Type:

    ```sh
    oobe\bypassnro
    ```
