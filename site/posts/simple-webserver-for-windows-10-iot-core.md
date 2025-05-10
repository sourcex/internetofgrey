---
title: 'Simple Webserver for Windows 10 IoT Core'
date: 2017-11-03T21:02:00.001-05:00
draft: false
url: /2017/11/simple-webserver-for-windows-10-iot-core.html
---

Recently, I needed a small web server for a [project](http://nowmicro.com/Embedded/MP%2FIoTPlayer) I was working on.  I needed to run it in a UWP background task on Windows 10 IoT Core, so my options were a bit limited.  
  
The [ms-iot/samples](https://github.com/ms-iot/samples) repository has quite a few gems.  In particular, the [IoTBlocky Sample](https://github.com/ms-iot/samples/tree/develop/IoTBlockly) has a very basic web server called [SimpleWebServer](https://github.com/ms-iot/samples/blob/develop/IoTBlockly/SimpleWebServer/SimpleWebServer.cs).  I ended up adding some support for parameters, but otherwise was very happy about how fast I got a web server hosted in my code.  
  
The one deficiency is the lack of [SSL support](https://docs.microsoft.com/en-us/windows/uwp/networking/networking-basics):  
  

> A [StreamSocket](https://msdn.microsoft.com/library/windows/apps/br226882) object can be configured to use SSL/TLS for communications between the client and the server. This support for SSL/TLS is limited to using the StreamSocket object as the client in the SSL/TLS negotiation. You cannot use SSL/TLS with the StreamSocket created by a [StreamSocketListener](https://msdn.microsoft.com/library/windows/apps/br226906) when incoming communications are received, because SSL/TLS negotiation as a server is not implemented by the StreamSocket class.

  

I was hoping I was incorrect about this, but I haven't found any evidence to the contrary.  With .NET Standard 2.0, I hope to find something else I can include instead.

  

  

[  
](https://www.blogger.com/null)

[  
](https://www.blogger.com/null)