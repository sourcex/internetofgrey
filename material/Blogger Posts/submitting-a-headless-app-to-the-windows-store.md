---
title: 'Submitting a Headless App to the Windows Store'
date: 2017-02-17T15:08:00.000-06:00
draft: false
url: /2017/02/submitting-headless-app-to-windows-store.html
---

I recently ran across an [issue](https://social.msdn.microsoft.com/Forums/en-US/1a380177-2e9c-48ee-994b-240fd22dc502/submitting-a-headless-app-to-the-universal-store?forum=WindowsIoT#30aa125d-2f3b-4055-b990-15279fc7f65f) when submitting a headless app for Windows 10 IoT Core to the Windows Store.  
  
Basically, you have to include a dummy UWP app in the solution so you can pass the automated Store checks.  In my case, I was greeted with a nice message:  
  
"An executable image named '<APPNAME>.winmd could not be found in <C:\\Projects\\<APPNAME>\\obj\\x86\\Release\\ilc\\in".  
  
Posting in forums didn't come up with anything, so I ended up opening a support incident, which yielded a simple workaround:  
  

Add the EXE to a folder in the solution and it will build (instead of at the root like the [instructions](https://developer.microsoft.com/en-us/windows/iot/docs/store) state).

In the Package.appxmanifest, ensure you specify the folder in the Application node:

```
 <Application  Id\="App"  Executable\="EXE\\DummyApp.exe"  EntryPoint\="DummyApp.App"\>
```  

In my case, the blank UWP app is in a folder named "EXE".  I also specified "Copy to Output Directory" as "Copy Always"  
  
**Update**:  I figured I should post a little bit more context.  [This](https://developer.microsoft.com/en-us/windows/iot/docs/store) is the guidance for publishing IoT Core apps to the Windows Store to have it update your apps automatically.  To submit the app, it must be compiled in Release mode.  Release compiles with a checkbox enabled called "Compile with .NET Native tool chain", which appears to have a bug when you include an EXE at the root of a project.  
  
The best part is that the only reason to do all of this is to pass the automated submission checks.