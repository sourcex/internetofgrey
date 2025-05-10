---
title: 'Windows 10 IoT Core - Initiating Recovery Via Recovery Partition'
date: 2018-08-24T10:38:00.000-05:00
draft: false
url: /2018/08/windows-10-iot-core-initiating-recovery.html
---

[Windows 10 IoT Core](https://nowmicroplayers.com/blog/intro-to-windows-iot-core) images can be built to include a [recovery partition](https://docs.microsoft.com/en-us/windows/iot-core/build-your-image/addrecovery).  This can be useful for restoring the device to a working state without having the user reimage the device (which can be especially difficult with a [Dragonboard 410c](https://developer.qualcomm.com/hardware/dragonboard-410c) or similar Qualcomm Snapdragon 410 based device).  
  
Our clue for initiating it yourself is [buried](https://github.com/ms-iot/iot-adk-addonkit/blob/master/Common/ProdPackages/Recovery.WinPE/startrecovery.cmd) in the [iot-adk-addonkit](https://github.com/ms-iot/iot-adk-addonkit) (or bcdedit if you are really bored):  
  

> bcdedit /set {bootmgr} bootsequence {a5935ff2-32ba-4617-bf36-5ac314b3f9bf}  
> shutdown /r /t 0

You can initiate this by using the [Windows.System.ProcessLauncher API](https://github.com/Microsoft/Windows-iotcore-samples/blob/55bd183b8fd704b1bce3ffd8f5d6d805b3eec70f/Samples/ExternalProcessLauncher/CS/README.md).

  

I've also initiated the process by interrupting power to the device three times in a row during startup.  In a perfect world, you would use a companion app or hardware button to initiate a restore as well.