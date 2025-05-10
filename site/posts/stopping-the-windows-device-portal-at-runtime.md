---
title: 'Stopping the Windows Device Portal at runtime'
date: 2017-02-18T10:32:00.001-06:00
draft: false
url: /2017/02/stopping-windows-device-portal-at.html
---

In another of my series of "questions I asked in a forum and didn't really find a good answer to", I was looking for a way to stop the Windows Device Portal.  
  
In Windows 10 IoT Core, the Windows Device Portal is a build time feature.  I wanted the option to possible enable it in a production, locked down, device without having the user reimage the device.  
  
The Windows Device Portal is hosted in a Windows Service called WebManagement.  To stop it, run this command:  

> sc.exe stop WebManagement

 Knowing it can be managed via SC, I can set the startup to Manual and only start it when I need it.  I also need to enable a user account to login, since I don't actually have an enabled account on my retail build.