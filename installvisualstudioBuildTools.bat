vs_BuildTools.exe ^
--add Microsoft.VisualStudio.Workload.NativeDesktop ^
--add Microsoft.VisualStudio.Component.VC.CMake.Project ^
--add Microsoft.VisualStudio.Component.Windows10SDK.19041 ^
--passive --norestart ^
--includeRecommended ^
--wait


REM Download vs_BuildTills.exe from here.
REM https://visualstudio.microsoft.com/visual-cpp-build-tools/
REM We can also use the Visual Studio 2022 Community installer with the same flags
REM instead of vs_BuildTools.exe. vs_BuildTools.exe is a smaller download because
REM it doesn't includ the Visual Studio IDE just the build tools wich is what we need.

REM This is needed for both, tauri apps and aseprite.
REM --add Microsoft.VisualStudio.Workload.NativeDesktop ^
REM --add Microsoft.VisualStudio.Component.VC.CMake.Project ^
REM This is needed for tauri apps.
REM --add Microsoft.VisualStudio.Component.Windows10SDK.19041 ^