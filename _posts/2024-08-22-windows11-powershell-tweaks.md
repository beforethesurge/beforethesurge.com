---
title: Windows 11 - PowerShell Tweaks
categories: [OS,Windows,PowerShell]
---

## Clear Terminal History

**PATH:** `C:\Users\YOURUSERNAME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt`

1. Create PROFILE PATH (reference output of `echo $PROFILE`)
   - Example: `C:\Users\YOURUSERNAME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`
2. Add these commands to the file:

   ```powershell
   Clear-History
   echo "" > C:\Users\YOURUSERNAME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
   ```

3. Save the file and restart the shell
4. Or type:

   ```powershell
   . $PROFILE
   ```

---

## Install WinFetch

- Install WinFetch:

   ```powershell
   Install-Script winfetch
   ```

Source: [WinFetch Installation](https://github.com/lptstr/winfetch/wiki/Installation)

---

## Install Oh-My-Posh

1. Install Oh-My-Posh:

   ```powershell
   winget install JanDeDobbeleer.OhMyPosh -s winget
   ```

2. Install Nerd Font:

   ```powershell
   oh-my-posh font install meslo
   ```

3. Make sure you change the font in terminal settings to MesloLGM Nerd Font
4. Set this to `$PROFILE`:

   ```powershell
   oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
   ```

5. Recommend appending this to the top just in case this messes with anything:

   ```powershell
   . $PROFILE
   ```

Source: [Oh-My-Posh Installation](https://ohmyposh.dev/docs/installation/windows)
