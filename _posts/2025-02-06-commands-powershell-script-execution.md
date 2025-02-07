---
title: Powershell - Get/Set-ExecutionPolicy
categories: [Commands,PowerShell]
---

```powershell
Get-ExecutionPolicy -List
```

- Lists current ExecutionPolicy settings

```powershell
Set-ExecutionPolicy Undefined -Scope LocalMachine
```

- Sets ExecutionPolicy to **Undefined**

## Policies

### AllSigned

- Scripts can run.
- Requires that all scripts and configuration files be signed by a trusted publisher, including scripts that you write on the local computer.
- Prompts you before running scripts from publishers that you haven't yet classified as trusted or untrusted.
- Risks running signed, but malicious, scripts.

### Bypass

- Nothing is blocked and there are no warnings or prompts.
- This execution policy is designed for configurations in which a PowerShell script is built into a larger application or for configurations in which PowerShell is the foundation for a program that has its own security model.

### Default

- Sets the default execution policy.
- Restricted for Windows clients.
- RemoteSigned for Windows servers.

### RemoteSigned

- The default execution policy for Windows server computers.
- Scripts can run.
- Requires a digital signature from a trusted publisher on scripts and configuration files that are downloaded from the internet which includes email and instant messaging programs.
- Doesn't require digital signatures on scripts that are written on the local computer and not downloaded from the internet.
- Runs scripts that are downloaded from the internet and not signed, if the scripts are unblocked, such as by using the Unblock-File cmdlet.
- Risks running unsigned scripts from sources other than the internet and signed scripts that could be malicious.

### Restricted

- The default execution policy for Windows client computers.
- Permits individual commands, but does not allow scripts.
- Prevents running of all script files, including formatting and configuration files (.ps1xml), module script files (.psm1), and PowerShell profiles (.ps1).

### Undefined

- There is no execution policy set in the current scope.
- If the execution policy in all scopes is Undefined, the effective execution policy is Restricted for Windows clients and RemoteSigned for Windows Server.

### Unrestricted

- The default execution policy for non-Windows computers and cannot be changed.
- Unsigned scripts can run. There is a risk of running malicious scripts.
- Warns the user before running scripts and configuration files that are not from the local intranet zone.

## Scope

### MachinePolicy

- Set by a Group Policy for all users of the computer

### UserPolicy

- Set by a Group Policy for the current user of the computer

### Process

- Affects only the current PowerShell session
- Saved in `$env:PSExecutionPolicyPreference`, rather than registry

### LocalMachine

- Default scope that affects all users of the computer
- Written to registry hive `HKEY_LOCAL_MACHINE`

### CurrentUser

- Affects only the current user
- Written to registry hive `HKEY_LOCAL_USER`

## Sources

[Set-ExecutionPolicy | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.5)
