---
title: Nmap
date: 2024-08-22
tags:
  - Recon
---

## Common Commands

### Initial Network Scan

Real World Environment Scan (less noisy):

```bash
nmap -T1 -A -v -Pn -oN nmap.txt X.X.X.X
```

Lab Environment Scan (very noisy):

```bash
nmap -T5 -A -v -Pn -oN nmap.txt X.X.X.X
```

### Vulnerability Script Scan

Vulnerability Scan on Target:

```bash
nmap -Pn --script vuln X.X.X.X
```

### Usage & Flags

---
>[!example]- Target Specification
>>[!info]- Scan a single IP
>>**└──> `nmap 192.168.1.1`**
>
>
>>[!info]- Scan specific IPs
>>**└─> `nmap 192.168.1.1 192.168.2.1`**
>
>>[!info]- Scan a range
>>**└─> `nmap 192.168.1.1-254`**
>
>>[!info]- Scan a domain
>>**└─> `nmap scanme.nmap.org`**
>
>>[!info]- Scan using CIDR notation
>>**└─> `nmap 192.168.1.0/24`**
>
>>[!info]- Scan targets from a file
>>**├─> `-iL`**
>>**└──> `nmap -iL targets.txt`**
>
>>[!info]- Scan 100 random hosts
>>**├─> `-iR`**
>>**└──> `nmap -iR 100`**
>
>>[!info]- Exclude listed hosts
>>**├─> `-exclude`**
>>**└──> `nmap -exclude 192.168.1.1`**

>[!example]- Nmap Scan Techniques
>> [!info]- TCP SYN port scan (Default)
>>**┌─> `-sS`**
>>**└──> `nmap 192.168.1.1 -sS`**
>
>>[!info]- TCP connect port scan (Default without root privilege)
>>**┌─> `-sT`**
>>**└──> `nmap 192.168.1.1 -sT`**
>
>>[!info]- UDP port scan
>>**┌─> `-sU`**
>>**└──> `nmap 192.168.1.1 -sU`**
>
>>[!info]- TCP ACK port scan
>>**┌─> `-sA`**
>>**└──> `nmap 192.168.1.1 -sA`**
>
>>[!info]- TCP Window port scan
>>**┌─> `-sW`**
>>**└──> `nmap 192.168.1.1 -sW`**
>
>>[!info]- TCP Maimon port scan
>>**┌─> `-sM`**
>>**└──> `nmap 192.168.1.1 -sM`**

