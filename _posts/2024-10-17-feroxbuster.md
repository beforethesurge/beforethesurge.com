---
title: Feroxbuster
categories: [Ethical Hacking, Recon, Feroxbuster]
---

## Used for Directory Searching with Excluded HTTP Error Codes and Extension File and Outputs to File

```shell
feroxbuster -u http://X.X.X.X -C 400,404,500,502,503 -e ext.txt -o dir.txt
```
