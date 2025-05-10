---
title: 'Managing My Internet of Things with a $5 Digital Ocean VPS and MeshCentral'
date: 2019-02-06T14:24:00.001-06:00
draft: false
url: /2019/02/managing-my-internet-of-things-with-5.html
---

  
  
I have a lot of tiny Windows and Linux device spread about my lab/offices.  I acknowledge my problem with buying a Raspberry Pi every time I go to Micro Center and owning just about every mainstream [SBC](https://www.slant.co/topics/1629/~best-single-board-computers) between tinkering and my day job.  
  
Moving past my personal issues, managing these devices has been a pain in the past, especially when I work from home or am travelling. My solution is to use [Mesh Central](https://www.meshcommander.com/meshcentral2), an [open source](https://github.com/Ylianst/MeshCentral) remote management solution written in NodeJS.  
  
  
Things I love about Mesh Central:  
  

*   It's open source
*   You can stand up an installation in five minutes if you type fast
*   Runs on Linux and Windows
*   Easy to maintain
*   You don't need Intel vPro/AMT to use it, it includes a software agent
*   Software agents for Windows, Linux and OSX 
*   The [documentation](http://info.meshcentral.com/downloads/MeshCentral2/MeshCentral2UserGuide-0.2.1.pdf) is fantastic
*   Features [are being added constantly](https://twitter.com/MeshCentral)

  
Here's a quick rundown of what you need to do to get an instance up and working quickly.  There are also [videos](https://www.youtube.com/watch?v=dtROYareYRI&list=PLWeHC-v5uwvukqwKOj7CyJbq0iNImhCN0) (and the Install Guide linked below) if you want to watch it happen.

  
  

1.  Spin up a $5/month 1GB/25GB Ubuntu 18.04 droplet on Digital Ocean
2.  Follow the [Install Guide](http://info.meshcentral.com/downloads/MeshCentral2/MeshCentral2InstallGuide.pdf) (Ubuntu 18.04).  I would recommend reading the entire section first because there are some installation variations towards the end that you might want to use (Increased Security Installation) and not have to do the install twice.
3.  Setup Let's Encrypt support for a free SSL certificate (see the [User Guide](http://info.meshcentral.com/downloads/MeshCentral2/MeshCentral2UserGuide-0.2.1.pdf))
4.  Create an account and login
5.  Create a Mesh
6.  Download the agent and install it on your things

Some variations for slightly modified use-cases:

*   If you only want to manage things inside your network, it can be installed on a Raspberry Pi!
*   Since the agent requires a single click to install or can be run once- I use it to provide family tech support
*   Since most of my IoT development devices are supported, using the included file manager is an easy way of getting new builds over to the device

  

Some Additional Feature Wishes

*   More embedding/API support (Get a list of devices to integrate it into other stuff I develop/dashboards, let me upload files from my build system)
*   Android Support
*   More information about extending the agent

  

  

[![](https://2.bp.blogspot.com/-u1ixCh_mO8Q/XFs_IeiEuyI/AAAAAAAADO4/y92KMK2nyeEYPOW42n8j-NrIfJAM6twtwCLcBGAs/s320/MeshCentral1.jpg)](https://2.bp.blogspot.com/-u1ixCh_mO8Q/XFs_IeiEuyI/AAAAAAAADO4/y92KMK2nyeEYPOW42n8j-NrIfJAM6twtwCLcBGAs/s1600/MeshCentral1.jpg)

Group your devices and see their status

  

[![](https://1.bp.blogspot.com/-2JX6cgzRAvM/XFs_Io2YcuI/AAAAAAAADO8/pJvf6nKsXF4knEV8SgEvrdR-6swfBbP9wCLcBGAs/s320/MeshCentral2.jpg)](https://1.bp.blogspot.com/-2JX6cgzRAvM/XFs_Io2YcuI/AAAAAAAADO8/pJvf6nKsXF4knEV8SgEvrdR-6swfBbP9wCLcBGAs/s1600/MeshCentral2.jpg)

Managing a Rasperry Pi A+

  

[![](https://1.bp.blogspot.com/-aFP1Hv-iLZk/XFs_JGay9vI/AAAAAAAADPA/7wWkiLSI2dwxmTgsLABQ7NKB3QktTfNzQCLcBGAs/s320/MeshCentral3.jpg)](https://1.bp.blogspot.com/-aFP1Hv-iLZk/XFs_JGay9vI/AAAAAAAADPA/7wWkiLSI2dwxmTgsLABQ7NKB3QktTfNzQCLcBGAs/s1600/MeshCentral3.jpg)

Access a shell on a Raspbian device

  

[![](https://1.bp.blogspot.com/-IYhKp-cWEsk/XFs_JRIxS5I/AAAAAAAADPE/jpjHqDAhlFQeewlcxlq0bmLp4N-jtaD_wCLcBGAs/s320/MeshCentral4.jpg)](https://1.bp.blogspot.com/-IYhKp-cWEsk/XFs_JRIxS5I/AAAAAAAADPE/jpjHqDAhlFQeewlcxlq0bmLp4N-jtaD_wCLcBGAs/s1600/MeshCentral4.jpg)

Built-In file manager

  

[![](https://3.bp.blogspot.com/-HvOvEhotOco/XFs_J0j9upI/AAAAAAAADPI/8kYUTQ6PUh0vcEbpN5I9IiNxVMGkD2hjgCLcBGAs/s320/MeshCentral5.jpg)](https://3.bp.blogspot.com/-HvOvEhotOco/XFs_J0j9upI/AAAAAAAADPI/8kYUTQ6PUh0vcEbpN5I9IiNxVMGkD2hjgCLcBGAs/s1600/MeshCentral5.jpg)

Windows Desktop

  

[![](https://4.bp.blogspot.com/-XZH34aESTAE/XFs_KKfDBhI/AAAAAAAADPM/K5UFHYgF8_oNkdc8N9fv5ABHL7SAHau4wCLcBGAs/s320/MeshCentral6.jpg)](https://4.bp.blogspot.com/-XZH34aESTAE/XFs_KKfDBhI/AAAAAAAADPM/K5UFHYgF8_oNkdc8N9fv5ABHL7SAHau4wCLcBGAs/s1600/MeshCentral6.jpg)

Simple Admin Screen - Running smooth on 1GB RAM

  

  

[![](https://2.bp.blogspot.com/-a0UiSgri9NI/XFs_KuQVrtI/AAAAAAAADPQ/KC9hO9BGZPMXr6rBp9CWxxQFdYSjx5_TQCLcBGAs/s320/MeshCentral7.jpg)](https://2.bp.blogspot.com/-a0UiSgri9NI/XFs_KuQVrtI/AAAAAAAADPQ/KC9hO9BGZPMXr6rBp9CWxxQFdYSjx5_TQCLcBGAs/s1600/MeshCentral7.jpg)

Connect to the hardware KVM on a Intel vPro/AMT system

  

  

[![](https://1.bp.blogspot.com/-wThuFliW_ZU/XFs_K9_BjkI/AAAAAAAADPU/RvHCQqSMVTUebCxly2kLXB1PO0IJiibIwCLcBGAs/s320/MeshCentral8.jpg)](https://1.bp.blogspot.com/-wThuFliW_ZU/XFs_K9_BjkI/AAAAAAAADPU/RvHCQqSMVTUebCxly2kLXB1PO0IJiibIwCLcBGAs/s1600/MeshCentral8.jpg)

Access the device embedded Intel AMT control website

  

  

[![](https://3.bp.blogspot.com/-0WIHMAVCrT0/XFs_LoJD7LI/AAAAAAAADPY/3UAspnLK0Usht1_fihhZfHvYE4LB486VwCLcBGAs/s320/MeshCentral9.jpg)](https://3.bp.blogspot.com/-0WIHMAVCrT0/XFs_LoJD7LI/AAAAAAAADPY/3UAspnLK0Usht1_fihhZfHvYE4LB486VwCLcBGAs/s1600/MeshCentral9.jpg)

See hardware information

  

[![](https://3.bp.blogspot.com/-GoACdXUS5F0/XFs_IZRRFVI/AAAAAAAADO0/fcuSKiQdpxwFI0RI8zcy8Y3RQF8ZC1UhwCLcBGAs/s320/MeshCentral10.jpg)](https://3.bp.blogspot.com/-GoACdXUS5F0/XFs_IZRRFVI/AAAAAAAADO0/fcuSKiQdpxwFI0RI8zcy8Y3RQF8ZC1UhwCLcBGAs/s1600/MeshCentral10.jpg)

Download an agent