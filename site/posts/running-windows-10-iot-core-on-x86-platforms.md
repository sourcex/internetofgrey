---
title: 'Running Windows 10 IoT Core on x86 Platforms'
date: 2017-04-12T09:27:00.001-05:00
draft: true
url: 
---

When [Windows 10 IoT Core](https://developer.microsoft.com/en-us/windows/iot) was first released, there was limited platform choices and no public method for supporting additional systems.  The initial release had one very important limitation on x86 platforms - It required 32-bit UEFI to boot.  The supported x86 platform,  MinnowBoard Max (MBM), is Intel [BayTrail](https://en.wikipedia.org/wiki/List_of_Intel_Atom_microprocessors#.22Bay_Trail-I.22_.2822_nm.29) based, so in theory a 32-bit UEFI BayTrail platform should be at least bootable and partially functional.

  

As an aside, there are supported, commercial Windows 10 IoT Core [devices](http://www.nowmicro.com/Embedded/MP/IoTPlayer).  The information in this post is for those that like to tinker and see what is possible.  I would never rely on this in a production installation.

  

I tested the public MBM firmware on a few systems.  The only one that was fully functional was the first generation Intel Compute Stick (even the Realtek wireless worked).  The second generation stick is Cherry Trail based; you lose accelerated graphics and the wireless adapter needs the driver installed from PowerShell Remote.  I was not able to get this firmware to boot on any [Intel NUC devices](http://www.intel.com/content/www/us/en/nuc/overview.html).  Even devices that have a 32-bit OS selection run afoul of the 32-bit UEFI or a driver incompatibility issue.

  

In early 2016, a 64-bit version of Windows 10 IoT Core was announced, but not released very widely until Anniversary Update.  It is available via OPK to OEMs and via MSDN, but not on the maker-oriented pages, nor as a completed FFU.

  

Assuming you have [access to the packages](https://www.microsoft.com/en-us/download/details.aspx?id=55031) for the 64-bit version, you still need to build the image.  Microsoft eventually published some [useful instructions](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/iot/iot-core-manufacturing-guide) and [iot-adk-addonkit](https://github.com/ms-iot/iot-adk-addonkit), which makes the customization process quite a bit easier than their [previous set](https://blogs.msdn.microsoft.com/iot/2015/12/14/windows-10-iot-core-image-creation/) of instructions.

  

The packages still don't include a wide variety of BSPs for x86 platforms.  You are still limited to BayTrail based platforms, the AU packages only contain 32-bit packages for Apollo Lake.  However, there are a lot of BayTrail based mini-pcs that are inexpensive and can run what is currently available.  These images will also boot in Hyper-V, but will eventually encounter update related issues.

  

Since the maker instructions are for platforms that boot from SD card, one barrier is how to image the devices.  I USB or PXE boot a WinPE image and then use DISM to [apply the image](http://blog.internetofgrey.com/2017/02/deploy-ffu-image-using-dism.html).  You don't need to partition the disk, since the FFU file format includes partitions.

  

  

Overall, I have had quite a bit of fun tinkering and seeing what systems will boot Windows 10 IoT Core.  It's a great OS for building stuff if you already are used to a Microsoft ecosystem.