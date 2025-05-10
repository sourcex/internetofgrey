---
title: 'Deploy a FFU Image using DISM'
date: 2017-02-06T08:31:00.000-06:00
draft: false
url: /2017/02/deploy-ffu-image-using-dism.html
---

Run the following command to get a list of disks on the system:  
     wmic diskdrive list brief'  
  
To apply the image to the disk run:  
     DISM /Apply-Image /ImageFile:.\\flash.ffu /ApplyDrive:\\\\.\\PhysicalDrive0 /SkipPlatformCheck  
  
Where .\\flash.ffu is the FFU in the current directory and PhysicalDrive0 is the drive you identified in via wmic.  Be careful, you can reimage your USB boot media using this method without warning.