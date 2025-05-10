---
title: 'HTTP 502.5 When Deploying ASP.NET Core Site to AWS EBS'
date: 2018-05-17T17:38:00.002-05:00
draft: false
url: /2018/05/http-5025-when-deploying-aspnet-core.html
---

I recently had a fun time diagnosing a weird deployment error in the following environment:  
  

*   ASP.NET Core 2.0 site hosted on AWS EBS
*   VS 2017
*   IIS 10.0 running on 64-bit Windows Server 2016/1.2.0

After deployment, the site fails to load with a "HTTP Error 502.5 - Process Failure.  When retrieving logs from EBS, we see an error when starting the site:

  
  

[![](https://4.bp.blogspot.com/-Yd5soIPDFVw/Wv4Stjq3LZI/AAAAAAAADI8/G2wxKbQyK7s4YxNTRi03Q4qxp_oAczdHgCEwYBhgL/s320/HTTP502.5.PNG)](https://4.bp.blogspot.com/-Yd5soIPDFVw/Wv4Stjq3LZI/AAAAAAAADI8/G2wxKbQyK7s4YxNTRi03Q4qxp_oAczdHgCEwYBhgL/s1600/HTTP502.5.PNG)

  

> ```
> Error 0:(0) IIS AspNetCore Module - Application 'MACHINE/WEBROOT/APPHOST/DEFAULT WEB SITE' with physical root 'C:\\inetpub\\AspNetCoreWebApps\\app\\' failed to start process with commandline 'dotnet .\\MYAPP.dll', ErrorCode = '0x80004005 : 8000808c.
> 
> ```
> 
>   

  
In the end, the fix was simple:  Downgrade the "Microsoft.AspNetCore.All" nuget package to the last version.  
  
I believe what is happening here is AWS doesn't have the newest version of the .NET Core runtime and is failing because of it.  I believe you could also fix this by installing the correct version of the runtime on the EBS instance or specifying a runtime in the csproj.  
  
In the past, a new deployment into a fresh EBS application has also fixed the issue, but did not in this instance.  
  
**Addendum**: If you are having this issue on your local box, install the [version of the SDK](https://www.microsoft.com/net/download/all) that the project requires.  You may need to install the 1.0 or 1.1 SDK for example.