@echo off 
mode 200 
title [ Daddy Madu ] Autmated Apps Installer! 
color 1f 
reg ADD "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v "AutomatedApps" /t REG_SZ /d "1.0.9" /f >nul 2>&1 
for /f "tokens=3" %%z in ('reg query "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v AutomatedApps') do @set "CurrentVersion=%%z" 
cd /d "%systemdrive%\Windows\System32" 
ECHO =============================================================================================  
echo Please Make Sure you DISABLED YOUR ANTIVIRUS and You HAVE INTERNET Avaliable. 
echo As some ANTIVIRUS Might Detect This Script As False Positive! 
echo Or add This Script to Exclusion List. 
ECHO =============================================================================================  
echo Please Press ENTER KEY to Continue!  
ECHO =============================================================================================  
Pause>nul 
cls 
setlocal enableDelayedExpansion 
echo Getting Things Ready, Please Wait... 
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))">nul 2>&1 && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" 
powershell -NoProfile -ExecutionPolicy Bypass -Command "choco feature enable -n=useRememberedArgumentsForUpgrades"
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
echo Thank you  %username% for using DaddyMadu Automated Apps Installer^/Uninstaller^! 
echo. 
timeout /t 3 
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
echo please choose the apps you want to %InstallorUninstall% from below. 
echo. 
echo === Essentials ===                        === Internet Tools ===                        === Communications === 
echo. 
echo [1] Microsoft Visual C^+^+ 2005-2019        [2] Mozilla Firefox                           [3] Telegram 
echo [4] DirectX                               [5] Google Chrome                             [6] WhatsApp Messenger 
echo [63] Microsoft .NET Framework 4.8         [7] Brave                                     [8] Skype 
echo                                           [9] Opera                                     [10] Zoom Client for Meetings 
echo                                           [11] Opera GX                                 [12] Mozilla Thunderbird 
echo                                                                                         [13] Microsoft Teams Desktop App 
echo                                                                                         [14] Discord 
echo. 
echo === File Management ===                   ===  Video^/Audio  ===                        ===  Productivity  === 
echo. 
echo [15] WinRAR                               [16] K-Lite Codec Pack Full                   [17] LibreOffice Fresh 
echo [18] FileZilla                            [19] K-Lite Codec Pack Basic                  [20] PDF Creator 
echo [21] Google Drive for desktop             [22] Audacity                                 [23] Sumatra PDF 
echo [24] Google Backup and Sync               [25] IrfanView                                [26] OBS Studio 
echo [27] teracopy                             [28] Spotify                                  [29] FormatFactory 
echo [30] 7zip                                 [31] VLC 
echo [78] SyncBackFree
echo [79] Free Download Manager
echo. 
echo === Editing ===                           ===     Gaming     ===                        ===    Utilitis    === 
echo. 
echo [32] GIMP                                 [33] Epic Games Launcher                      [34] CPU-Z 
echo [35] Inkscape                             [36] Steam                                    [37] CCleaner 
echo [38] Atom                                 [39] GOG Galaxy                               [40] Teamviewer 
echo [41] Lightshot                            [42] Origin                                   [43] AnyDesk 
echo [44] Avidemux                             [45] Ubisoft Connect                          [46] CrystalDiskInfo 
echo [47] ASIO4ALL                             [48] Playnite                                 [49] VirtualBox 
echo [50] NotePad^+^+                                                                          [51] VeraCrypt 
echo                                                                                         [52] HWiNFO 
echo                                                                                         [53] HandBrake 
echo                                                                                         [54] BleachBit 
echo                                                                                         [55] CrystalDiskMark Benchmark 
echo. 
echo === Drivers ===                           ===  Miscellaneous ===                        ===     Windows    === 
echo. 
echo [56] AMD Ryzen Chipset Drivers            [57] OpenSSL                                  [58] Windows and Office ISO Download Tool 
echo [59] NVidia Driver Striped                [60] Java SE Runtime Environment              [61] Windows 10 Update Assistant 
echo [62] NVidia Driver Gforce Experience      [77] Java Uninstall Tool                      [64] Autoruns 
echo [65] Snappy Driver Installer Origin       [66] qBittorrent                              [67] Sysinternals  
echo [68] Intel Network Adapter Driver W10     [69] Rufus                                    [70] Process Explorer 
echo [71] Display Driver Uninstaller           [72] Hex Editor and Disk Editor               [80] DNSCrypt-Proxy 
echo                                           [73] LockHunter 
echo                                           [74] uBlock Origin for Chrome 
echo                                           [75] Macrium Reflect Free 
echo                                           [76] throttlestop 
echo. 
:getOptions 
set "choices=" 
set /p "choices=Type your choices without spacing (e.g. 1,2,3,...,77) to go BACK type 999: " 
if not defined choices (  
    echo Please enter a valid option 
    goto getOptions 
    ) 
