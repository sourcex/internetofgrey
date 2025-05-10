---
title: 'Diving In - Windows 10 IoT Core for Digital Signage - Part 1, Explore'
date: 2018-06-12T14:56:00.005-05:00
draft: false
url: /2018/06/diving-in-windows-10-iot-core-for.html
---

  

Diving In - Windows 10 IoT Core for Digital Signage - Part 1, Explore
---------------------------------------------------------------------

  

Exploring a new technology stack can be really hard when you are just getting started.  However, it isn't unusual to just need a push in the right direction to start.  Based on customer questions and some common themes I see in the community, I thought I'd write up a short guide for exploring Windows 10 IoT Core, a lightweight purpose built OS for applications that blend the line between traditional embedded and general purpose computing systems.  
  
  
  

#### Why Windows 10 IoT Core?

I've written a lot about [Windows 10 IoT Core](https://developer.microsoft.com/en-us/windows/iot), [Now Micro IoT Player](https://nowmicroplayers.com/Solutions/IoTPlayer) and even made a [few videos](https://www.youtube.com/channel/UCSEYHVPkIOYPN06j2j5MNcw/videos) if you want to get the [30 min version](https://www.youtube.com/watch?v=81dRviZQxs4).  
  

*   A streamlined, purpose built version of Windows for running UWP apps and easy to cloud enable
*   Secure by default and regularly patched
*   Available on supportable, commercial grade hardware

#### Prerequisites:

[![](https://1.bp.blogspot.com/-G7kOXCJICsY/WxmIQZd9ZKI/AAAAAAAADJ8/IlHYECEvt_8DKisD3yiuzfK1syWMpvesACLcBGAs/s320/pineapple-supply-co-244487.jpg)](https://1.bp.blogspot.com/-G7kOXCJICsY/WxmIQZd9ZKI/AAAAAAAADJ8/IlHYECEvt_8DKisD3yiuzfK1syWMpvesACLcBGAs/s1600/pineapple-supply-co-244487.jpg)2.  A UWP app you want to run.  Start with a [sample](https://github.com/Microsoft/Windows-iotcore-samples) if you don't have a universal app.  Or [Now Micro Player](https://nowmicroplayers.com/Solutions/IoTPlayer) if you just want to run some HTML5 content.
3.  A device-  The Raspberry Pi doesn't have hardware accelerated video, but is a great exploratory device.  If you are building a commercial product, be sure to understand your case, certification, display resolution and cost requirements.
4.  [Windows 10 IoT Core Dashboard](https://docs.microsoft.com/en-us/windows/iot-core/connect-your-device/iotdashboard) - This makes finding your device's IP and some other tasks easier. The Windows 10 IoT Core Dashboard also will download and image SD cards for your Raspberry Pi.

#### Things to Explore

1.  Remote PowerShell - PowerShell is my favorite way to automate a job away and there are a t[on of commands](https://docs.microsoft.com/en-us/windows/iot-core/manage-your-device/commandlineutils) you can run on the system.
2.  Windows Device Portal - In place of a local GUI, use [Windows Device Portal](https://docs.microsoft.com/en-us/windows/iot-core/manage-your-device/deviceportal) to manage the device.  The CPU and GPU performance graphs are the best way to figure out if you have enough hardware for the job.
3.  Windows 10 IoT Dashboard - If you have a bunch of devices, this is the easiest way to discover them.
4.  Azure IoT Central - A SaaS management solution for IoT that is a quick setup.

  

[Part 2 - Commercialization](https://blog.internetofgrey.com/2018/06/diving-in-windows-10-iot-core-for_7.html)