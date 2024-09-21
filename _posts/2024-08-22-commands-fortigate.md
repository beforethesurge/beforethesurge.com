---
title: Commands (FortiGate)
categories: [Commands,FortiOS]
---

## Enable/Disable debugging

| Command | Description |
| --- | --- |
| diagnose debug reset | Stop all the prior debugs that were enabled and running in the foreground or background. |
| diagnose debug enable | Start printing debugs in the console. |
| diagnose debug disable | Stop printing debugs in the console. The debugs are still running in the background; use diagnose debug reset to completely stop them. |
| diagnose debug duration 0 | Start debugging for infinite duration. By default, debug is set for 30 minutes. |

---

## System

| Command | Description |
| --- | --- |
| get system status | Show system information. |
| execute time | Show current system time. |
| get system performance status | Show CPU and memory utilization. |
| execute tac report | Execute TAC report used to open a support ticket with Fortinet Support. |
| diagnose sys top {s} {n} {i} | Show a list of the first n processes every s seconds for i iterations. |
| Shift +C | Sort by highest CPU |
| Shift + M | Sort by highest memory |
| diagnose debug crashlog read | Show system and application crashes. |
| diagnose sys process pidof <daemon> | Show PID of the daemon that is running. The names of currently running daemons can be found using diagnose sys top. |
| diagnose sys kill 11 <pid> | Kill the PID with signal 11. |
| diagnose sys session stat | Show session statistics. |
| diagnose sys session exp-stat | Show expectation session statistics. |
| diagnose sys vd list | Show virtual domain information and system statistics. |
| diagnose sys cmdb info | Show information about the latest configuration change performed by the daemon. |
| execute factoryreset [keepvmlicense] | Immediately reset to factory defaults and reboot. If keepvmlicense is specified (VM models only), the VM license is retained after reset. |
| execute factoryreset-shutdown [keepvmlicense] | Immediately reset to factory defaults and shutdown. If keepvmlicense is specified (VM models only), the VM license is retained after reset. |
| execute factoryreset2 [keepvmlicense] | Reset to factory default, except system settings, system interfaces, VDOMs, static routes, and virtual switches. If keepvmlicense is specified (VM models only), the VM license is retained after reset. |
| diagnose debug config-error-log read | Show errors in the configuration file. |
| diagnose snmp ip frags | Show fragmentation and reassembly information. |
| diagnose sys process dump <PID> | Show essential process related information for a particular process PID. |
| diagnose sys process pstack <PID> | Show essential process related information for a particular process PID. |
| diagnose sys process trace <PID> | Show essential process related information for a particular process PID. |
| diagnose sys mpstat {n} | Show CPU usage every n seconds. |
| diagnose hardware sysinfo memory | Show system memory information. |
| diagnose firewall packet distribution | Show packet distribution statistics. |
| execute reboot | Reboot the device. |

---

## Hardware

| Command | Description |
| --- | --- |
| diagnose hardware sysinfo interrupts | Show hardware interrupts statistics. |
| diagnose hardware test suite all | Execute a hardware diagnostic test, also known as an HQIP test. |
| diagnose hardware deviceinfo disk | Show disk information. |
| diagnose sys flash list | Show flash partitions. |
| execute disk list | Show available mounted disks. |
| execute disk format <partition ref> | Format the referenced partition. |
| diagnose disktest device <device> | Execute a disk check to check if disk is faulty. |
| diagnose disktest block <block> | Execute a disk check to check if disk is faulty. |
| diagnose disktest size <mb> | Execute a disk check to check if disk is faulty. |
| diagnose disk test run | Execute a disk check to check if disk is faulty. |
| execute formatlogdisk | Format the log disk. |
| diagnose hardware sysinfo cpu | Show CPU information. |
| diagnose sys modem detect | Detect the modem and start real-time debugging of the modem daemon. |
| diagnose debug application modemd -1 | Start real-time debugging of the modem daemon. |
| diagnose debug enable | Start real-time debugging of the modem daemon. |

---

## FortiGuard

| Command | Description |
| --- | --- |
| diagnose webfilter fortiguard statistics | Show rating cache and daemon statistics. |
| diagnose debug rating | Show web filter rating server information. |
| diagnose debug application update -1 | Start debugging for updated daemon to troubleshoot FortiGuard update issues. |
| diagnose debug enable | Start debugging for updated daemon to troubleshoot FortiGuard update issues. |
| execute update-now | Execute the FortiGuard update manually. |
| diagnose autoupdate status | Show license information. |
| diagnose autoupdate versions | Show license information. |

---

## Session table

