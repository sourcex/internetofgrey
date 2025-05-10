---
title: 'Diving In - Windows 10 IoT Core for Digital Signage - Part 2, Do'
date: 2018-06-12T14:57:00.002-05:00
draft: false
url: /2018/06/diving-in-windows-10-iot-core-for_12.html
---

  

Diving In - Windows 10 IoT Core for Digital Signage - Part 2, Do
----------------------------------------------------------------

  
In [Part 1](https://blog.internetofgrey.com/2018/06/diving-in-windows-10-iot-core-for.html), we looked at why you might use Windows 10 IoT Core and started exploring the platform.  
  
There are plenty of [awesome things you could build](https://www.hackster.io/microsoft/products/windows-10-iot-core) with an Windows 10 IoT Core device.  If this is a hobby, a solution to to internal/personal problem or a point solution at work, you probably don't need to create a commercial device.  
  

[![](https://3.bp.blogspot.com/-wCd5GARXjXc/WxmeolsFRsI/AAAAAAAADKI/EFLcz-0Rd6wwkoyxkX-rhlmrx3ZSNE_qwCLcBGAs/s400/yvette-de-wit-118721.jpg)](https://3.bp.blogspot.com/-wCd5GARXjXc/WxmeolsFRsI/AAAAAAAADKI/EFLcz-0Rd6wwkoyxkX-rhlmrx3ZSNE_qwCLcBGAs/s1600/yvette-de-wit-118721.jpg)

  
  
However, if you want to bring your solution to market-  
  

1.  Publish your app on the Windows Store. [Export a package](https://docs.microsoft.com/en-us/windows/iot-core/commercialize-your-device/installingandservicing)
2.  Find a device.  Commercial devices tend to be more expensive than a Raspberry Pi, but there are some advantages

1.  Warehousing, logistics, assembly and imaging
2.  Warranty and support
3.  Certifications and other material required for some environments/countries
4.  Roadmaps and supply chain predictability
5.  Some OEMs will even build images as part of a hardware partnership

4.  [Build an image](https://docs.microsoft.com/en-us/windows-hardware/manufacture/iot/iot-core-manufacturing-guide).  Ask yourself some questions:

1.  What's your risk appetite for updates?
2.  What does the out of box experience look like?
3.  Do you need remote management?
4.  Will the user be able to reimage or recover the OS on the device?
5.  How will settings management be performed?

6.  Making products is hard. There's always a million little details, so don't forget to [draw the rest of the owl](https://www.reddit.com/r/pics/comments/d3zhx/how_to_draw_an_owl/)

Even if I didn't work for an OEM, I would recommend finding an OEM partner that could help shepherd this process and provide pre-existing pieces for as much as possible.  The overall point is for you to work on all the pieces that make your solution a unique entry into the market without the hardware/OS/configuration/logistics/cat herding getting in the way.