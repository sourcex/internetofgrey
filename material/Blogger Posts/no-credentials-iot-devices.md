---
title: 'No Credentials IoT Devices'
date: 2017-04-10T14:42:00.000-05:00
draft: true
url: 
---

Today your IoT device should not have any embedded credentials in its firmware.  Nothing for a backdoor, management agent or diagnostics.  The device you ship customers for installation on-site should not contain any credentials.  

  

Simply, if you embed credentials in your firmware, it won't take much work for someone to decompile, run strings against it or even just open it in a hex editor.  At that point, they have credentials that work against all of your devices.  Depending on what you have in your firmware, this is pretty worm-able.

  

I would propose one of two solutions:

*   Develop validation firmware that includes credentials necessary for customer validation and a different firmware for final devices
*   Each device gets unique, non-deterministic credentials (having the password be the serial number is not a good plan here)

There are too many examples where devices have been compromised via embedded credentials.  Learn from the mistakes of others.