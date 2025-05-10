---
title: 'Adding drivers to Windows 10 IoT Core at Runtime Using Windows Device Portal'
date: 2018-05-11T22:34:00.000-05:00
draft: false
url: /2018/05/adding-drivers-to-windows-10-iot-core.html
---

  

  

While I was compiling some Windows 10 IoT Core 1709 images, I made a small typo in an input file that resulted in one of the BSP drivers not being included in the image.  Instead of compiling the whole thing immediately, I stumbled upon an easy way to add a driver to a compiled image and make sure I had the correct one.

  

1.  Use [inf2cab](https://docs.microsoft.com/en-us/windows-hardware/manufacture/iot/iot-core-adk-addons-command-line-options) from the [iot-adk-addonkit](https://github.com/ms-iot/iot-adk-addonkit) to create a CAB file: inf2cab c:\\temp\\driver\\driver.inf Driver.MyDevice
2.  Navigate to Windows Device Portal | Windows Update
3.  Select "Choose Files", navigate to the CAB and click Install
4.  Reboot

  

[![](https://1.bp.blogspot.com/-DSMxUDkrUPo/WmVk-8B4paI/AAAAAAAADDk/Gf1SJFogoy484scjOCP-sG6ZqpJq_vOLgCLcBGAs/s320/2018-01-21.png)](https://1.bp.blogspot.com/-DSMxUDkrUPo/WmVk-8B4paI/AAAAAAAADDk/Gf1SJFogoy484scjOCP-sG6ZqpJq_vOLgCLcBGAs/s1600/2018-01-21.png)

  
Using this method, it was easy for me to see that I had messed up the input file versus having the incorrect device driver and incorporate a fix into my next set of builds.