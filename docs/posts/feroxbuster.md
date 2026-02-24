---
title: Feroxbuster
date: 2024-10-17
categories: [Recon]
---

## Used for Directory Searching Websites

Includes:

- Excluded HTTP Error Codes
- Extension File (will need to point this to one you have)
- Output File
- Proxy (BurpSuite)

```bash
feroxbuster -u http://X.X.X.X -C 400,404,500,502,503 -o dir.txt --proxy "http://127.0.0.1:8080"
```
