---
title: 'Meltdown and Spectre - Considerations for Digital Signage/IoT/Embedded Devices'
date: 2018-01-05T10:05:00.001-06:00
draft: false
url: /2018/01/meltdown-and-spectre-considerations-for.html
---

I've been following the Meltdown and Spectre news since last week since it was just vague mentions on lkml and speculation on twitter.  After receiving some questions, I thought I would provide my take on the impact and practical things to mitigate the issues and plan for the future.  
  
Some information/background on the vulnerabilities:  
  

*   [Ars Technica](https://arstechnica.com/gadgets/2018/01/meltdown-and-spectre-heres-what-intel-apple-microsoft-others-are-doing-about-it/)
*   [Google Project Zero](https://googleprojectzero.blogspot.com/2018/01/reading-privileged-memory-with-side.html)
*   [Mozilla](https://blog.mozilla.org/security/2018/01/03/mitigations-landing-new-class-timing-attack/)

Basically, these attacks allow someone running code on a system to access protected memory contents by using timing differences and speculative execution features in a lot of modern processors.

  

  
Digital Signage/IoT/Embedded solutions are somewhat unique in that the application set on on the system is usually well-known and strategically static.  These vulnerabilities require the attacker to be able to run code on your system.  This means the actual risk is low for systems running the majority of content.  The things that change on a solution are typically:  
  

*   Frequent content changes
*   Monthly operating system patches
*   Rare player/CMS updates

  
  
Concrete Things To Do  
  

1.  Turn on automatic patches.  The risk of not being patched is far more than the risk of a patch breaking a system.  Chaining remote execution vulnerabilities with local privilege escalation vulnerabilities is a lot harder if you actually patch things.  Do this first.
2.  Examine your systems for things that run untrusted code.  Thankfully most solutions don't let the user navigate to arbitrary web pages or install applications
3.  Look into Application Binary Whitelisting and Write Filters.  These technologies can prevent untrusted code from being run on the system and allow you to revert back to a known good configuration with a reboot.
4.  Have a response plan.  Do you know who does what and how if you need to mitigate a piece of malware on one or more systems?

Some ruckus has been made about performance impacts recently released patches.  Although some workloads can be impacted it is mostly I/O intensive workloads not typically seen in Digital Signage.  It is also very important to not rely on synthetic benchmarks but your actual workload when judging the performance impact- synthetic benchmarks are going to give you an unrealistic picture.  
  

Overall, the best thing to do right now is to communicate a plan to stakeholders and patch.  Ensuring systems are patching automatically now is the best protection against a "weaponized" version of any malware later.