> [!example]- Host Discovery
>>[!info]- No Scan. List targets only
>>**┌─>** `-sL`
>>**└──>** `nmap 192.168.1.1-3 -sL`
>
>>[!info]- Disable port scanning. Host discovery only.
>>**┌─>** `-sn`
>>**└──>** `nmap 192.168.1.1/24 -sn
>
>>[!info]- Disable host discovery. Port scan only.
>>**┌─>** `-Pn`
>>**└──>** `nmap 192.168.1.1-5 -Pn`
>
>> [!info]- TCP SYN discovery on port x. Port 80 by default
>>**┌─>** `-PS`
>>**└──>**`nmap 192.168.1.1-5 -PS22-25,80`
>
>>[!info]- TCP ACK discovery on port x. Port 80 by default
>>**┌─>** `-PA`
>>**└──>** `nmap 192.168.1.1-5 -PA22-25,80`
>
>>[!info]- UDP discovery on port x. Port 40125 by default
>>**┌─>** `-PU`
>>**└──>** `nmap 192.168.1.1-5 -PU53`
>
>>[!info]- ARP discovery on local network
>>**┌─>** `-PR`
>>**└──>** `nmap 192.168.1.1-1/24 -PR`
>
>>[!info]- Never do DNS resolution
>>**┌─>** `-n`
>>**└──>** `nmap 192.168.1.1 -n`

>[!example]- Port Specification
>> [!info]- Port scan for port x
>>**┌─>** `-p`
>>**└──>**`nmap 192.168.1.1 -p 21`
>
>>[!info]- Port range
>>**┌─>** `-p`
>>**└──>** `nmap 192.168.1.1 -p 21-100`
>
>> [!info]- Port scan multiple TCP and UDP ports
>>**┌─>** `-p`
>>**└──>** `nmap 192.168.1.1 -p U:53,T:21-25,80`
>
>>[!info]- Port scan all ports
>>**┌─>** `-p`
>>**└──>**`nmap 192.168.1.1 -p-`
>
>>[!info]- Port scan from service name
>>**┌─>** `-p`
>>**└──>** `nmap 192.168.1.1 -p http,https`
>
>>[!info]- Fast port scan (100 ports)
>>**┌─>** `-F`
>>**└──>** `nmap 192.168.1.1 -F`
>
>>[!info]- Port scan the top x ports
>>**┌─>** `-top-ports`
>>**└──>** `nmap 192.168.1.1 -top-ports 2000`
>
>>[!info]- Leaving off initial port in range makes the scan start at port 1
>>**┌─>** `-p-65535`
>>**└──>** `nmap 192.168.1.1 -p-65535`
>
>>[!info]- Leaving off end port in range makes the scan go through to port 65535
>>**┌─>** `-p0-`
>>**└──>** `nmap 192.168.1.1 -p0-`

>[!example]- Service and Version Detection
>>[!info]- Attempts to determine the version of the service running on port
>>**┌─>**  `-sV`
>>**└──>** `nmap 192.168.1.1 -sV`
>
>>[!info]- Intensity level 0 to 9. Higher number increases possibility of correctness
>>**┌─>**  `-sV -version-intensity`
>>**└──>** `nmap 192.168.1.1 -sV -version-intensity 8`
>
>>[!info]- Enable light mode. Lower possibility of correctness. Faster
>>**┌─>**  `-sV -version-light`
>>**└──>** `nmap 192.168.1.1 -sV -version-light`
>
>>[!info]- Enable intensity level 9. Higher possibility of correctness. Slower
>>**┌─>**  `-sV -version-all`
>>**└──>** `nmap 192.168.1.1 -sV -version-all`
>
>>[!info]- Enables OS detection, version detection, script scanning, and traceroute
>>**┌─>** `-A`
>>**└──>**`nmap 192.168.1.1 -A`

>[!example]- OS Detection
>>[!info]- Remote OS detection using TCP/IP stack fingerprinting
>>**┌─>** `-O`
>>**└──>** `nmap 192.168.1.1 -O`
>
>>[!info]- If at least one open and one closed TCP port are not found it will not try OS detection against host
>>**┌─>** `-O -osscan-limit`
>>**└──>** `nmap 192.168.1.1 -O -osscan-limit`
>
>>[!info]- Makes Nmap guess more aggressively
>>**┌─>** `-O -osscan-guess`
>>**└──>** `nmap 192.168.1.1 -O -osscan-guess`
>
>>[!info]- Set the maximum number x of OS detection tries against a target
>>**┌─>** `-O -max-os-tries`
>>**└──>** `nmap 192.168.1.1 -O -max-os-tries 1`
>
>>[!info]- Enables OS detection, version detection, script scanning, and traceroute
>>**┌─>** `-A`
>>**└──>** `nmap 192.168.1.1 -A`

>[!example]- Timing and Performance
>>[!info]- Paranoid (0) Intrusion Detection System evasion
>>**┌─>** `-T0`
>>**└──>** `nmap 192.168.1.1 -T0`
>
>>[!info]- Sneaky (1) Intrusion Detection System evasion
>>**┌─>** `-T1`
>>**└──>** `nmap 192.168.1.1 -T1`
>
>>[!info]- Polite (2) slows down the scan to use less bandwidth and use less target machine resources
>>**┌─>** `-T2`
>>**└──>** `n>>map 192.168.1.1 -T2`
>
>>[!info]- Normal (3) which is default speed
>>**┌─>** `-T3`
>>**└──>** `nmap 192.168.1.1 -T3`
>
 >>[!info]- Aggressive (4) speeds scans; assumes you are on a reasonably fast and reliable network
>>**┌─>** `-T4`
>>**└──>** `nmap 192.168.1.1 -T4`
>
>>[!info]- Insane (5) speeds scan; assumes you are on an extraordinarily fast network
>>**┌─>** `-T5`
>>**└──>** `nmap 192.168.1.1 -T5`

>[!example]- Timing and Performance Switches
>>[!info]- Give up on target after this long
>>**┌─>** `-host-timeout`
>>**├──>** `1s; 4m; 2h`
>>**└───>**`nmap -host-timeout 4m`
>
>>[!info]- Specifies probe round trip time
>>**┌─>** `-min-rtt-timeout` / `max-rtt-timeout` / `initial-rtt-timeout`
>>**├──>** `1s; 4m; 2h`
>>**└───>** `nmap -min-rtt-timeout 1s`
>
>>[!info]- Parallel host scan group sizes
>>**┌─>** `-min-hostgroup` / `max-hostgroup`
>>**├──>** `50; 1024`
>>**└───>** `nmap -min-hostgroup 50`
>
>>[!info]- Probe parallelization
>>**┌─>** `-min-parallelism` / `max-parallelism`
>>**├──>** `10; 1`
>>**└───>**  `nmap -min-parallelism 10`
>
>>[!info]- Specify the maximum number of port scan probe retransmissions
>>**┌─>** `-max-retries`
>>**├──>** `3`
>>**└───>** `nmap -max-retries 3`
>
>>[!info]- Send packets no slower than per second
>>**┌─>** `-min-rate`
>>**├──>** `100`
>>**└───>** `nmap -min-rate 100`
>
>>[!info]- Send packets no faster than per second
>>**┌─>** `-max-rate`
>>**├──>** `100`
>>**└───>** `nmap -max-rate 100`

>[!example]- NSE Scripts
>>[!info]- Scan with default NSE scripts. Considered useful for discovery and safe
>>**┌─>** `-sC`
>>**└──>** `nmap 192.168.1.1 -sC`
>
>>[!info]- Scan with default NSE scripts. Considered useful for discovery and safe
>>**┌─>** `-script default`
>>**└──>** `nmap 192.168.1.1 -script default`
>
>>[!info]- Scan with a single script. Example banner
>>**┌─>** `-script`
>>**└──>** `nmap 192.168.1.1 -script=banner`
>
>>[!info]- Scan with a wildcard. Example http
>>**┌─>** `-script`
>>**└──>** `nmap 192.168.1.1 -script=http*`
>
>>[!info]- Scan with two scripts. Example http and banner
>>**┌─>** `-script`
>>**└──>** `nmap 192.168.1.1 -script=http,banner`
>
>>[!info]- Scan default, but remove intrusive scripts
>>**┌─>** `-script`
>>**└──>** `nmap 192.168.1.1 -script "not intrusive"`
>
>>[!info]- NSE script with arguments
>>**┌─>** `-script-args`
>>**└───>** `nmap -script snmp-sysdescr -script-args snmpcommunity=admin 192.168.1.1`

>[!example]- Useful NSE Script Examples
>>[!info]- Http site map generator
>>**└─>** `nmap -Pn -script=http-sitemap-generator scanme.nmap.org`
>
>>[!info]- Fast search for random web servers
>>**└─>** `nmap -n -Pn -p 80 -open -sV -vvv -script banner,http-title -iR 1000`
>
>>[!info]- Brute forces DNS hostnames guessing subdomains
>>**└─>** `nmap -Pn -script=dns-brute domain.com`
>
>>[!info]- Safe SMB scripts to run
>>**└─>** `nmap -n -Pn -vv -O -sV -script smb-enum,smb-ls,smb-mbenum,smb-os-discovery,smb-s,smb-vuln,smbv2 -vv 192.168.1.1`
>
>>[!info]- Whois query
>>**└─>** `nmap -script whois* domain.com`
>
>>[!info]- Detect cross site scripting vulnerabilities
>>**└─>** `nmap -p80 -script http-unsafe-output-escaping scanme.nmap.org`
>
>>[!info]- Check for SQL injections
>>**└─>** `nmap -p80 -script http-sql-injection scanme.nmap.org`

>[!example]- Firewall / IDS Evasion and Spoofing
>
>>[!info]- Requested scan (including ping scans) use tiny fragmented IP packets.  Harder for packet filters
>>**┌─>** `-f`
>>**└──>** `nmap 192.168.1.1 -f`
>
>>[!info]- Set your own offset size
>>**┌─>** `-mtu`
>>**└──>** `nmap 192.168.1.1 -mtu 32`
>
>>[!info]-  Send scans from spoofed IPs
>>**┌─>** `-D`
>>**└──>** `nmap -D 192.168.1.101,192.168.1.102,192.168.1.103,192.168.1.23 192.168.1.1`
>>
>>>[!tip]- Explained
>>>`nmap -D decoy-ip1,decoy-ip2,your-own-ip,decoy-ip3,decoy-ip4 remote-host-ip`
>
>>[!info]- Scan Facebook from Microsoft (-e eth0 -Pn may be required)
>>**┌─>** `-S`
>>**└──>** `nmap -S www.microsoft.com www.facebook.com`
>
>>[!info]- Use given source port number
>>**┌─>** `-g`
>>**└──>** `nmap -g 53 192.168.1.1`
>
>>[!info]- Relay connections through HTTP/SOCKS4 proxies
>>**┌─>** `-proxies`
>>**└──>** `nmap -proxies http://192.168.1.1:8080, http://192.168.1.2:8080 192.168.1.1`
>
>>[!info]- Appends random data to sent packets
>>**┌─>** `-data-length`
>>**└──>** `nmap -data-length 200 192.168.1.1`
>
Example of IDS Evasion command :
>
>```
>
nmap -f -t 0 -n -Pn --data-length 200 -D  
192.168.1.101,192.168.1.102,192.168.1.103,192.168.1.23 192.168.1.1
>
>```

