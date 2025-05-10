---
title: 'Capturing a FFU from a Windows 10 IoT Core Device'
date: 2018-05-31T13:07:00.000-05:00
draft: false
url: /2018/05/capturing-ffu-from-windows-10-iot-core.html
---

I would not actually recommend configuring a Windows 10 IoT Core system and then capturing it (you should use the [provided build system](https://github.com/ms-iot/iot-adk-addonkit/blob/master/README.md)), but if you were trying to capture a demo or replicate a problem, there is a way to [capture to a FFU](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/deploy-windows-using-full-flash-update--ffu) as of Windows 10 1709 or later.  
  
The basic version is to boot to WinPE and use DISM to capture to an attached USB stick or mapped network drive.  
  
The addition of the "capture-ffu" switch is where the magic happens:  
  
**DISM.exe /capture-ffu /imagefile=R:\\MyDemoImage.ffu /capturedrive=\\\\.\\PhysicalDrive0**