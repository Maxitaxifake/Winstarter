@echo off
echo checking if Winstarter is installed...
setlocal enabledelayedexpansion
set "regval="

for /f "tokens=3" %%A in ('reg query "HKCU\Software\Winstarter" /v Winstarter 2^>nul') do (
    set "regval=%%A"
)

if defined regval (
    if /i "!regval!"=="0x1" (
        goto menu
    ) else (
        goto start
    )
) else (
    goto start
)


:start
title Winstarter Installation
cls
echo -----------------------------------------
echo Winstarter by Maxitaxifake
echo License: MIT License
echo.
echo Copyright (c) 2025 Maxitaxifake
echo.
echo Permission is hereby granted, free of charge, to any person obtaining a copy
echo of this software and associated documentation files (the "Software"), to deal
echo in the Software without restriction, including without limitation the rights
echo to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
echo copies of the Software, and to permit persons to whom the Software is
echo furnished to do so, subject to the following conditions:
echo.
echo The above copyright notice and this permission notice shall be included in all
echo copies or substantial portions of the Software.
echo.
echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
echo IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
echo FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
echo AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
echo LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
echo OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
echo SOFTWARE.
echo -----------------------------------------
echo Welcome to the Winstarter Installation!
echo Version 0.01
echo Winstarter will download files,
echo edit the registry, and perform system modifications.
echo Make sure that you have NOT installed a browser.
echo If you already have one installed, uninstall it. (Microsoft Edge will be removed during installation.)
echo sry edge will NOT removed during the installation wait for 0.02
echo Type 'c' to show all available commands.
echo.

set /p startChoice=Enter command: 
if /i "%startChoice%"=="c" goto commands
if /i "%startChoice%"=="exit" exit
if /i "%startChoice%"=="cmd" start cmd
if /i "%startChoice%"=="install" goto install

goto start

:commands
cls
echo Available Commands:
echo.
echo install        - Installs Winstarter
echo exit           - Closes the installation
echo c              - Shows all available commands
echo cmd            - Opens a command prompt window
echo.
pause
goto start

:menu
title Winstarter
cls
echo Welcome to Winstarter 0.01
echo For the following commands to work, run this file with admin rights
echo 1. Appstore
echo 2. Settings
echo 3. Command line
echo 4. launch mod
echo 5. Licence
echo 99. Exit
echo.
set /p startChoice=Choice:
if /i "%startChoice%"=="1" goto appstore
if /i "%startChoice%"=="2" goto settings
if /i "%startChoice%"=="3" goto cmdl
if /i "%startChoice%"=="4" goto mod
if /i "%startChoice%"=="5" goto Licence
if /i "%startChoice%"=="99" exit

goto menu

:License
echo -----------------------------------------
echo Winstarter by Maxitaxifake
echo License: MIT License
echo.
echo Copyright (c) 2025 Maxitaxi
echo.
echo Permission is hereby granted, free of charge, to any person obtaining a copy
echo of this software and associated documentation files (the "Software"), to deal
echo in the Software without restriction, including without limitation the rights
echo to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
echo copies of the Software, and to permit persons to whom the Software is
echo furnished to do so, subject to the following conditions:
echo.
echo The above copyright notice and this permission notice shall be included in all
echo copies or substantial portions of the Software.
echo.
echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
echo IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
echo FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
echo AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
echo LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
echo OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
echo SOFTWARE.
echo -----------------------------------------
pause
goto menu
:mod
cls
echo === Launch Mod ===
set /p modfile=Enter the name of the .bat or .cmd file : 

if exist "%modfile%" (
    echo Running %modfile%...
    call "%modfile%"
) else (
    echo File "%modfile%" not found!
)

echo.
pause
goto menu

:settings
echo Well settings is not finished wait for 0.02
pause
goto

:appstore
echo what do you want to do?
echo 1.Download Applications
echo 2.Unistall Applications
echo 99.Back

set /p startChoice=Choice:
if /i "%startChoice%"=="1" goto iApplications
if /i "%startChoice%"=="2" goto uApplications
if /i "%startChoice%"=="99" goto menu
goto menu

:iApplications 
echo 1.rufus         -make bootable usbs
echo 2.signalrgb     -control your rgb devices
echo 3.balenaEtcher  -make bootable usbs
echo 99.Exit

set /p startChoice=Choice:
if /i "%startChoice%"=="1" winget install --id Rufus.Rufus
if /i "%startChoice%"=="2" winget install signalrgb
if /i "%startChoice%"=="3" winget search balenaEtcher
if /i "%startChoice%"=="99" goto menu

goto iApplications

:uApplications
echo Well Unistall Applications is not finished wait for 0.02
pause
goto

:cmdl
set /p startChoice=type command:
if /i "%startChoice%"=="help" goto helpcmdl
if /i "%startChoice%"=="installer" goto start
if /i "%startChoice%"=="leave" goto menu
if /i "%startChoice%"=="reboot" shutdown /r /t 0
if /i "%startChoice%"=="shutdown" shutdown /s /t 0

echo error
goto cmdl

:helpcmdl
echo Available Commands:
echo.
echo installer      -goes to the installer
echo leave          -opens the menu
echo help           - Shows all available commands
echo cmd            - reboots the system
echo shutdown       - shutdowns hte system
echo.
pause
goto cmdl



:install
cls
echo Installing Winstarter...
echo.

echo Restoring Windows 10 context menu...
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo Done.
echo.

echo Changing OS name...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName /t REG_SZ /d "Winstarter OS" /f
echo Done.
echo.

echo Downloading applications...
winget install -e --id Google.Chrome
winget install -e --id RARLab.WinRAR
winget install -e --id VideoLAN.VLC
winget install -e --id Discord.Discord
echo Applications installed.
echo.

echo Optimizing performance...
powershell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage"
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled
sc stop SysMain >nul 2>&1
sc config SysMain start= disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 26 /f
bcdedit /set useplatformtick yes
bcdedit /set disabledynamictick yes
bcdedit /set tscsyncpolicy Enhanced
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
echo Performance optimizations complete.
echo.
echo doing something
reg add "HKCU\Software\Winstarter" /v Winstarter /t REG_DWORD /d 1 /f
cls
echo Installation Done!
echo make shure that you dont delete this file since it is now like a app
echo and with that you can cofigrue this winstarter instalaisoin.and more
echo if you want you can rename this file it should not make a diffrance (:
set /p startChoice=Enter to reboot: 
if /i "%startChoice%"=="no" goto ok
shutdown -r -t 0
:ok
echo wait what?
echo you cant just say no
echo well i gues you dont want to reboot
echo press any key to Close
pause
exit
