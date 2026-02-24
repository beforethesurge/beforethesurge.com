---
title: Commands (CMD, PowerShell)
date: 2024-08-06
categories: [CMD,PowerShell]
---

## Show General System Information (OS, Boot-time, Specs, NIC, Hyper-V Req)

```c++
systeminfo
```

---

## Hostname and Serial Number

**Hostname:** Shows hostname of computer

```c++
hostname
```

**Serial Number:** Shows S/N of computer

```c++
wmic bios get serialnumber
```

---

## Ping

- **Continuous Ping**

  ```c++
  ping –t X.X.X.X
  ```

- **Pull DNS info from Ping** (alternatively, use nslookup)

  ```c++
  ping –a X.X.X.X
  ```

- **Ping a certain amount of packets** (Example: 60 packets [good for flapping alerts])

  ```c++
  ping X.X.X.X –n 60
  ```

---

## Traceroute

- **Normal trace**

  ```c++
  tracert X.X.X.X
  ```

- **If unable to resolve hostname**

  ```c++
  tracert X.X.X.X -d
  ```

---

## Shows Network Drives Connected to User

```c++
net use
```

---

## GPO

- **Shows all Group Policies for computer/user**

  ```c++
  gpresult /r
  ```

- **Update GPO**

  ```c++
  gpupdate /force
  ```

---

## Computer Running Slow - SFC/DISM

- **Note:** To save time (and patience), use this version of these commands

  ```c++
  sfc /scannow & sfc /scannow & DISM /Online /Cleanup-Image /RestoreHealth & sfc /scannow
  ```

  ```powershell
  sfc /scannow; sfc /scannow; DISM /Online /Cleanup-Image /RestoreHealth; sfc /scannow
  ```

  ```c++
  sfc /scannow
  ```

  ```c++
  DISM /Online /Cleanup-Image /CheckHealth
  ```

  ```c++
  DISM /Online /Cleanup-Image /ScanHealth
  ```

  ```c++
  DISM /Online /Cleanup-Image /RestoreHealth
  ```

- **Reboot**

---

## DISM to Free-Up Space in WinSxS

```c++
DISM /online /Cleanup-Image /StartComponentCleanup
```

- **Note:** The above command does not seem to work in Backstage (may be able to test with user-specific session)

---

## IPConfig

- **Wipes DNS Cache in Windows**

  ```c++
  ipconfig /flushdns
  ```

- **Renews IP Address** (Will boot you off if remoted in)

  ```c++
  ipconfig /release & ipconfig /renew
  ```

-**Shows IPv4, IPv6, DNS, etc.**

  ```c++
  ipconfig /all
  ```

---

## Find/Logoff User

```c++
query user
```

```c++
logoff IDOFUSER
```

---

## Find/Reset Password

```c++
query user
```

```c++
net user 'USER' 'PASS'
```

---

## Check for Email Domain on Server (PS)

```powershell
Get-Recipient emailaddress@company.com
```

---

## Backstage Printers (PS)

```powershell
Get-Printer | Format-Table
```

- **If you only need the Name/Driver Name**

  ```powershell
  Get-Printer | Format-Table Name, DriverName
  ```

```powershell
Remove-Printer -Name "NAMEOFPRINTER"
```

```powershell
Get-PrinterDriver
```

```powershell
Remove-PrinterDriver -Name "NAMEOFDRIVER"
```

---

## Check Domain Connection (PS)

```powershell
Test-ComputerSecureChannel -Verbose
```

## Active Directory Password Policy

```powershell
Get-ADDefaultDomainPasswordPolicy
```

---

## Re-Add Computer to Domain (PS)

```powershell
Reset-ComputerMachinePassword -Server {DomainController} -Credential {DomainAdmin}
```

- **Example:**

  ```powershell
  Reset-ComputerMachinePassword -Server lon-dc01 -Credential corp\dsmith
  ```

---

## Check Route Table

```c++
netstat -r
```

---

## Clear ARP Table

```c++
arp -d *
```

- **Can be used to solve connectivity issues internally**

---

## Check Current Running Connections (at current time [will not update unless ran again])

  ```c++
  netstat -ano | findstr "443"
  ```

- **Note:** TCPLogView may be a useful tool for logging data over time

---

## Find & Cycle Network Adapter

- **PowerShell**

  ```powershell
  Get-NetAdapter | format-table
  ```

  ```powershell
  Disable-NetAdapter -Name "<interface>" -Confirm:$false
  ```

  ```powershell
  Enable-NetAdapter -Name "<interface>" -Confirm:$false
  ```

  ```powershell
  Restart-NetAdapter
  ```

- **CMD**

  ```c++
  netsh interface show interface
  ```

  ```c++
  netsh interface set interface INTERFACE disable
  ```

  ```c++
  netsh interface set interface INTERFACE enable
  ```

---

## Find TXT Records of Domain (example is DMARC)

```c++
nslookup -type=txt _dmarc.domain.com
```

- **Note:** This should work for other text records too if you know which one you're looking for

---

## Get Current CPU Percentage (PS)

```powershell
Get-CimInstance -ClassName win32_processor | Measure-Object -Property LoadPercentage –Average
```

---

## Install Appinstaller Package

```powershell
Add-AppxPackage -Appinstaller <path-to-your-appinstaller-file>
```

---

## Sync Changes to Azure

- **This changes for all changed**

  ```powershell
  Start ADSyncSyncCycle
  ```

- **This changes for a specific policy**

  ```powershell
  Start ADSyncSyncCycle –PolicyType delta
  ```

---

## Find FQDN (Fully Qualified Domain Name) of Host (PS)

```powershell
[System.Net.Dns]::GetHostByName($env:COMPUTERNAME).HostName
```

---

## Find File (PS)

```powershell
gci -r -fi '*.EXTENSION'
```

---

## Get and Restart Service (PS)

- **Get Service**

  ```powershell
  Get-Service -Name NAME
  ```

- **Restart Service**

  ```powershell
  Restart-Service NAME
  ```

- **Example: Restart Print Spooler**

  ```powershell
  Restart-Service Spooler
  ```

---

## Test Domain Trust Broker (PS)

```powershell
Test-ComputerSecureChannel -Verbose
```

- **If above is True, everything should be fine | If False, run the below command**

  ```powershell
  Test-ComputerSecureChannel -Repair -Credential (Get-Credential)
  ```

---

## Resync Time

```c++
net stop w32time && w32tm /unregister && w32tm /register && net start w32time && w32tm /resync && tzutil /s "Eastern Standard Time"
```

- **For a list of Time Zones, run:**

  ```c++
  tzutil /l
  ```

---

## Open Network Routing Tables

```c++
route print
```

---

## Remove Folder/Files (PS)

```powershell
Remove-Item FOLDERNAME/FILENAME
```

---

## See Storage Information of a Drive (PS)

```powershell
Get-Volume C
```

- **Can change "C" for other drive letters**

---

## Download File Over HTTP

```powershell
Invoke-WebRequest -Uri "http://example.com/file.zip" -OutFile "C:\\path\\to\\save\\file.zip"
```

## List Environment Variables

```powershell
Get-ChildItem Env:
```
