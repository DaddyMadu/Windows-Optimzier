��&cls
@echo off
cd /d "%systemdrive%\Windows\System32"
cls
title [ Daddy Madu ] Auto Apps Installer HQ!
color 1f
SETLOCAL ENABLEDELAYEDEXPANSION
echo Getting Things Ready, Please Wait...
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
IF EXIST "%userprofile%\DaddyMaduAppsInstaller.txt" (
:ConfigExist
set /a "t=10"
:AskForInstallingOrStartOver
set /a "t-=1"
if "%t%" == "0" goto cancelprevconfigstartover
cls
CHOICE /T 1 /C:yn /D n /M "Do you want to delete previous config and select apps again? Auto Cancel in %t% sec..."
IF %errorlevel% equ 1 goto acceptprevconfigandinstall
goto AskForInstallingOrStartOver
:acceptprevconfigandinstall
echo Accepted! Deleting Config File...
del /f /s /q "%userprofile%\DaddyMaduAppsInstaller.txt">nul 2>&1
echo Starting Over Now!
goto ChooseAppInstallerUninstaller
:cancelprevconfigstartover
echo Cancelled!
cls
goto DaddyMaduAutoAppUpdater
) ELSE (
GOTO ChooseAppInstallerUninstaller
)
:ChooseAppInstallerUninstaller
cls
echo.
echo Welcome to DaddyMadu Automated App Installer!
echo.
echo please choose the apps you want to install from below.
echo.
echo === Browsers ===
echo [1] Google Chrome
echo [2] Brave
echo === Utilitis ===
echo [3] 7-Zip
echo [4] VLC
echo [5] Notepad^+^+
echo === Essentials ===
echo [6] Microsoft Visual C^+^+ 2005-2019
echo.
Echo.
Echo v0.0.2a
echo.
echo.
:getOptions
del /f /s /q "%userprofile%\DaddyMaduAppsInstaller.txt">nul 2>&1
set "choices="
set /p "choices=Type your choices without spacing (e.g. 1,2,3,...,50): "
if not defined choices ( 
    echo Please enter a valid option
    goto getOptions
    )
for %%v in (%choices%) do call :option-%%v
goto DaddyMaduAutoAppInstallerFromConfig

:option-1
>> %userprofile%\DaddyMaduAppsInstaller.txt echo googlechrome
exit /B
:option-2
>> %userprofile%\DaddyMaduAppsInstaller.txt echo brave
exit /B
:option-3
>> %userprofile%\DaddyMaduAppsInstaller.txt echo 7zip
exit /B
:option-4
>> %userprofile%\DaddyMaduAppsInstaller.txt echo vlc
exit /B
:option-5
>> %userprofile%\DaddyMaduAppsInstaller.txt echo notepadplusplus
exit /B
:option-6
>> %userprofile%\DaddyMaduAppsInstaller.txt echo vcredist2005
>> %userprofile%\DaddyMaduAppsInstaller.txt echo vcredist2008
>> %userprofile%\DaddyMaduAppsInstaller.txt echo vcredist2010
>> %userprofile%\DaddyMaduAppsInstaller.txt echo vcredist2012
>> %userprofile%\DaddyMaduAppsInstaller.txt echo vcredist2013
>> %userprofile%\DaddyMaduAppsInstaller.txt echo vcredist140
exit /B
:DaddyMaduAutoAppInstallerFromConfig
SETLOCAL ENABLEDELAYEDEXPANSION  
for /F "tokens=* USEBACKQ" %%i in (%userprofile%\DaddyMaduAppsInstaller.txt) do (
echo Installing %%i Please Wait...
Choco install %%i -f -y
echo Done.
)
goto DaddyMaduAutoAppUpdater
:DaddyMaduAutoAppUpdater
cls
echo Checking for updates Please Wait, if found it will be installed shortly...
Choco upgrade all -y
echo Done.
goto EOFAPPInstaller
:EOFAPPInstaller
Pause>nul
exit