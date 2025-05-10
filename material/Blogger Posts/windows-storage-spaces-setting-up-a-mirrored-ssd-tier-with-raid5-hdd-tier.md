---
title: 'Windows Storage Spaces - Setting Up a Mirrored SSD Tier with RAID5 HDD Tier'
date: 2018-08-23T13:09:00.000-05:00
draft: false
url: /2018/08/windows-storage-spaces-setting-up.html
---

[Storage Spaces](https://docs.microsoft.com/en-us/windows-server/storage/storage-spaces/overview) is a great improvement over the baseline software RAID functionality built into Windows.  The ability to have a SSD cache tier as well as full management via PowerShell only sweeten the deal.

  

I use it on my lab VM host which mostly does compiling of OS images and shuttling files back and forth to work.  My existing setup was a mirrored 1TB SSD cache tier with 6 x 3TB HDD tier.  I wanted to try keeping the SSD tier mirrored, but move the HDD tier to RAID5.

  

Long story short, the performance is pretty terrible for what I do, but I wanted to write a blog post for anyone looking to do this for their own purposes.  I suspect a larger SSD cache might make a difference, but I'm also certain the performance characteristics are good enough for a fancy Plex server or other less write intensive application.

  

Here's the PowerShell to set it up (change the size values for your array.  You might have to guess a bit):

  

> > Get-StorageTier | Remove-StorageTier #Delete existing tiers if you have tried this 23939 times.
> 
> > New-StorageTier -StoragePoolFriendlyName StoragePool -FriendlyName SSD\_Tier -MediaType SSD -ResiliencySettingName Mirror
> 
> > New-StorageTier -StoragePoolFriendlyName StoragePool -FriendlyName HDD\_Tier -MediaType HDD -ResiliencySettingName Parity
> 
> > $ssd\_tier = Get-StorageTier -FriendlyName SSD\_Tier
> 
> > $hdd\_tier = Get-StorageTier -FriendlyName HDD\_Tier
> 
> > New-VirtualDisk -StoragePoolFriendlyName StoragePool -FriendlyName "VirtualDisk" -StorageTiers @($ssd\_tier,$hdd\_tier) -StorageTierSizes 400GB, 13000GB -WriteCacheSize 50GB