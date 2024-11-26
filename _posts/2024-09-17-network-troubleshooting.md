---
title: Networking - Troubleshooting
categories: [Networking]
---

## Basic Network Troubleshooting for Workstation/Server

*Note* If troubleshooting on server, MAKE SURE YOU HAVE PERMISSION TO REBOOT BEFORE DOING SO (could cause issues with others users being logged into it on RDP and breaking their session or causing them to lose data from a reboot)

1.  **Check Physical Connections**
    - Ensure all cables are securely connected.
    - Verify that the network devices (router, modem, switches) are powered on.

2.  **Restart Devices**
    - Restart the computer.
    - If multiple devices
        - Restart the router and modem by unplugging them for 30 seconds and then plugging them back in.

3.  **Check Network Settings**
    - Ensure the computer is connected to the correct network.
    - Verify that the computer's IP settings are set to obtain an IP address automatically (DHCP).
    - If set to static, ensure IP is specified and is correct for workstation/server

4.  **Run Network Diagnostics**
    - On Windows 11: Go to `Settings` > `System` > `Status` > `Troubleshoot` > `Other Troubleshooters` > `Network and Internet`.
    - On macOS: Go to `System Preferences` > `Network` > `Assist me` > `Diagnostics`.

5.  **Check for IP Address Conflicts**
    - Open Command Prompt (Windows) or Terminal (macOS/Linux).
    - Type `ipconfig` (Windows) or `ifconfig` (macOS/Linux) to check the IP address.
    - Ensure no other device on the network has the same IP address.
    - Reference [IPConfig](https://beforethesurge.github.io/posts/commands-powershell/#ipconfig) for renewing IP for testing

6.  **Update Network Drivers**
    - On Windows: Go to `Device Manager` > `Network adapters` > Right-click the network adapter > `Update driver`.
    - On macOS: Ensure the system is up to date by going to `System Preferences` > `Software Update`.

7.  **Disable/Enable Network Adapter**
    - On Windows: Go to `Control Panel` > `Network and Sharing Center` > `Change adapter settings` > Right-click the network adapter > `Disable`. Wait a few seconds, then right-click again and select `Enable`.
    - On macOS: Go to `System Preferences` > `Network` > Select the network adapter > Click the `-` button to remove it, then click the `+` button to add it back.

8.  **Check for Interference**
    - Ensure there are no physical obstructions or electronic devices causing interference with the Wi-Fi signal.
    - Next step may be a bit more advanced as this is more dealing with 2.4 GHz and 5 GHz frequencies (feel free to skip)
        - Try changing the Wi-Fi channel on the device (Most networks will have a clear distinction for which channel they belong to).
        - Example: Secure (5 GHz), Guest (2.4 GHz); On the SSID could be a clear 2.4 GHz or a "-5" after the name for 5 GHz
        - Note, this may sometimes not be the case, but is common

9.  **Contact ISP**
    - If all else fails, contact the Internet Service Provider (ISP) to check for outages or issues on their end.

#### Bear in mind, these are general tips, not absolutes (be willing to stray off from the exact steps and think outside the box, but it's a good start)