| Command | Description |
| --- | --- |
| diagnose sys session filter <filter> | Set session table filters. |
| diagnose sys session filter | Show session filters, if set. |
| diagnose sys session list | Show session table after filtering. |
| diagnose sys session clear | Clear the session table for the specified filter. |
| diagnose firewall iprope list | Show FortiGate’s internal firewall table. |

---

## Network diagnostics

| Command | Description |
| --- | --- |
| execute ping-options {options} | Ping IP address <x.x.x.x> using the specified options. |
| execute ping <x.x.x.x> | Ping IP address <x.x.x.x> using the specified options. |
| execute ssh-options {options} | SSH to IP address <x.x.x.x> using the specified options. |
| execute ssh <x.x.x.x> | SSH to IP address <x.x.x.x> using the specified options. |
| execute traceroute-options {options} | Traceroute IP address <x.x.x.x> using the specified options. |
| execute traceroute <x.x.x.x> | Traceroute IP address <x.x.x.x> using the specified options. |
| get system arp | Show ARP entries. |
| diagnose ip arp list | Show ARP entries. |
| diagnose netlink brctl list | Show the names of all of the switches on the FortiGate. |
| diagnose netlink brctl name host <switch-name> | Show the switching table of the specified switch. |
| get system interface | Show a summary of interface details, including IP address information. |
| get sys interface physical | Show a summary of interface details, including IP address information. |
| diagnose ip address list | Show IP address information. |
| diagnose hardware deviceinfo nic <interface> | Show detailed interface information. |
| get hardware nic <interface> | Show detailed interface information. |
| get sys interface transceiver | Show connected transceivers. |

---

## Packet sniffer

| Command | Description |
| --- | --- |
| diagnose sniffer packet \<interface\> \<'filter'\> \<verbose\> \<count\> \<a\|l\> | Execute the inbuilt packet sniffer, filtered on a particular interface with the specified filter. For more information, see Performing a sniffer trace or packet capture. |

---

## Debug flow

| Command | Description |
| --- | --- |
| diagnose debug reset | Stop all the prior debugs that were enabled and running in the foreground or background. |
| diagnose debug flow filter clear | Clear any IPv4 debug flow filters. |
| diagnose debug flow filter6 clear | Clear any IPv6 debug flow filters. |
| diagnose debug flow filter <filter> | Set a filter for running IPv4 traffic debug flows. |
| diagnose debug flow filter6 <filter> | Set a filter for running IPv6 traffic debug flows. |
| diagnose debug flow show function-name enable | Show the function name of the code that the traffic accesses. |
| diagnose debug flow show iprope enable | Show which internal firewall policy that the traffic is going through. |
| diagnose debug console timestamp enable | Start printing timestamps on debugs. |
| diagnose debug flow trace start <n> | Show n lines of IPv4 debugs. |
| diagnose debug flow trace start6 <n> | Show n lines of IPv6 debugs. |
| diagnose debug enable | Start printing debugs in the console. |

---

## UTM

| Command | Description |
| --- | --- |
| diagnose debug urlfilter <filter> | Start real-time debugging for web filter traffic. |
| diagnose debug application urlfilter -1 | Start real-time debugging for web filter traffic. |
| diagnose debug enable | Start real-time debugging for web filter traffic. |
| diagnose test application urlfilter | List the web filter debug outputs. |
| diagnose test application urlfilter <option> | Show the web filter debug output for the specified option. |
| diagnose debug application dnsproxy -1 | Start real-time debugging for DNS proxy. DNS proxy is responsible for DNS filter, DNS translation, DNS resolution etc. |
| diagnose debug enable | Start real-time debugging for DNS proxy. DNS proxy is responsible for DNS filter, DNS translation, DNS resolution etc. |
| diagnose test application dnsproxy | List the DNS proxy debug outputs. |
| diagnose test application dnsproxy <option> | Show the DNS proxy debug output for the specified option. |
| diagnose ips filter set "host <x.x.x.x> and port <port>" | Start IPS engine debugs for Application Control and IPS Security profile. |
| diagnose ips debug enable all | Start IPS engine debugs for Application Control and IPS Security profile. |
| diagnose debug enable | Start IPS engine debugs for Application Control and IPS Security profile. |
| diagnose ips debug enable av | Start IPS engine debugs for Application Control and IPS Security profile. |
| diagnose ips debug status show

## Source
* [FortiGate - CLI Cheat Sheet](https://docs.fortinet.com/document/fortigate/7.4.0/cli-troubleshooting-cheat-sheet/420966/cli-troubleshooting-cheat-sheet)