>[!example]- Output
>>[!info]- Normal output to the file normal.file
>>**┌─>** `-oN`
>>**└──>** `nmap 192.168.1.1 -oN normal.file`
>
>>[!info]- XML output to the file xml.file
>>**┌─>** `-oX`
>>**└──>** `nmap 192.168.1.1 -oX xml.file`
>
>>[!info]- Grepable output to the file grep.file
>>**┌─>** `-oG`
>>**└──>** `nmap 192.168.1.1 -oG grep.file`
>
>>[!info]- Output in the three major formats at once
>>**┌─>** `-oA`
>>**└──>** `nmap 192.168.1.1 -oA results`
>
>>[!info]- Grepable output to screen. -oN -, -oX - also usable
>>**┌─>** `-oG -`
>>**└──>** `nmap 192.168.1.1 -oG -`
>
>>[!info]- Append a scan to a previous scan file
>>**┌─>** `-append-output`
>>**└──>** `nmap 192.168.1.1 -oN file.file -append-output`
>
>>[!info]- Increase the verbosity level (use -vv or more for greater effect)
>>**┌─>** `-v`
>>**└──>** `nmap 192.168.1.1 -v`
>
>>[!info]- Increase debugging level (use -dd or more for greater effect)
>>**┌─>** `-d`
>>**└──>** `nmap 192.168.1.1 -d`
>
>>[!info]- Display the reason a port is in a particular state, same output as -vv
>>**┌─>** `-reason`
>>**└──>** `nmap 192.168.1.1 -reason`
>
>>[!info]- Only show open (or possibly open) ports
>>**┌─>** `-open`
>>**└──>** `nmap 192.168.1.1 -open`
>
>>[!info]- Show all packets sent and received
>>**┌─>** `-packet-trace`
>>**└──>** `nmap 192.168.1.1 -T4 -packet-trace`
>
>>[!info]- Shows the host interfaces and routes
>>**┌─>** `-iflist`
>>**└──>** `nmap -iflist`
>
>>[!info]- Resume a scan
>>**┌─>** `-resume`
>>**└──>** `nmap -resume results.file`

