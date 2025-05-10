---
title: 'Implementing Intel vPro - Past the Marketing'
date: 2017-04-25T13:39:00.002-05:00
draft: true
url: 
---

  
At some point, running an [IBackground Task](https://developer.microsoft.com/en-us/windows/iot/docs/backgroundapplications) based project just stopped working on my development machines.  You can use these on an IoT Core device to provide background service like functionality.  In my case, the Now Micro Agent provides [Azure IoT Hub](https://docs.microsoft.com/en-us/azure/iot-hub/), device management and other services on the [Now Micro IoT Player](http://www.nowmicro.com/Embedded/MP/IoTPlayer).  
  
Turns out, you can enabled debugging these by following some [instructions](https://developer.microsoft.com/en-us/windows/iot/docs/embeddedmode).  It does involve needing ICD, but otherwise is a simple fix.