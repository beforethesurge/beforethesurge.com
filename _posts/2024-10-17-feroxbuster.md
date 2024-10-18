---
title: Feroxbuster
categories: [Ethical Hacking, Recon, Feroxbuster]
---

## Used for Directory Searching Websites
Includes:
- Excluded HTTP Error Codes
- Extension File (will need to point this to one you have)
- Output File
- Proxy (BurpSuite)

```bash
feroxbuster -u http://X.X.X.X -C 400,404,500,502,503 -e ext.txt -o dir.txt -proxy "http://127.0.0.1:8080"
```
