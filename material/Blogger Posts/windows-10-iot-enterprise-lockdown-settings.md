---
title: 'Windows 10 IoT Enterprise Lockdown Settings'
date: 2017-02-15T10:25:00.000-06:00
draft: false
url: /2017/02/windows-10-iot-enterprise-lockdown.html
---

Alternate Title: Learn This Neat Trick to Block Edge Gestures  
  
If you happened to use Windows Embedded 8.1 Industry on a POS/Digital Signage Player/kiosk, you are probably looking for the same features in Windows 10 IoT Enterprise.  
  
[Most](https://technet.microsoft.com/en-us/itpro/windows/manage/lockdown-features-windows-10) made it over.  The biggest change, which I get asked about most, is the Gesture Filter.  With the initial release of Windows 10 IoT Enterprise, there was no way of suppressing the side swipe gestures without terminating explorer.exe.  With 1607, there is a [new policy](https://msdn.microsoft.com/windows/hardware/commercialize/customize/mdm/policy-configuration-service-provider#lockdown-allowedgeswipe) that actually works.  It appears that this policy does not work with Windows 10 Home/Pro, which I typically don't mind because they are just not good for embedded devices.  
  
Since it seems to be hard to find, this is the registry key that corresponds to the policy:  
  

     REG ADD "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows\\EdgeUI” /V  AllowEdgeSwipe /T REG\_DWORD /D 0 /F