for %%h in (%choices%) do call :option-%%h 
goto ASKCheckingForUpdate 
:AppsInstaller 
findstr /l /x /c:"%Package%" "%userprofile%\DaddyMaduAppsInstaller.config" >nul 2>&1 
IF NOT ERRORLEVEL 1 goto :eof 
echo installing %Package% Please Wait... 
Choco install %Package% -y -r --allowemptychecksum --allowemptychecksumsecure 
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
set "Package=vcredist2005 vcredist2008 vcredist2010 vcredist2012 vcredist2013 vcredist140 silverlight" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-2 
cls 
set "Package=firefox" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-3 
cls 
set "Package=telegram.install" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-4 
cls 
set "Package=directx" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-5 
cls 
set "Package=googlechrome" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-6 
cls 
set "Package=whatsapp" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-7 
cls 
set "Package=brave" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-8 
cls 
set "Package=skype" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-9 
cls 
set "Package=opera" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-10 
cls 
set "Package=zoom" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-11 
cls 
set "Package=opera-gx" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-12 
cls 
set "Package=thunderbird" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-13 
cls 
set "Package=microsoft-teams" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-14 
cls 
set "Package=discord.install" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-15 
cls 
set "Package=winrar" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-16 
cls 
set "Package=k-litecodecpackfull" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-17 
cls 
set "Package=libreoffice-fresh" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-18 
cls 
set "Package=filezilla" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-19 
cls 
set "Package=k-litecodecpackbasic" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-20 
cls 
set "Package=pdfcreator" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-21 
cls 
set "Package=google-drive-file-stream" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-22 
cls 
set "Package=audacity" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-23 
cls 
set "Package=sumatrapdf.install" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-24 
cls 
set "Package=google-backup-and-sync" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-25 
cls 
set "Package=IrfanView" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-26 
cls 
set "Package=obs-studio.install" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-27 
cls 
set "Package=teracopy" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-28 
cls 
set "Package=spotify" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-29 
cls 
set "Package=formatfactory" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-30 
cls 
set "Package=7zip.install" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-31 
cls 
set "Package=vlc" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-32 
cls 
set "Package=gimp" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-33 
cls 
set "Package=epicgameslauncher" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-34 
cls 
set "Package=cpu-z.install" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-35 
cls 
set "Package=inkscape" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-36 
cls 
set "Package=steam-client" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-37 
cls 
set "Package=ccleaner" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-38 
cls 
set "Package=atom" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-39 
cls 
set "Package=goggalaxy" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-40 
cls 
set "Package=teamviewer" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-41 
cls 
set "Package=lightshot.install" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-42 
cls 
set "Package=origin" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-43 
cls 
set "Package=anydesk.install" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-44 
cls 
set "Package=avidemux" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-45 
cls 
set "Package=ubisoft-connect" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-46 
cls 
set "Package=crystaldiskinfo" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-47 
cls 
set "Package=asio4all" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-48 
cls 
set "Package=playnite" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-49 
cls 
set "Package=virtualbox" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-50 
cls 
set "Package=notepadplusplus.install" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-51 
cls 
set "Package=veracrypt" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-52 
cls 
set "Package=hwinfo.install" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-53 
cls 
set "Package=handbrake.install" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-54 
cls 
set "Package=bleachbit.install" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-55 
cls 
set "Package=crystaldiskmark" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-56 
cls 
set "Package=amd-ryzen-chipset" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-57 
cls 
set "Package=openssl" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-58 
cls 
set "Package=windows-iso-downloader" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-59 
cls 
set "Package=nvidia-display-driver --params "'/DCH'"" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-60 
cls 
set "Package=jre8" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-61 
cls 
set "Package=windows-10-update-assistant" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-62 
cls 
set "Package=geforce-game-ready-driver --params "'/DCH'"" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-63 
cls 
set "Package=dotnetfx" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-64 
cls 
set "Package=autoruns" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-65 
cls 
set "Package=sdio" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-66 
cls 
set "Package=qbittorrent" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-67 
cls 
set "Package=sysinternals" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-68 
cls 
set "Package=intel-network-drivers-win10" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-69 
cls 
set "Package=rufus" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-70 
cls 
set "Package=procexp" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-71 
cls 
set "Package=ddu" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-72 
cls 
set "Package=hxd" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-73 
cls 
set "Package=lockhunter" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-74 
cls 
set "Package=uBlock" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-75 
cls 
set "Package=reflect-free" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-76 
cls 
set "Package=throttlestop" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-77 
cls 
set "Package=javauninstalltool" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-78 
cls 
set "Package=syncbackfree" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-79 
cls 
set "Package=freedownloadmanager" 
call %CallAppsInstallorUninstall% 
goto :eof 
:option-80 
cls 
set "Package=dnscrypt-proxy" 
call %CallAppsInstallorUninstall% 
goto :eof 
:DaddyMaduAutoAppInstallerFromConfig 
for /F "tokens=* USEBACKQ" %%i in (%userprofile%\DaddyMaduAppsInstaller.config) do ( 
cls 
echo Installing %%i Please Wait... 
Choco install %%i -y -r --ignorechecksum --allowemptychecksum --allowemptychecksumsecure 
echo Done, Installed Successfully. 
) 
goto ASKCheckingForUpdate 
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
echo Config Saved Successfully! Press ENTER KEY to continue.
pause>nul 
goto AppsUtilityMenu 
) ELSE ( 
cls 
echo Grapping Current Config File... 
TIMEOUT 1 >nul 
cls 
echo ERROR No Config File was Found! Please Install Some Apps Files, Press ENTER KEY to continue.
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
echo  Press ENTER KEY to continue.
pause>nul 
goto AppsUtilityMenu 
) 
:ASKCheckingForUpdate 
setlocal enableDelayedExpansion 
for /l %%N in (30 -1 1) do ( 
  set /a "min=%%N/60, sec=%%N%%60, n-=1" 
  if !sec! lss 10 set sec=0!sec! 
  cls 
  choice /c:CN1 /n /m "Checking Update ^for installed Apps by Automated Apps in !min!:!sec! - Press N to Check Now, or C to Cancel. " /t:1 /d:1 
  if not errorlevel 3 goto :break 
) 
cls 
echo Checking for Updates in 0:00 - Press N to Check Now, or C to Cancel. 
:break 
if errorlevel 2 (goto DaddyMaduAutoAppUpdater) else goto EOFAPPNoUpgrade 
:EOFAPPInstaller 
cls 
echo All Apps are upToDate, Goodbye! Press ENTER KEY to continue.
Pause>nul 
goto AppsUtilityMenu 
:EOFAPPNoUpgrade 
cls 
echo Installed Successfully, Pease don't forget to check for updates at least every week Goodbye!
echo Please Press ENTER KEY to Exit.
Pause>nul 
goto AppsUtilityMenu 
