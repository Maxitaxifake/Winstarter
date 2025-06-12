@echo off
title MWB
color 0a

:menu 
cls
echo What do you want to do?
echo 1. Download app
echo 2. Something else
echo.
set /p mainchoice=Please enter a number and press Enter: 

if "%mainchoice%"=="1" goto Downloader
if "%mainchoice%"=="2" goto other
goto menu

:other
cls
echo What do you want to do?
echo 1. Bring back Win10 context menu
echo 2. Bring back Win11 context menu
echo.
set /p otherchoice=Please enter a number and press Enter:

if "%otherchoice%"=="1" (
    reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
    echo Win10 context menu activated.
   shutdown -r -t 1
)
if "%otherchoice%"=="2" (
    reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
    echo Win11 context menu restored.
	shutdown -r -t 1
)
pause
goto menu

:Downloader
cls
echo What would you like to download?
echo.
echo 1. VLC Media Player
echo 2. WinRAR
echo 3. Google Chrome
echo 4. Steam
echo 5. Discord
echo 6. Exit
echo 7. Back
echo.
set /p dlchoice=Please enter a number and press Enter: 

if "%dlchoice%"=="1" goto VLC
if "%dlchoice%"=="2" goto WINRAR
if "%dlchoice%"=="3" goto CHROME
if "%dlchoice%"=="4" goto STEAM
if "%dlchoice%"=="5" goto DISCORD
if "%dlchoice%"=="6" exit
if "%dlchoice%"=="7" goto menu
goto Downloader

:VLC
echo Downloading VLC Media Player...
curl -L -o vlc_installer.exe https://get.videolan.org/vlc/3.0.20/win64/vlc-3.0.20-win64.exe
echo Starting VLC installer...
start "" vlc_installer.exe
pause
goto Downloader

:WINRAR
echo Downloading WinRAR...
curl -L -o winrar_installer.exe https://www.rarlab.com/rar/winrar-x64-624.exe
echo Starting WinRAR installer...
start "" winrar_installer.exe
pause
goto Downloader

:CHROME
echo Downloading Google Chrome...
curl -L -o chrome_installer.exe https://dl.google.com/chrome/install/latest/chrome_installer.exe
echo Starting Chrome installer...
start "" chrome_installer.exe
pause
goto Downloader

:STEAM
echo Downloading Steam...
curl -L -o steam_installer.exe https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe
echo Starting Steam installer...
start "" steam_installer.exe
pause
goto Downloader

:DISCORD
echo Downloading Discord...
curl -L -o discord_installer.exe https://stable.dl2.discordapp.net/distro/app/stable/win/x64/1.0.9194/DiscordSetup.exe
echo Starting Discord installer...
start "" discord_installer.exe
pause
goto Downloader