>[!example]- Helpful Nmap Output examples
>>[!info]- Scan for web servers and grep to show which IPs are running web servers
>>**└─>** `nmap -p80 -sV -oG - -open 192.168.1.1/24 | grep open`
>
>>[!info]- Generate a list of the IPs of live hosts
>>**└─>** `nmap -iR 10 -n -oX out.xml | grep "Nmap" | cut -d " " -f5  > live-hosts.txt`
>
>>[!info]- Append IP to the list of live hosts
>>**└─>** `nmap -iR 10 -n -oX out2.xml | grep "Nmap" | cut -d " " -f5 >> live-hosts.txt`
>
>>[!info]- Compare output from nmap using the ndif
>>**└─>** `ndiff scanl.xml scan2.xml`
>
>>[!info]- Convert nmap xml files to html files
>>**└─>** `xsltproc nmap.xml -o nmap.html`
>
>>[!info]- Reverse sorted list of how often ports turn up
>>**└─>** `grep " open " results.nmap | sed -r 's/ +/ /g' | sort | uniq -c | sort -rn | less`

>[!example]- Miscellaneous Nmap Flags
>>[!info]- Enable IPv6 scanning
>>**┌─>**`-6`
>>**└──>** `nmap -6 2607:f0d0:1002:51::4`
>
>>[!info]- nmap help screen
>>**┌─>** `-h`
>>**└──>** `nmap -h`

>[!example]- Other Useful Nmap Commands
>>[!info]- Discovery only on ports x, no port scan
>>**└─>** `nmap -iR 10 -PS22-25,80,113,1050,35000 -v -sn`
>
>>[!info]- ARP discovery only on local network, no port scan
>>**└─>** `nmap 192.168.1.1-1/24 -PR -sn -vv`
>
>>[!info]- Traceroute to random targets, no port scan
>>**└─>** `nmap -iR 10 -sn -traceroute`
>
>>[!info]- Query the Internal DNS for hosts, list targets only
>>**└─>** `nmap 192.168.1.1-50 -sL -dns-server 192.168.1.1`
>
>>[!info]- Show the details of the packets that are sent and received during a scan and capture the traffic
>>**└─>** `nmap 192.168.1.1 --packet-trace`
