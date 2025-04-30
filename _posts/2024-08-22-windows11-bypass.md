---
title: Windows 11 - Bypass
categories: [OS,Windows]
---

## Format Drive (if unable to find valid Drive/Disk)

1. Open Command Prompt and type:

    ```c++
    diskpart
    list disk
    select disk NUMOFDISK
    ```

    **NOTE: BELOW THIS POINT, THESE COMMANDS WILL WIPE THE CONTENTS OF THE DRIVE**

    ```c++
    clean
    create partition primary
    assign letter=LETTER
    format fs=ntfs quick
    ```

---

## When Choosing Windows 11 Type

1. Press `Shift + F10` to open Command Prompt.
2. Type:

    ```c++
    regedit
    ```

3. Navigate to `HKEY_LOCAL_MACHINE/SYSTEM/SETUP`

4. Create a folder named `LabConfig`.

5. Create DWORD entries for all files and set their values to `1`:
    - `BypassTPMCheck`
    - `BypassRAMCheck`
    - `BypassSecureBootCheck`
6. Exit the Registry Editor.

---

## Bypass Microsoft Account

**Note**: Since Microsoft patched this out in KB5054687, see below for current working method (credit to *the-P1neapple*)

~~1. Press `Shift + F10` to open Command Prompt.~~

~~2. Type:~~

    ```c++
    oobe\bypassnro
    ```

---

1. Press `Shift + F10` or `Ctrl + Shift + J` to open console
2. Type:

```c++
start ms-cxh:localonly
```

Or:

```c++
WinJS.Application.restart("ms-cxh://LOCALONLY")
```

## Source

- [the-P1neapple - WinJS-Microsoft-Account-Bypass](https://github.com/the-P1neapple/WinJS-Microsoft-Account-Bypass)
