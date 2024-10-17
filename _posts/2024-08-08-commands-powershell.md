---
title: Commands (PowerShell)
categories: [Commands,PowerShell]
---

## Show General System Information (OS, Boot-time, Specs, NIC, Hyper-V Req)
```powershell
systeminfo
```

---

## Hostname and Serial Number
**Hostname:** Shows hostname of computer
```powershell
hostname
```
**Serial Number:** Shows S/N of computer
```powershell
wmic bios get serialnumber
```

---

## Ping
* **Continuous Ping**
  ```powershell
  ping –t X.X.X.X
  ```
* **Pull DNS info from Ping** (alternatively, use nslookup)
  ```powershell
  ping –a X.X.X.X
  ```
* **Ping a certain amount of packets** (Example: 60 packets [good for flapping alerts])
  ```powershell
  ping X.X.X.X –n 60
  ```

---

## Traceroute
* **Normal trace**
  ```powershell
  tracert X.X.X.X
  ```
* **If unable to resolve hostname**
  ```powershell
  tracert X.X.X.X -d
  ```

---

## Shows Network Drives Connected to User
```powershell
net use
```

---

## GPO
* **Shows all Group Policies for computer/user**
  ```powershell
  gpresult /r
  ```
* **Update GPO**
  ```powershell
  gpupdate /force
  ```

---

## Computer Running Slow - SFC/DISM
* **Note:** To save time (and patience), use this version of these commands
  ```powershell
  sfc /scannow & sfc /scannow & DISM /Online /Cleanup-Image /RestoreHealth & sfc /scannow
  ```
  ```powershell
  sfc /scannow; sfc /scannow; DISM /Online /Cleanup-Image /RestoreHealth; sfc /scannow
  ```
  ```powershell
  sfc /scannow
  ```
  ```powershell
  DISM /Online /Cleanup-Image /CheckHealth
  ```
  ```powershell
  DISM /Online /Cleanup-Image /ScanHealth
  ```
  ```powershell
  DISM /Online /Cleanup-Image /RestoreHealth
  ```
* **Reboot**

---

## DISM to Free-Up Space in WinSxS
```powershell
DISM /online /Cleanup-Image /StartComponentCleanup
```
* **Note:** The above command does not seem to work in Backstage (may be able to test with user-specific session)

---

## IPConfig
* **Wipes DNS Cache in Windows**
  ```powershell
  ipconfig /flushdns
  ```
* **Renews IP Address** (Will boot you off if remoted in)
  ```powershell
  ipconfig /release & ipconfig /renew
  ```
* **Shows IPv4, IPv6, DNS, etc.**
  ```powershell
  ipconfig /all
  ```

---

## Find/Logoff User
```powershell
query user
```
```powershell
logoff IDOFUSER
```

---

## Find/Reset Password
```powershell
query user
```
```powershell
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
* **If you only need the Name/Driver Name**
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

---

## Re-Add Computer to Domain (PS)
```powershell
Reset-ComputerMachinePassword -Server {DomainController} -Credential {DomainAdmin}
```
* **Example:**
  ```powershell
  Reset-ComputerMachinePassword -Server lon-dc01 -Credential corp\dsmith
  ```

---

## Check Route Table
```powershell
netstat -r
```
* **Cisco/Possibly Fortinet?**
  ```shell
  show ip route
  ```
  ```shell
  get router info routing-table all
  ```

---

## Clear ARP Table
```powershell
arp -d *
```
* **Can be used to solve connectivity issues internally**

---

## Check Current Running Connections (at current time [will not update unless ran again])
* **Windows**
  ```powershell
  netstat -ano | findstr "443"
  ```
* **Linux**
  ```bash
  netstat -ano | grep "443"
  ```
* **Note:** TCPLogView may be a useful tool for logging data over time

---

## Find & Cycle Network Adapter
* **PowerShell**
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
* **CMD**
  ```powershell
  netsh interface show interface
  ```
  ```powershell
  netsh interface set interface INTERFACE disable
  ```
  ```powershell
  netsh interface set interface INTERFACE enable
  ```

---

## Find TXT Records of Domain (example is DMARC)
```powershell
nslookup -type=txt _dmarc.domain.com
```
* **Note:** This should work for other text records too if you know which one you're looking for

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
* **This changes for all changed**
  ```powershell
  Start ADSyncSyncCycle
  ```
* **This changes for a specific policy**
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
* **Get Service**
  ```powershell
  Get-Service -Name NAME
  ```
* **Restart Service**
  ```powershell
  Restart-Service NAME
  ```
* **Example: Restart Print Spooler**
  ```powershell
  Restart-Service Spooler
  ```

---

## Test Domain Trust Broker (PS)
```powershell
Test-ComputerSecureChannel -Verbose
```
* **If above is True, everything should be fine | If False, run the below command**
  ```powershell
  Test-ComputerSecureChannel -Repair -Credential (Get-Credential)
  ```

---

## Resync Time
```powershell
net stop w32time && w32tm /unregister && w32tm /register && net start w32time && w32tm /resync && tzutil /s "Eastern Standard Time"
```
* **For a list of Time Zones, run:**
  ```powershell
  tzutil /l
  ```

---

## Open Network Routing Tables
```powershell
route print
```

---

## Remove Folder/Files (PS)
```powershell
Remove-Item FOLDERNAME
```
* **Alias if used to Linux/BASH for deleting folder with items still inside**
  ```bash
  rm -rfo
  ```
  * **-rfo = Recursively run through folder (childed contents inside folder) and Force this command to run under -o = Path to file/folder**

---

## See Storage Information of a Drive (PS)
```powershell
Get-Volume C
```
* **Can change "C" for other drive letters**

---

## Download File Over HTTP
```powershell
# Source file location
$source = "http://example.com/file.zip"

# Destination to save the file
$destination = "C:\\path\\to\\save\\file.zip"

# Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
```
