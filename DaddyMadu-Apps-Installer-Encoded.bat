��&cls
@echo off
mode 200
title [ Daddy Madu ] Autmated Apps Installer!
color 1f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v "AutomatedApps" /t REG_SZ /d "0.9.2" /f >nul 2>&1
for /f "tokens=3" %%z in ('reg query "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v AutomatedApps') do @set "CurrentVersion=%%z"
cd /d "%systemdrive%\Windows\System32"
cls
setlocal enableDelayedExpansion
echo Getting Things Ready, Please Wait...
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin">nul 2>&1

:AppsUtilityMenu
cls
echo ... Welcome %username% to DaddyMadu Autmated Apps Installer^/Uninstaller ...
echo.
echo.
echo 1. Install Apps
echo 2. Uninstall Apps
echo 3. Manually Update All Installed Apps
echo 4. Save Current Config to Desktop
echo 5. Load and Auto Install Apps from Config
echo 999. Exit
echo.
Echo Saved Config File will be on your Desktop named DaddyMaduApps.config move it to another safe place.
echo To Load Config File, simply copy your previously saved DaddyMaduApps.config to Desktop and relunch the app.
echo.
echo.
Echo v%CurrentVersion%
echo.
echo.
set /p answer=Type the number of your option and press ENTER KEY:
if %answer%==1 goto setLocalsforAppsInstallers
if %answer%==2 goto setLocalsforAppsUninstallers
if %answer%==3 goto DaddyMaduAutoAppUpdater
if %answer%==4 goto SaveDaddyMaduConfig
if %answer%==5 goto LoadDaddyMaduConfig
if %answer%==999 goto Exit
goto AppsUtilityMenu
:Exit
cls
echo Thank you  %username% for using DaddyMadu Auto Apps Installer^/Uninstaller^!
echo.
TIMEOUT 3 >nul
Exit
:setLocalsforAppsInstallers
set "TitleName1=Apps Installer"
set "InstallorUninstall=install"
set "CallAppsInstallorUninstall=:AppsInstaller"
goto ChooiseAppsInstallerUninstaller
:setLocalsforAppsUninstallers
set "TitleName1=Apps Uninstaller"
set "InstallorUninstall=uninstall"
set "CallAppsInstallorUninstall=:AppsUninstaller"
goto ChooiseAppsInstallerUninstaller
:ChooiseAppsInstallerUninstaller
cls
echo.
echo Welcome to DaddyMadu Automated %TitleName1%^!
echo.
echo please choose the apps you want to %InstallorUninstall% from below.
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
echo.
:getOptions
set "choices="
set /p "choices=Type your choices without spacing (e.g. 1,2,3,...,50) to go BACK type 999: "
if not defined choices ( 
    echo Please enter a valid option
    goto getOptions
    )
for %%h in (%choices%) do call :option-%%h
goto DaddyMaduAutoAppUpdater

:AppsInstaller
findstr /l /x /c:"%Package%" "%userprofile%\DaddyMaduAppsInstaller.config" >nul 2>&1
IF NOT ERRORLEVEL 1 goto :eof
echo installing %Package% Please Wait...
Choco install %Package% -y -r --ignorechecksum --allowemptychecksum --allowemptychecksumsecure
del /f /s /q "%userprofile%\DaddyMaduAppsInstaller.config" >nul 2>&1
choco list -l -r --id-only > "%userprofile%\DaddyMaduAppsInstaller.config"
echo Done.
goto :eof

:AppsUninstaller
findstr /l /x /c:"%Package%" "%userprofile%\DaddyMaduAppsInstaller.config" >nul 2>&1
IF NOT ERRORLEVEL 0 goto :eof
echo uninstalling %Package% Please Wait...
Choco uninstall %Package% -a -y
del /f /s /q "%userprofile%\DaddyMaduAppsInstaller.config" >nul 2>&1
choco list -l -r --id-only > "%userprofile%\DaddyMaduAppsInstaller.config"
echo Done.
goto :eof

:option-999
cls
goto AppsUtilityMenu
:option-1
cls
set "Package=googlechrome"
call %CallAppsInstallorUninstall%
goto :eof
:option-2
cls
set "Package=brave"
call %CallAppsInstallorUninstall%
goto :eof
:option-3
cls
set "Package=7zip.install"
call %CallAppsInstallorUninstall%
goto :eof
:option-4
cls
set "Package=vlc"
call %CallAppsInstallorUninstall%
goto :eof
:option-5
cls
set "Package=notepadplusplus.install"
call %CallAppsInstallorUninstall%
goto :eof
:option-6
cls
set "Package=vcredist2005 vcredist2008 vcredist2010 vcredist2012 vcredist2013 vcredist140 silverlight"
call %CallAppsInstallorUninstall%
goto :eof

:DaddyMaduAutoAppInstallerFromConfig
for /F "tokens=* USEBACKQ" %%i in (%userprofile%\DaddyMaduAppsInstaller.config) do (
cls
echo Installing %%i Please Wait...
Choco install %%i -y -r --ignorechecksum --allowemptychecksum --allowemptychecksumsecure
echo Done.
)
goto DaddyMaduAutoAppUpdater

:DaddyMaduAutoAppUpdater
cls
echo Checking for updates Please Wait, if found it will be installed shortly...
Choco upgrade all -y -r --ignorechecksum --allowemptychecksum --allowemptychecksumsecure
echo Done.
goto EOFAPPInstaller
:SaveDaddyMaduConfig
IF EXIST "%userprofile%\DaddyMaduAppsInstaller.config" (
cls
echo Grapping Current Config File...
TIMEOUT 1 >nul
cls
echo Copying Current Config File to Desktop..
choco list -l -r --id-only > "%userprofile%\Desktop\DaddyMaduApps.config"
echo Config Saved Successfully!
pause>nul
goto AppsUtilityMenu
) ELSE (
cls
echo Grapping Current Config File...
TIMEOUT 1 >nul
cls
echo ERROR No Config File was Found^! Please Install Some Apps Files.
pause>nul
goto AppsUtilityMenu
)
:LoadDaddyMaduConfig
IF EXIST "%userprofile%\Desktop\DaddyMaduApps.config" (
cls
echo Checking for New Config File...
TIMEOUT 1 >nul
cls
echo Loading New Config File..
copy "%userprofile%\Desktop\DaddyMaduApps.config" "%userprofile%\DaddyMaduAppsInstaller.config" /-y/v
echo New Config Loaded Successfully. Going to Install NOW^!
TIMEOUT 1 >nul
goto DaddyMaduAutoAppInstallerFromConfig
) ELSE (
cls
echo Checking for New Config File...
TIMEOUT 1 >nul
cls
echo ERROR No Config File was Found^ on Desktop! 
echo if you want to load Config from Desktop just add one and rename it to "DaddyMaduApps.config" .
pause>nul
goto AppsUtilityMenu
)
:EOFAPPInstaller
cls
echo All Apps are upToDate, Goodbye! 
Pause>nul
goto AppsUtilityMenu