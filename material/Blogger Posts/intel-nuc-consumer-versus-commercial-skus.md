---
title: 'Intel NUC - Consumer versus Commercial SKUs'
date: 2017-09-12T11:22:00.000-05:00
draft: true
url: 
---

Windows 10 IoT Core has a significantly different way of handling drivers over a traditional Windows OS.  In particular, BSP drivers are compiled into the image during [FFU creation](https://docs.microsoft.com/en-us/windows-hardware/manufacture/iot/iot-core-manufacturing-guide).  
  
If you are [looking to install Windows 10 IoT Core on a different device](https://social.msdn.microsoft.com/Forums/en-US/a8ab0a56-f89b-4d1b-a9d2-690c78444ce1/windows-iot-core-on-intel-stick-wifi-trouble?forum=WindowsIoT) than the FFU was built for, you can install drivers at run time on the device. Early on, while trying to find a [commercial Windows 10 IoT Core platform](http://nowmicroplayers.com/Embedded/MP%2Fiotplayer), I did extensive testing with Intel Compute Sticks and can verify that the Wi-Fi module (Intel AC 7265) in the STK1AW32SC can is fully functional after installing a driver.  
  
Basically, follow these [steps](https://developer.microsoft.com/en-us/windows/iot/samples/driverlab3), but copy the [driver for the device](https://www.intel.com/content/www/us/en/support/articles/000017246/network-and-i-o/wireless-networking.html) from Intel.  You will need a Windows 10 driver (not Windows 7/8.1) and may need to search through the INFs to find the correct device ID.  
  
The command itself is simple-  [Use PowerShell to connect to the device](https://docs.microsoft.com/en-us/windows/iot-core/connect-your-device/powershell), CD to the directory you copied the files to and run:  

> ```
> devcon.exe dp_add DRIVERINF.inf 
> ```

After rebooting, the device will be functional.  So far, I've only used this method for Wi-Fi drivers.  I would not expect all drivers to work, especially if they call APIs not available on Windows 10 IoT Core or install additional components.