REM The word rem in caps means this is a comment.
REM The following line sets working directory.
SET mypath=%~dp0

REM This link needs to be updated to latest release of skia. Go to https://github.com/aseprite/aseprite/blob/main/INSTALL.md
REM and follow the link to skia and go to releases, right click and copy link to latest Skia-Windows-Release-x64.zip
curl -L -o skia.zip https://github.com/aseprite/skia/releases/download/m102-861e4743af/Skia-Windows-Release-x64.zip
mkdir skia
tar -xf skia.zip -C skia

REM Make sure this also is the latest file. Update link if needed.
curl -L -o ninja.zip https://github.com/ninja-build/ninja/releases/download/v1.11.1/ninja-win.zip
tar -xf ninja.zip

REM git is a requirement that is not downloaded automatically and must be installed manually.
git clone --recursive https://github.com/aseprite/aseprite.git

REM This is different for Visual Studio 2019. Use
REM call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat" -arch=x64
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat" -arch=x64

cd aseprite
mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE=Release ^
-DLAF_BACKEND=skia -DSKIA_DIR="%mypath%skia" ^
-DSKIA_LIBRARY_DIR="%mypath%skia\out\Release-x64" ^
-DSKIA_LIBRARY="%mypath%skia\out\Release-x64\skia.lib" -G Ninja ..

%mypath%ninja aseprite

REM This pauses execution at the end once done so we can see messages.
timeout /t -1


REM NOT SURE but seems like in the aseprite/CMakeLists.txt file we may need to add
REM set(CMAKE_CXX_COMPILER "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.29.30133/bin/Hostx64/x64/cl.exe")
REM or
REM set(CMAKE_CXX_COMPILER "C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.30.30705/bin/Hostx64/x64/cl.exe")
REM for 2022 version of Visual Studio at the very top of the file. Try this if something goes wrong.