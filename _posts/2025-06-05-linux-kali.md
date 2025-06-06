---
title: Linux - Kali
categories: [OS,Linux,Kali]
---

## Fix Archive Keyring Change Errors

Occasionally happens whenever Kali has a major update, you'll see some kind of error that about a keyring being outdated or wrong

Can run the below and it should fix the problem:

```bash
wget "https://archive.kali.org/archive-keyring.gpg" && sudo mv /usr/share/keyrings/kali-archive-keyring.gpg && sudo apt update
```

**Note**: Guides online (even from Kali) will point that you should run `wget` with `sudo`. This is _**HIGHLY NOT RECOMMENDED**_ as you should not expose root permissions to the outside if at all possible (this could be that they just haven't updated their forums in a while)

## Sources

[A New Kali Linux Archive Signing Key](https://www.kali.org/blog/new-kali-archive-signing-key/)
