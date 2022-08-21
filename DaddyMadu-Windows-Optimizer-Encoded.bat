@echo off
cd /d "%systemdrive%\Windows\System32"
reg ADD "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v "OptimizerVersion" /t REG_SZ /d "5.2.4" /f >nul 2>&1
for /f "tokens=3" %%z in ('reg query "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v OptimizerVersion') do @set "CurrentVersion=%%z"
powershell -NoProfile -ExecutionPolicy Bypass -c "Add-MpPreference -ExclusionPath '%userprofile%\AppData\Local\Temp\dmtmp'" >nul 2>&1
cls
title [ Daddy Madu ] Windows Optimizer!
color 1f
:Menu
cls
echo ... Welcome %username% to DaddyMadu Windows Optimizer ...
echo.
echo 1. Clear All TEMP folders, logs, chks, Caches and Fix DNS problems
echo 2. Install and scan system with MalwareBytes
echo 3. Scan System + Repair Windows Image
echo 4. Install or Update Wise Programs Uninstaller
echo 5. Automated Apps Installer - Beta
echo 6. Windows 10 Gaming Focus Full Tweaker and Debloater
echo 7. Fix Start Menu issues
echo 8. Fix and Rebuild Icons
echo 9. Games Optimizer
echo 10. DaddyMadu Automated VPN and VOIP
echo 999. Exit
echo.
Echo.
Echo v%CurrentVersion%
echo.
echo.
set /p answer=Type the number of your option and press ENTER KEY:
if %answer%==1 goto cleartemp
if %answer%==2 goto malwarebytes
if %answer%==3 goto Repair
if %answer%==4 goto WiseUninstaller
if %answer%==5 goto DaddyMaduAutomatedAppsInstaller
if %answer%==6 goto Windows10GamingFocus
if %answer%==7 goto fixstartmenu
if %answer%==8 goto rebuildicon
if %answer%==9 goto GamesOptimizer
if %answer%==10 goto AutomatedVPN
if %answer%==999 goto Exit
goto Menu
:Exit
cls
echo Thank you for using Daddy Madu Windows Optimizer!
echo.
TIMEOUT 3 >nul
exit /b
:Repair
cls
sfc /scannow
sfc /scannow
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
cls
echo Windows Repaired Successfully!
echo ------------------------------------------------------------------------
echo Please restart the PC, Press ENTER KEY yo Continue.
echo ------------------------------------------------------------------------
pause >nul
goto Menu
:WiseUninstaller
cls
echo Getting Things Ready for you, Please Wait...
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main" /v DisableFirstRunCustomize /t REG_DWORD /d 2 /f >nul 2>&1
for /f "usebackq delims=" %%a in (`
  powershell -NoProfile -ExecutionPolicy Bypass -c "$Results = Invoke-WebRequest -Method Get -Uri 'https://www.wisecleaner.com/index.php?r=download-product/latest-version&product=wise-program-uninstaller' -MaximumRedirection 0 -ErrorAction SilentlyContinue; $DownloadwuiLink = $Results.Headers.Location; $DownloadwuiLink"
`) do set "DownloadwuiLink=%%a"
for /f "usebackq delims=" %%b in (`
  powershell -NoProfile -ExecutionPolicy Bypass -c "$Results = Invoke-WebRequest -Method Get -Uri 'https://www.wisecleaner.com/index.php?r=download-product/latest-version&product=wise-program-uninstaller' -MaximumRedirection 0 -ErrorAction SilentlyContinue; $DownloadwuiLink = $Results.Headers.Location; $DownloadwuiLink; [System.IO.Path]::GetFileName(("$DownloadwuiLink"))"
`) do set "FilewuiName=%%b"
echo File Name: "%FilewuiName%"
cls
IF EXIST "%systemdrive%\Program Files (x86)\Wise\Wise Program Uninstaller\WiseProgramUninstaller.exe" (
  GOTO ConfirmationwuiDW
) ELSE (
 GOTO askforwuiinstallation
)
:askforwuiinstallation
cls
SET /P yesno=Do you want to install with Wise Program Uninstaller? [Y/N]:
IF "%yesno%"=="y" GOTO Confirmationwui
IF "%yesno%"=="Y" GOTO Confirmationwui
IF "%yesno%"=="n" GOTO Endwui
IF "%yesno%"=="N" GOTO Endwui
goto askforwuiinstallation
:ConfirmationwuiDW
Echo Checking for Update...
for /f "usebackq delims=" %%x in (`
  powershell -NoProfile -ExecutionPolicy Bypass -c "(get-item '%systemdrive%\Program Files (x86)\Wise\Wise Program Uninstaller\WiseProgramUninstaller.exe').VersionInfo.FileVersion"
`) do set "InstalledWUIVersion=WPUSetup_%%x.exe"
if "%InstalledWUIVersion%"=="%FilewuiName%" (
echo You Have The Latest Version!
TIMEOUT 2 >nul
goto Menu
) else (
Echo New Update %FilewuiName% Found, Updating NOW!
timeout /t 2 /nobreak >nul
goto Confirmationwui
)
:Confirmationwui
cls
echo Grapping Wise Program Uninstaller Latest Version Link...
echo %DownloadwuiLink%
echo Downloading Wise Program Uninstaller...
bitsadmin /transfer "Downloading Wise Program Uninstaller" /priority FOREGROUND "%DownloadwuiLink%" "%systemdrive%\%FilewuiName%"
IF EXIST "%systemdrive%\%FilewuiName%" (
goto wuicontinue
) ELSE (
GOTO alternativewuidownload
)
:alternativewuidownload
powershell -c "(New-Object Net.WebClient).DownloadFile('%DownloadwuiLink%', '%systemdrive%\%FilewuiName%')"
goto wuicontinue
:wuicontinue
cls
echo Installing Wise Program Uninstaller...
"%systemdrive%\%FilewuiName%" /VERYSILENT
TIMEOUT 10 >nul
GOTO Endwui
:Endwui
start http://daddymadu.gg/
cls
echo ------------------------------------------------------------------------
echo Process Completed Successfully. press ENTER KEY to Continue!
echo ------------------------------------------------------------------------
pause >nul
goto Menu 
:DaddyMaduAutomatedAppsInstaller
cls
echo Getting Things Ready for you, Please Wait...
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Apps-Installer.bat" (
goto choiceAppInstallerHQ
) ELSE (
GOTO AppInstallerHQ
)
:choiceAppInstallerHQ
cls
for /f "usebackq delims=" %%w in (`
powershell -NoProfile -ExecutionPolicy Bypass -c "$CheckAutomatedAppsVersion = Invoke-WebRequest -Uri https://git.io/JON1H; $AutomatedAppsVersion = ($CheckAutomatedAppsVersion.Content | Out-String).Trim(); $AutomatedAppsVersion"
`) do set "OnlineAutomatedAppsVersion=%%w"
for /f "tokens=3" %%z in ('reg query "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v AutomatedApps') do @set "AutomatedAppsVersion=%%z"
IF "%OnlineAutomatedAppsVersion%" EQU "%AutomatedAppsVersion%" (
echo No Update Found, Lunching script!
goto continueAppInstallerHQ
) ELSE (
echo Automated Apps Update Found v%OnlineAutomatedAppsVersion%, Script is updating NOW!
powershell -NoProfile -ExecutionPolicy Bypass -c "$CheckAutomatedAppsChangelog = Invoke-WebRequest -Uri https://git.io/JONPi; $AutomatedAppsChangelog = ($CheckAutomatedAppsChangelog.Content | Out-String).Trim(); $AutomatedAppsChangelog.Split([Environment]::NewLine) | Select -First 20"
timeout /t 20
cls
goto AppInstallerHQ
)
:AppInstallerHQ
cls
bitsadmin /transfer "Downloading Daddy Madu Windows Optimizer Latest Update" /priority FOREGROUND "https://git.io/JO9MJ" "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Apps-Installer.bat"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Apps-Installer.bat" (
goto continueAppInstallerHQ
) ELSE (
GOTO alternativedownloadAppInstallerHQ
)
:alternativedownloadAppInstallerHQ
cls
powershell -c "(New-Object Net.WebClient).DownloadFile('https://git.io/JO9MJ', '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Apps-Installer.bat')"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Apps-Installer.bat" (
goto continueAppInstallerHQ
) ELSE (
GOTO alternativedownload2AppInstallerHQ
)
:alternativedownload2AppInstallerHQ
cls
powershell -c "Invoke-WebRequest https://git.io/JO9MJ -OutFile %userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Apps-Installer.bat"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Apps-Installer.bat" (
goto continueAppInstallerHQ
) ELSE (
cls
ECHO =============================================================================================
echo Please Make Sure you DISABLED YOUR ANTIVIRUS and You HAVE INTERNET Avaliable!
echo As something is BLOCKING script from downloading latest Version Avaliable!
ECHO =============================================================================================
echo Please Press ENTER KEY to try again!
ECHO =============================================================================================
pause >nul
goto AppInstallerHQ
)
:continueAppInstallerHQ
cls
for /f "delims== tokens=2" %%a in ('wmic os get osarchitecture /value') do (
  set arch=%%a
)
if "%arch%"=="64-bit" (
goto :x64AppInstallerHQ
) else (
goto :x86AppInstallerHQ
)
:x64AppInstallerHQ
IF EXIST "%SystemRoot%\Sysnative\cmd.exe" (
start %SystemRoot%\Sysnative\cmd.exe /c "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Apps-Installer.bat"
) ELSE (
start %SystemRoot%\System32\cmd.exe /c "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Apps-Installer.bat"
)
goto ExitDaddyMaduWindowsOptimizer
:x86AppInstallerHQ
start %SystemRoot%\System32\cmd.exe /c "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Apps-Installer.bat"
goto ExitDaddyMaduWindowsOptimizer
:ExitDaddyMaduWindowsOptimizer
Exit
:Windows10GamingFocus
cls
for /f "tokens=1-3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ReleaseID') do @set "Version=%%~c"
IF %Version% GEQ 2009 (
goto uptodate
) ELSE (
cls
echo ------------------------------------------------------------------------
echo Your Windows 10 %Version% is OUTDATED! Please update your system to the latest 20H2 AKA 2009 build.
echo TO CONTINUE ANY WAY PRESS ENTER KEY! You may encounter errors during optimization pocess.
echo ------------------------------------------------------------------------
pause >nul
goto uptodate
)
:uptodate
cls
del /s /f /q "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.ps1">nul 2>&1
bitsadmin /transfer "Downloading Daddy Madu Windows Optimizer Latest Update" /priority FOREGROUND "http://tweaks.daddymadu.gg" "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.ps1"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.ps1" (
goto continuelocalstart
) ELSE (
GOTO alternativedownload
)
:alternativedownload
cls
powershell -c "(New-Object Net.WebClient).DownloadFile('http://tweaks.daddymadu.gg', '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.ps1')"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.ps1" (
goto continuelocalstart
) ELSE (
GOTO alternativedownload2
)
:alternativedownload2
cls
powershell -c "Invoke-WebRequest http://tweaks.daddymadu.gg -OutFile %userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.ps1"
goto continuelocalstart
:continuelocalstart
cls
start /wait powershell -nop -executionpolicy bypass -File "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.ps1"
cls
echo DaddyMadu Windows10GamingFocus Applied Successfully!
echo ------------------------------------------------------------------------
echo Please restart your PC!
echo ------------------------------------------------------------------------
:rebootafterWindows10GamingFocus
SET /P yesno=Do you want to Reboot this machine NOW? [Y/N]:
IF "%yesno%"=="y" GOTO Confirmation
IF "%yesno%"=="Y" GOTO Confirmation
IF "%yesno%"=="n" GOTO End
IF "%yesno%"=="N" GOTO End
goto rebootafterWindows10GamingFocus
:Confirmation
ECHO System is going to Reboot now    
shutdown /r /f /t 0
GOTO EOF
:End
ECHO System Reboot cancelled...
TIMEOUT 2 >nul
:EOF
cls
echo Please restart your PC. press ENTER KEY to Continue!
TIMEOUT 2 >nul
goto Menu 
:fixstartmenu
cls
echo Deleteing registry value for start menu
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount" /f >nul 2>&1
echo Starting Component Cleanup
Schtasks.exe /Run /I /TN \Microsoft\Windows\Servicing\StartComponentCleanup
echo Cleaning Component Using DISM
DISM /online /Cleanup-Image /StartComponentCleanup
cls
echo StartMenu Repaired Successfully!
echo ------------------------------------------------------------------------
echo Please restart the PC, Press ENTER KEY yo Continue.
echo ------------------------------------------------------------------------
pause >nul
goto Menu
:rebuildicon
cls
set iconcache=%localappdata%\IconCache.db
set iconcache_x=%localappdata%\Microsoft\Windows\Explorer\iconcache*

echo.
echo The explorer process must be temporarily killed before deleting the IconCache.db file. 
echo.
echo Please SAVE ALL OPEN WORK before continuing and Press ENTER KEY yo Continue.
echo.
pause
echo.
If exist "%iconcache%" goto delete
echo.
echo The %localappdata%\IconCache.db file has already been deleted.
echo. 
If exist "%iconcache_x%" goto delete
echo.
echo The %localappdata%\Microsoft\Windows\Explorer\IconCache_*.db files have already been deleted.
echo.
gotoMenu


:delete
echo.
echo Attempting to delete IconCache.db files...
echo.
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
If exist del /A /F /Q "%iconcache%"
If exist del /A /F /Q "%iconcache_x%"
start explorer.exe
echo.
echo IconCache database files have been successfully deleted.
goto restart


:restart
cls
echo.
echo.
echo You will need to restart the PC to finish rebuilding your icon cache.
echo.
goto chooserc
:chooserc
CHOICE /C:YN /M "Do you want to restart the PC now?"
IF ERRORLEVEL 2 goto no
IF ERRORLEVEL 1 goto yes
goto chooserc
:yes
shutdown /r /f /t 00

:no
goto Menu
:malwarebytes
cls
IF EXIST "%ProgramFiles%\Malwarebytes\Anti-Malware\mbam.exe" (
  GOTO scananduninstall
) ELSE (
 GOTO Downloadmalwarebytes
)
:Downloadmalwarebytes
cls
echo Downloading MalwareBytes...
bitsadmin /transfer "Downloading MalwareBytes" /priority FOREGROUND "https://data-cdn.mbamupdates.com/web/mb4-setup-consumer/MBSetup.exe" "%systemdrive%\MBSetup.exe"
IF EXIST "%systemdrive%\MBSetup.exe" (
goto mbcontinue
) ELSE (
GOTO alternativembdownload
)
:alternativembdownload
powershell -c "(New-Object Net.WebClient).DownloadFile('https://data-cdn.mbamupdates.com/web/mb4-setup-consumer/MBSetup.exe', '%systemdrive%\MBSetup.exe')"
goto mbcontinue
:mbcontinue
cls
echo Installing MalwareBytes...
"%systemdrive%\MBSetup.exe" /VERYSILENT /NORESTART
TIMEOUT 10 >nul
GOTO scananduninstall
:scananduninstall
cls
echo Scanning your system with MalwareBytes...
"%ProgramFiles%\Malwarebytes\Anti-Malware\mbam.exe" /scan -full -silent
SET /P yesno=Do you want to Uninstall Malwarebytes? [Y/N]:
IF "%yesno%"=="y" GOTO Confirmation
IF "%yesno%"=="Y" GOTO Confirmation
IF "%yesno%"=="n" GOTO End
IF "%yesno%"=="N" GOTO End
GOTO scananduninstall
:Confirmation  
cls 
echo Uninstalling MalwareBytes...
"%ProgramFiles%\Malwarebytes\Anti-Malware\mbuns.exe" /VERYSILENT /NORESTART
GOTO EOF
:End
:EOF
GOTO EOF
:End
:EOF
cls
echo Deleting MalwareBytes Source Files...
del /f /s /q "%SystemDrive%\MBSetup.exe"
cls
echo Processed Successfully! press ENTER KEY to Continue!
pause >nul
goto Menu 
:cleartemp
cls
del /f /s /q "%systemdrive%\*.tmp"
del /f /s /q "%systemdrive%\*._mp"
del /f /s /q "%systemdrive%\*.log"
del /f /s /q "%systemdrive%\*.gid"
del /f /s /q "%systemdrive%\*.chk"
del /f /s /q "%systemdrive%\*.old"
del /f /s /q "%systemdrive%\recycled\*.*"
del /f /s /q "%windir%\*.bak"
del /f /s /q "%windir%\prefetch\*.*"
rd /s /q %windir%\temp & md %windir%\temp
del /f /q "%userprofile%\cookies\*.*"
del /f /q "%userprofile%\recent\*.*"
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
SETLOCAL
SET "sourcedir=%userprofile%\AppData\Local\Temp"
SET "keepfile=DaddyMadu-Windows-Optimizer.bat"
SET "keepfile2=DaddyMadu-Apps-Installer.bat"
SET "keepfile3=DaddyMadu-Windows-Optimizer.ps1"
SET "keepfile4=DaddyMadu-VPN-VOIP.bat"
SET "keepdir=dmtmp"
FOR /d %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
FOR %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" IF /i NOT "%%~nxa"=="%keepfile2%" IF /i NOT "%%~nxa"=="%keepfile3%" IF /i NOT "%%~nxa"=="%keepfile4%" DEL /S /F /Q "%%a"
SETLOCAL
SET "sourcedir=%userprofile%\AppData\Local\Temp\dmtmp"
SET "keepfile=DaddyMadu-Windows-Optimizer.bat"
SET "keepfile2=DaddyMadu-Apps-Installer.bat"
SET "keepfile3=DaddyMadu-Windows-Optimizer.ps1"
SET "keepfile4=DaddyMadu-VPN-VOIP.bat"
SET "keepdir=dmtmp"
FOR /d %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q /F "%%a"
FOR %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" IF /i NOT "%%~nxa"=="%keepfile2%" IF /i NOT "%%~nxa"=="%keepfile3%" IF /i NOT "%%~nxa"=="%keepfile4%" DEL /S /F /Q "%%a"
SETLOCAL
SET "sourcedir=%userprofile%\Local Settings\Temp"
SET "keepfile=DaddyMadu-Windows-Optimizer.bat"
SET "keepfile2=DaddyMadu-Apps-Installer.bat"
SET "keepfile3=DaddyMadu-Windows-Optimizer.ps1"
SET "keepfile4=DaddyMadu-VPN-VOIP.bat"
SET "keepdir=dmtmp"
FOR /d %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
FOR %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" IF /i NOT "%%~nxa"=="%keepfile2%" IF /i NOT "%%~nxa"=="%keepfile3%" IF /i NOT "%%~nxa"=="%keepfile4%" DEL /S /F /Q "%%a"
SETLOCAL
SET "sourcedir=%userprofile%\Local Settings\Temp\dmtmp"
SET "keepfile=DaddyMadu-Windows-Optimizer.bat"
SET "keepfile2=DaddyMadu-Apps-Installer.bat"
SET "keepfile3=DaddyMadu-Windows-Optimizer.ps1"
SET "keepfile4=DaddyMadu-VPN-VOIP.bat"
SET "keepdir=dmtmp"
FOR /d %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q /F "%%a"
FOR %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" IF /i NOT "%%~nxa"=="%keepfile2%" IF /i NOT "%%~nxa"=="%keepfile3%" IF /i NOT "%%~nxa"=="%keepfile4%" DEL /S /F /Q "%%a"
del /f /s /q "%userprofile%\recent\*.*"
del /f /s /q "%windir%\Temp\*.*"
goto googlednschoice
:googlednschoice
setlocal enableDelayedExpansion
for /l %%N in (10 -1 1) do (
  set /a "min=%%N/60, sec=%%N%%60, n-=1"
  if !sec! lss 10 set sec=0!sec!
  cls
  choice /c:CN1 /n /m "Applying Google DNS^/Open DNS in !min!:!sec! - Press N to Apply Now, or C to Cancel. " /t:1 /d:1
  if not errorlevel 3 goto :break
)
cls
echo Checking for Updates in 0:00 - Press N to Check Now, or C to Cancel.
:break
if errorlevel 2 (goto acceptgoogledns) else goto canceldgoogledns
:eof

:acceptgoogledns
echo Accepted!
powershell -NoProfile -ExecutionPolicy Bypass -c "Get-NetAdapter | set-DnsClientServerAddress -ServerAddresses ('8.8.8.8','1.1.1.1')" >nul 2>&1
goto continuenetworkfixes
:canceldgoogledns
echo Cancelled!
goto continuenetworkfixes
:continuenetworkfixes
setlocal DisableDelayedExpansion
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
ipconfig /registerdns
timeout /t 10 /nobreak >nul
goto downloadwrc
:downloadwrc
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main" /v DisableFirstRunCustomize /t REG_DWORD /d 2 /f >nul 2>&1
for /f "usebackq delims=" %%a in (`
  powershell -NoProfile -ExecutionPolicy Bypass -c "$Results = Invoke-WebRequest -Method Get -Uri 'https://www.wisecleaner.com/index.php?r=download-product/latest-version&product=wise-registry-cleaner' -MaximumRedirection 0 -ErrorAction SilentlyContinue; $DownloadwcLink = $Results.Headers.Location; $DownloadwcLink"
`) do set "DownloadwcLink=%%a"
for /f "usebackq delims=" %%b in (`
  powershell -NoProfile -ExecutionPolicy Bypass -c "$Results = Invoke-WebRequest -Method Get -Uri 'https://www.wisecleaner.com/index.php?r=download-product/latest-version&product=wise-registry-cleaner' -MaximumRedirection 0 -ErrorAction SilentlyContinue; $DownloadwcLink = $Results.Headers.Location; $DownloadwcLink; [System.IO.Path]::GetFileName(("$DownloadwcLink"))"
`) do set "FilewcName=%%b"
echo File Name: "%FilewcName%"
cls
IF EXIST "%systemdrive%\Program Files (x86)\Wise\Wise Registry Cleaner\WiseRegCleaner.exe" (
  GOTO wrcupdatescanandclean
) ELSE (
 GOTO askforwrcinstallation
)
:askforwrcinstallation
cls
SET /P yesno=Do you want to install and clean your PC with Wise Registry Cleaner? [Y/N]:
IF "%yesno%"=="y" GOTO Confirmationwrc
IF "%yesno%"=="Y" GOTO Confirmationwrc
IF "%yesno%"=="n" GOTO Endwrc
IF "%yesno%"=="N" GOTO Endwrc
goto askforwrcinstallation
:Confirmationwrc
cls
echo Grapping Wise Registry Cleaner Latest Version Link...
"%DownloadwcLink%"
echo Downloading Wise Registry Cleaner...
bitsadmin /transfer "Downloading Wise Registry Cleaner" /priority FOREGROUND "%DownloadwcLink%" "%systemdrive%\%FilewcName%"
IF EXIST "%systemdrive%\%FilewcName%" (
goto wrcontinue
) ELSE (
GOTO alternativewrdownload
)
:alternativewrdownload
powershell -c "(New-Object Net.WebClient).DownloadFile('%DownloadwcLink%', '%systemdrive%\%FilewcName%')"
goto wrcontinue
:wrcontinue
cls
echo Installing Wise Registry Cleaner...
"%systemdrive%\%FilewcName%" /VERYSILENT
TIMEOUT 10 >nul
goto wrcscanandclean
:wrcupdatescanandclean
Echo Checking for Update...
for /f "usebackq delims=" %%x in (`
  powershell -NoProfile -ExecutionPolicy Bypass -c "(get-item '%systemdrive%\Program Files (x86)\Wise\Wise Registry Cleaner\WiseRegCleaner.exe').VersionInfo.FileVersion"
`) do set "InstalledWCVersion=WRCFree_%%x.exe"
if "%InstalledWCVersion%"=="%FilewcName%" (
goto wrcscanandclean
) else (
Echo New Update "%FilewcName%" Found, Updating NOW!
timeout /t 3 /nobreak >nul
goto Confirmationwrc
)
:wrcscanandclean
cls
echo Cleaning Registry using Wise Registry Cleaner...
"%systemdrive%\Program Files (x86)\Wise\Wise Registry Cleaner\WiseRegCleaner.exe" -a -safe
start http://daddymadu.gg/
goto rebootafterRWC
:rebootafterRWC
cls
SET /P yesno=Do you want to Reboot this machine NOW? [Y/N]:
IF "%yesno%"=="y" GOTO RWCConfirmation
IF "%yesno%"=="Y" GOTO RWCConfirmation
IF "%yesno%"=="n" GOTO RWCEnd
IF "%yesno%"=="N" GOTO RWCEnd
goto rebootafterRWC
:RWCConfirmation
ECHO System is going to Reboot NOW...
shutdown /r /f /t 0
:RWCEnd
ECHO System Reboot cancelled!
TIMEOUT 1 >nul
GOTO RWCEOF
:RWCEOF
cls
echo ------------------------------------------------------------------------
echo Please RESTART your PC. press ENTER KEY to Continue!
echo ------------------------------------------------------------------------
pause >nul
goto Menu 
:GamesOptimizer
cls
echo ... Welcome %username% to DaddyMadu Games Optimizer ...
echo.
echo 1. Gameloop Optimizer
echo 2. Valorant
echo.
echo More is Comming Here, Stay TUNED!
echo.
echo 888. Back
echo 999. Exit
echo.
echo.
set /p answer=Type the number of your option and press ENTER KEY:
if %answer%==1 goto GameloopMenu
if %answer%==2 goto ValorantGame
if %answer%==888 goto Menu
if %answer%==999 goto Exit
goto GamesOptimizer
:GameloopMenu
cls
title [ Daddy Madu ] Gameloop Optimizer!
echo ... Welcome %username% to DaddyMadu Gameloop Optimizer ...
echo.
echo 1. Force Stop All Gameloop Emulator Process
echo 2. Gameloop Emulator Optimization for no FPS Drop
echo TYPE "remove". Compelete Uninstall Gameloop Emulator Leftovers
echo 3. Install Latest Gameloop from Official Link Gameloop.com
echo 4. Gameloop TEMP Mover!
echo 5. Fix for after Gameloop Force Temp C, Drives Not Showing
echo 6. Back
echo 7. Main Menu
echo 8. Exit
echo.
set /p answer=Type the number of your option and press ENTER KEY:
if %answer%==1 goto forcestop
if %answer%==2 goto optimization
if %answer%==remove goto GLuninstaller
if %answer%==3 goto GLinstaller
if %answer%==4 goto TEMPMover
if %answer%==5 goto FixRemountingIssue
if %answer%==6 goto GamesOptimizer
if %answer%==7 goto Menu
if %answer%==8 goto Exit
goto GameloopMenu
:forcestop
cls
taskkill /F /IM "aow_exe.exe" /T
taskkill /F /IM "AndroidEmulatorEn.exe" /T
taskkill /F /IM "AndroidEmulator.exe" /T
taskkill /F /IM "AndroidEmulatorEx.exe" /T
taskkill /F /IM "TBSWebRenderer.exe" /T
taskkill /F /IM "TBSWebRenderer.exe" /T
taskkill /F /IM "syzs_dl_svr.exe" /T
taskkill /F /IM "AppMarket.exe" /T
TaskKill /F /IM "QMEmulatorService.exe" /T
taskkill /f /IM "RuntimeBroker.exe" /T
taskkill /f /IM "adb.exe" /T
taskkill /f /IM "GameLoader.exe" /T
taskkill /f /IM "TSettingCenter.exe" /T
taskkill /F /IM "Auxillary.exe" /T
taskkill /F /IM "TP3Helper.exe" /T
taskkill /F /IM "tp3helper.dat" /T
taskkill /F /IM "GameDownload.exe" /T
cls
echo All Gameloop Process Stopped Successfully. press ENTER KEY to Continue!
pause >nul
goto GameloopMenu
:GLuninstaller
cls
taskkill /F /IM "aow_exe.exe" /T
taskkill /F /IM "AndroidEmulatorEn.exe" /T
taskkill /F /IM "AndroidEmulator.exe" /T
taskkill /F /IM "AndroidEmulatorEx.exe" /T
taskkill /F /IM "TBSWebRenderer.exe" /T
taskkill /F /IM "TBSWebRenderer.exe" /T
taskkill /F /IM "syzs_dl_svr.exe" /T
taskkill /F /IM "AppMarket.exe" /T
TaskKill /F /IM "QMEmulatorService.exe" /T
taskkill /f /IM "RuntimeBroker.exe" /T
taskkill /f /IM "adb.exe" /T
taskkill /f /IM "GameLoader.exe" /T
taskkill /f /IM "TSettingCenter.exe" /T
taskkill /F /IM "Auxillary.exe" /T
taskkill /F /IM "TP3Helper.exe" /T
taskkill /F /IM "tp3helper.dat" /T
taskkill /F /IM "GameDownload.exe" /T
net stop aow_drv
net stop QMEmulatorService
net stop Tensafe
sc delete aow_drv
sc delete QMEmulatorService
sc delete Tensafe
cls
goto REMOVEEXCLUSIONGLRexclusion
:REMOVEEXCLUSIONGLRexclusion
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Tencent\MobileGamePC\AppMarket" /v "InstallPath" >nul 2>&1
if %ERRORLEVEL% EQU 0 goto gameloopAppMarketpathfoundGLRexclusion
if %ERRORLEVEL% EQU 1 goto gameloopAppMarketpathnotfoundGLRexclusion
:gameloopAppMarketpathfoundGLRexclusion
echo Gameloop AppMarket Found!
setlocal ENABLEEXTENSIONS
set "GameloopAppMarket_Path=HKLM\SOFTWARE\Wow6432Node\Tencent\MobileGamePC\AppMarket"
set "GameloopAppMarket_Key=InstallPath"
FOR /F "tokens=2*" %%A IN ('REG query "%GameloopAppMarket_Path%" /v "%GameloopAppMarket_Key%"') DO (set GameloopAppMarketpath=%%B)
echo %GameloopAppMarketpath%
goto continuegameloopExclutionGLRexclusion
:gameloopAppMarketpathnotfoundGLRexclusion
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Tencent\MobileGamePC\AppMarket" /v "InstallPath" >nul 2>&1
if %ERRORLEVEL% EQU 0 goto gameloopAppMarketpath2foundGLRexclusion
if %ERRORLEVEL% EQU 1 goto gameloopAppMarketpath2notfoundGLRexclusion
:gameloopAppMarketpath2foundGLRexclusion
echo Gameloop AppMarket Found!
setlocal ENABLEEXTENSIONS
set "GameloopAppMarket_Path2=HKLM\SOFTWARE\Tencent\MobileGamePC\AppMarket"
set "GameloopAppMarket_Key2=InstallPath"
FOR /F "tokens=2*" %%A IN ('REG query "%GameloopAppMarket_Path2%" /v "%GameloopAppMarket_Key2%"') DO (set GameloopAppMarketpath=%%B)
echo %GameloopAppMarketpath%
goto continuegameloopExclutionGLRexclusion
:continuegameloopExclutionGLRexclusion
set "GameloopFullPath=%GameloopAppMarketpath:~0,-10%"
echo Adding Gameloop Folder to Windows Defender Exclusion List...
powershell -NoProfile -ExecutionPolicy Bypass -c "Remove-MpPreference -ExclusionPath '%GameloopFullPath%'"
goto FinishingGameloopInstallGLRexclusion
:gameloopAppMarketpath2notfoundGLRexclusion
echo Gameloop AppMarket Path not Found!
goto FinishingGameloopInstallGLRexclusion
:FinishingGameloopInstallGLRexclusion
goto gamelooppathuninstaller
:gamelooppathuninstaller
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\MobileGamePC" /v "UninstallString" >nul 2>&1
if %ERRORLEVEL% EQU 0 goto gamelooppathfound
if %ERRORLEVEL% EQU 1 goto gamelooppathnotfound
:gamelooppathfound
echo Gameloop Uninstaller Found!
setlocal ENABLEEXTENSIONS
set "Gameloop_Path=HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\MobileGamePC"
set "Gameloop_Key=UninstallString"
FOR /F "tokens=2*" %%A IN ('REG query "%Gameloop_Path%" /v "%Gameloop_Key%"') DO (set Gameloopuninstalla=%%B)
echo %Gameloopuninstalla%
echo Uninstalling Gameloop Emulator...
"%Gameloopuninstalla%"
goto continuegameloopuninstallation
:gamelooppathnotfound
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\MobileGamePC" /v "UninstallString" >nul 2>&1
if %ERRORLEVEL% EQU 0 goto gamelooppath2found
if %ERRORLEVEL% EQU 1 goto gamelooppath2notfound
:gamelooppath2found
echo Gameloop Uninstaller Found!
setlocal ENABLEEXTENSIONS
set "Gameloop_Path2=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\MobileGamePC"
set "Gameloop_Key2=UninstallString"
FOR /F "tokens=2*" %%A IN ('REG query "%Gameloop_Path2%" /v "%Gameloop_Key2%"') DO (set Gameloopuninstallb=%%B)
echo %Gameloopuninstallb%
echo Uninstalling Gameloop Emulator...
"%Gameloopuninstallb%"
goto continuegameloopuninstallation
:continuegameloopuninstallation
cls
echo After uninsatlling Gameloop Please PRESS ENTER to continue...
pause >nul
goto gamelooppath2notfound
:gamelooppath2notfound
echo Gameloop Uninstaller not Found! Continue with Removal Process...
reg delete HKEY_USERS\S-1-5-21-4002759195-144648827-3263099209-1000\SOFTWARE\Tencent /f
reg delete HKEY_CURRENT_USER\SOFTWARE\Tencent /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Tencent /f
del /q "%WINDIR%\SysWOW64\config\systemprofile\AppData\Roaming\Tencent\*" && FOR /D %%p IN ("%WINDIR%\SysWOW64\config\systemprofile\AppData\Roaming\Tencent\*.*") DO rmdir "%%p" /s /q
RMDIR "%WINDIR%\SysWOW64\config\systemprofile\AppData\Roaming\Tencent" /S /Q
del /q "%ProgramData%\Tencent\*" && FOR /D %%p IN ("%ProgramData%\Tencent\*.*") DO rmdir "%%p" /s /q
RMDIR "%ProgramData%\Tencent" /S /Q
del /q "%AppData%\Tencent\*" && FOR /D %%p IN ("%AppData%\Tencent\*.*") DO rmdir "%%p" /s /q
RMDIR "%AppData%\Tencent" /S /Q
del /q "%USERPROFILE%\AppData\Local\Tencent\*" && FOR /D %%p IN ("%USERPROFILE%\AppData\Local\Tencent\*.*") DO rmdir "%%p" /s /q
RMDIR "%USERPROFILE%\AppData\Local\Tencent" /S /Q
del /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Tencent Software\*" && FOR /D %%p IN ("%ProgramData%\Microsoft\Windows\Start Menu\Programs\Tencent Software\*.*") DO rmdir "%%p" /s /q
RMDIR "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Tencent Software" /S /Q
setlocal enableDelayedExpansion
cls
FOR /F "tokens=* USEBACKQ" %%F IN (`fsutil fsinfo drives`) DO (
SET ogdrives=%%F
)
set drives=!ogdrives!
set drives=!drives:Drives^: =!
set drives=!drives:^:\=1!
set drives=!drives: =+!
set charms=0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
for /L %%N in (10 1 62) do (
for /F %%C in ("!charms:~%%N,1!") do (
set drives=!drives:%%C=!
)
)
set drives=!drives:~0,-1!
set /a num=!drives!
set drives=!ogdrives!
set drives=!drives:Drives^: =!
set drives=!drives:^:\=!
set drives=!drives: =!
:loop
set /a iter=!iter!+1
set /a pos=!iter!-1
set drive!iter!=!drives:~%pos%,1!
if !iter!==!num! goto oloop
goto loop
:oloop
for /L %%n in (1 1 !num!) do (
echo drive %%n is !drive%%n!
)
for /L %%n in (1 1 !num!) do (
del /q "!drive%%n!:\Temp\*" && FOR /D %%p IN ("!drive%%n!:\Temp\*.*") DO rmdir "%%p" /s /q
RMDIR "!drive%%n!:\Temp" /S /Q
pushd !drive%%n!:\
for /d /r . %%d in (txgameassistant tencent) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
popd
)
ENDLOCAL
SETLOCAL DisableDelayedExpansion
del /f /s /q "%SystemDrive%\aow_drv.log"
del /s /f /q "%SystemDrive%\Windows\SysWOW64\drivers\com.tencent.ig.bin"
del /s /f /q "C:\aow_drv.log"
del /s /f /q "D:\aow_drv.log"
del /s /f /q "E:\aow_drv.log"
del /s /f /q "F:\aow_drv.log"
del /s /f /q "G:\aow_drv.log"
powershell -c "Remove-Item '%userprofile%\Desktop\PUBG Mobile.lnk' -Force"
cls
goto cleartemp 
:GLinstaller
cls
start https://www.gameloop.com/en/game/Action/play-pubg-mobile-on-pc/
echo ------------------------------------------------------------------------ 
echo Please Install from the link above Only!
echo ------------------------------------------------------------------------ 
pause >nul 
goto GameloopMenu
:FixRemountingIssue
cls
IF EXIST "%userprofile%\DrivesUIUDTemp.txt" (
goto GLFixDrivescontinue
) ELSE (
cls
echo ERROR, Sorry Autmatic Remounting Has Failed Please Assign Drives Letters Manually.
echo Please Press ENTER KEY To Continue.
diskmgmt.msc
Pause >nul
GOTO GameloopMenu
)
:GLFixDrivescontinue
cls
echo Remounting your Drives Back to their Respective Letters... 
for /F "tokens=* USEBACKQ" %%b in (%userprofile%\DrivesUIUDTemp.txt) do mountvol %%b 
del /f /s /q "%userprofile%\DrivesLettersTemp.txt" >nul 2>&1 
del /f /s /q "%userprofile%\DrivesUIUDTemp.txt" >nul 2>&1 
echo Done! Drives are Successfully Remounted back again.
echo Press ENTER KEY to Continue.
Pause >nul
goto to GameloopMenu
:optimization
cls
setlocal ENABLEEXTENSIONS
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Tencent\MobileGamePC\UI" /v "InstallPath" >nul 2>&1
if %ERRORLEVEL% EQU 0 goto gameloopuipathfound
if %ERRORLEVEL% EQU 1 goto gameloopuipathnotfound
:gameloopuipathfound
echo Gameloop UI Found!
setlocal ENABLEEXTENSIONS
set "GameloopUI_Path=HKLM\SOFTWARE\Wow6432Node\Tencent\MobileGamePC\UI"
set "GameloopUI_Key=InstallPath"
FOR /F "tokens=2*" %%A IN ('REG query "%GameloopUI_Path%" /v "%GameloopUI_Key%"') DO (set GameloopUIpath=%%B)
echo %GameloopUIpath%
goto continuegameloopuioptimization
:gameloopuipathnotfound
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Tencent\MobileGamePC\UI" /v "InstallPath" >nul 2>&1
if %ERRORLEVEL% EQU 0 goto gameloopuipath2found
if %ERRORLEVEL% EQU 1 goto gameloopuipath2notfound
:gameloopuipath2found
echo Gameloop UI Found!
setlocal ENABLEEXTENSIONS
set "GameloopUI_Path2=HKLM\SOFTWARE\Tencent\MobileGamePC\UI"
set "GameloopUI_Key2=InstallPath"
FOR /F "tokens=2*" %%A IN ('REG query "%GameloopUI_Path2%" /v "%GameloopUI_Key2%"') DO (set GameloopUIpath=%%B)
echo %GameloopUIpath%
goto continuegameloopuioptimization
:continuegameloopuioptimization
taskkill /F /IM "aow_exe.exe" /T
taskkill /F /IM "AndroidEmulatorEn.exe" /T
taskkill /F /IM "AndroidEmulator.exe" /T
taskkill /F /IM "AndroidEmulatorEx.exe" /T
taskkill /F /IM "TBSWebRenderer.exe" /T
taskkill /F /IM "TBSWebRenderer.exe" /T
taskkill /F /IM "syzs_dl_svr.exe" /T
taskkill /F /IM "AppMarket.exe" /T
TaskKill /F /IM "QMEmulatorService.exe" /T
taskkill /f /IM "RuntimeBroker.exe" /T
taskkill /f /IM "adb.exe" /T
taskkill /f /IM "GameLoader.exe" /T
taskkill /f /IM "TSettingCenter.exe" /T
taskkill /F /IM "Auxillary.exe" /T
taskkill /F /IM "TP3Helper.exe" /T
taskkill /F /IM "tp3helper.dat" /T
taskkill /F /IM "GameDownload.exe" /T
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\AndroidEmulator.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\AndroidEmulatorEn.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\AndroidEmulatorEx.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%GameloopUIpath%\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%GameloopUIpath%\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%GameloopUIpath%\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "%GameloopUIpath%\AndroidEmulator.exe" /t REG_SZ /d "GpuPreference=2;" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "%GameloopUIpath%\AndroidEmulatorEn.exe" /t REG_SZ /d "GpuPreference=2;" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "%GameloopUIpath%\AndroidEmulatorEx.exe" /t REG_SZ /d "GpuPreference=2;" /f
goto SelectYourHardware
:SelectYourHardware
setlocal
for /f "tokens=4,5 delims=. " %%a in ('ver') do set "version=%%a%%b"


if version lss 62 (
    ::set "wmic_query=wmic desktopmonitor get screenheight, screenwidth /format:value"
    for /f "tokens=* delims=" %%@ in ('wmic desktopmonitor get screenwidth /format:value') do (
        for /f "tokens=2 delims==" %%# in ("%%@") do set "x=%%#"
    )
    for /f "tokens=* delims=" %%@ in ('wmic desktopmonitor get screenheight /format:value') do (
        for /f "tokens=2 delims==" %%# in ("%%@") do set "y=%%#"
    )

) else (
    ::wmic path Win32_VideoController get VideoModeDescription,CurrentVerticalResolution,CurrentHorizontalResolution /format:value
    for /f "tokens=* delims=" %%@ in ('wmic path Win32_VideoController get CurrentHorizontalResolution  /format:value') do (
        for /f "tokens=2 delims==" %%# in ("%%@") do set "x=%%#"
    )
    for /f "tokens=* delims=" %%@ in ('wmic path Win32_VideoController get CurrentVerticalResolution /format:value') do (
        for /f "tokens=2 delims==" %%# in ("%%@") do set "y=%%#"
    )

)
cls
echo.
echo Please Choose Your Hardware Type
echo.
echo 1. High-End PC
echo 2. Med-End PC
echo 3. Potato PC
echo 4. --Back--
echo.
set /p answer=Type the number of your option and press ENTER KEY:
if %answer%==1 goto HighEndPC
if %answer%==2 goto MedEndPC
if %answer%==3 goto PotatoPC
if %answer%==4 goto GameloopMenu
goto SelectYourHardware
:HighEndPC
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VSyncEnabled" /t REG_DWORD /d "0" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMCpuCount" /t REG_DWORD /d "8" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "UserLanguage" /t REG_SZ /d "en" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "ShaderCacheEnabled" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "RenderOptimizeEnabled" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "Region" /t REG_SZ /d "GB" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "GraphicsCardEnabled" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "HideAdvancedWatermark" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "ForceDirectX" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "com.tencent.ig_RenderQuality" /t REG_DWORD /d "2" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "com.tencent.ig_FPSLevel" /t REG_DWORD /d "7" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "com.tencent.ig_ContentScale" /t REG_DWORD /d "2" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "LocalShaderCacheEnabled" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMMemorySizeInMB" /t REG_DWORD /d "8192" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "FxaaQuality" /t REG_DWORD /d "2" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMResHeight" /t REG_DWORD /d "%y%" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMResWidth" /t REG_DWORD /d "%x%" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMDPI" /t REG_DWORD /d "480" /f

goto CREATEPUBGSHORTCUT
:MedEndPC
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VSyncEnabled" /t REG_DWORD /d "0" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMCpuCount" /t REG_DWORD /d "4" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "UserLanguage" /t REG_SZ /d "en" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "ShaderCacheEnabled" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "RenderOptimizeEnabled" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "Region" /t REG_SZ /d "GB" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "GraphicsCardEnabled" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "HideAdvancedWatermark" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "ForceDirectX" /t REG_DWORD /d "0" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "com.tencent.ig_RenderQuality" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "com.tencent.ig_FPSLevel" /t REG_DWORD /d "7" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "com.tencent.ig_ContentScale" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "LocalShaderCacheEnabled" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMMemorySizeInMB" /t REG_DWORD /d "4096" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "FxaaQuality" /t REG_DWORD /d "0" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMResHeight" /t REG_DWORD /d "%y%" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMResWidth" /t REG_DWORD /d "%x%" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMDPI" /t REG_DWORD /d "320" /f
goto CREATEPUBGSHORTCUT
:PotatoPC
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VSyncEnabled" /t REG_DWORD /d "0" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMCpuCount" /t REG_DWORD /d "0" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "UserLanguage" /t REG_SZ /d "en" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "ShaderCacheEnabled" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "RenderOptimizeEnabled" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "Region" /t REG_SZ /d "GB" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "GraphicsCardEnabled" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "HideAdvancedWatermark" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "ForceDirectX" /t REG_DWORD /d "0" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "com.tencent.ig_RenderQuality" /t REG_DWORD /d "0" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "com.tencent.ig_FPSLevel" /t REG_DWORD /d "6" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "com.tencent.ig_ContentScale" /t REG_DWORD /d "0" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "LocalShaderCacheEnabled" /t REG_DWORD /d "1" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMMemorySizeInMB" /t REG_DWORD /d "0" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "FxaaQuality" /t REG_DWORD /d "0" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMResHeight" /t REG_DWORD /d "%y%" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMResWidth" /t REG_DWORD /d "%x%" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "VMDPI" /t REG_DWORD /d "160" /f
goto CREATEPUBGSHORTCUT
:CREATEPUBGSHORTCUT
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Tencent\MobileGamePC\AppMarket" /v "InstallPath" >nul 2>&1
if %ERRORLEVEL% EQU 0 goto CREATEPUBGSHORTCUTFOUND
if %ERRORLEVEL% EQU 1 goto CREATEPUBGSHORTCUTNOTFOUND
:CREATEPUBGSHORTCUTFOUND
echo Gameloop AppMarket Found!
setlocal ENABLEEXTENSIONS
set "GameloopAppMarket3_Path=HKLM\SOFTWARE\Wow6432Node\Tencent\MobileGamePC\AppMarket"
set "GameloopAppMarket3_Key=InstallPath"
FOR /F "tokens=2*" %%A IN ('REG query "%GameloopAppMarket3_Path%" /v "%GameloopAppMarket3_Key%"') DO (set GameloopAppMarket3path=%%B)
echo %GameloopAppMarket3path%
goto continueCREATEPUBGSHORTCUT
:CREATEPUBGSHORTCUTNOTFOUND
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Tencent\MobileGamePC\AppMarket" /v "InstallPath" >nul 2>&1
if %ERRORLEVEL% EQU 0 goto CREATEPUBGSHORTCUTFOUND2
if %ERRORLEVEL% EQU 1 goto CREATEPUBGSHORTCUTNOTFOUND2
:CREATEPUBGSHORTCUTFOUND2
echo Gameloop AppMarket Found!
setlocal ENABLEEXTENSIONS
set "GameloopAppMarket4_Path2=HKLM\SOFTWARE\Tencent\MobileGamePC\AppMarket"
set "GameloopAppMarket4_Key2=InstallPath"
FOR /F "tokens=2*" %%A IN ('REG query "%GameloopAppMarket4_Path2%" /v "%GameloopAppMarket4_Key2%"') DO (set GameloopAppMarket3path=%%B)
echo %GameloopAppMarket3path%
goto continueCREATEPUBGSHORTCUT
:continueCREATEPUBGSHORTCUT
powershell -NoProfile -ExecutionPolicy Bypass -c "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%userprofile%\Desktop\PUBG Mobile.lnk'); $Shortcut.TargetPath = '%GameloopAppMarket3path%\AppMarket.exe'; $Shortcut.Arguments = '-startpkg com.tencent.ig  -from DesktopLink'; $Shortcut.IconLocation = '%GameloopAppMarket3path%\Icons\com.tencent.ig\Game.Ico'; $Shortcut.Save()"
goto FinishingCREATEPUBGSHORTCUT
:CREATEPUBGSHORTCUTNOTFOUND2
echo Gameloop AppMarket Path not Found! Please Install The Game First From Official Installer!
goto FinishingCREATEPUBGSHORTCUT
:FinishingCREATEPUBGSHORTCUT
start http://daddymadu.gg/
cls
echo Gameloop Optimization Done Successfully! Press ENTER KEY yo Continue.
pause >nul
goto EOGLO
:gameloopuipath2notfound
echo Gameloop UI Path not Found! Please Install The Game First From Official Installer!
echo Press ENTER KEY yo Continue.
pause >nul
goto EOGLO
:EOGLO
goto GameloopMenu
:TEMPMover
cls
setlocal ENABLEEXTENSIONS
set "GameloopTEMP_Path=HKCU\SOFTWARE\Tencent\MobileGamePC"
set "GameloopTEMP_Key=TempPath"
FOR /F "tokens=2*" %%A IN ('REG query "%GameloopTEMP_Path%" /v "%GameloopTEMP_Key%"') DO (set GameloopTEMPpath=%%B)
echo %GameloopTEMPpath%
set "GameloopTEMPfolder=%GameloopTEMPpath:~0,7%"
echo Killing Gameloop Related Process and Services...
taskkill /F /IM "aow_exe.exe" /T
taskkill /F /IM "AndroidEmulatorEn.exe" /T
taskkill /F /IM "AndroidEmulator.exe" /T
taskkill /F /IM "AndroidEmulatorEx.exe" /T
taskkill /F /IM "TBSWebRenderer.exe" /T
taskkill /F /IM "TBSWebRenderer.exe" /T
taskkill /F /IM "syzs_dl_svr.exe" /T
taskkill /F /IM "AppMarket.exe" /T
TaskKill /F /IM "QMEmulatorService.exe" /T
taskkill /f /IM "RuntimeBroker.exe" /T
taskkill /f /IM "adb.exe" /T
taskkill /f /IM "GameLoader.exe" /T
taskkill /f /IM "TSettingCenter.exe" /T
taskkill /F /IM "Auxillary.exe" /T
taskkill /F /IM "TP3Helper.exe" /T
taskkill /F /IM "tp3helper.dat" /T
taskkill /F /IM "GameDownload.exe" /T
net stop aow_drv
net stop QMEmulatorService
net stop Tensafe
cls
goto MOVEGlTEMPTEMPDrive
:MOVEGlTEMPTEMPDrive
cls
echo.
echo Please enter A DRIVE letter where we will MOVE your Gameloop Temp to it Ex"C,D,E,F,....etc"
echo 1 LETTER Only, No Numbers or Signs!
echo.
:SetGlTEMPTEMPDrive
set /P TEMPDrive=Enter New Drive Letter: %=%

:: REM block quotes

SET TEMPDrive | FIND """" >NUL
IF NOT ERRORLEVEL 1 SET TEMPDrive=

IF NOT DEFINED TEMPDrive GOTO invTEMPDrive

:: REM Block tilde

SET TEMPDrive | FIND "~" >NUL
IF NOT ERRORLEVEL 1 SET TEMPDrive=

IF NOT DEFINED TEMPDrive GOTO invTEMPDrive

:: REM Test for Spaces (REM out if not required)

IF NOT "%TEMPDrive%"=="%TEMPDrive: =%" GOTO invTEMPDrive

:: REM Test for all other standard Symbols. (REM out any you wish to permit)

IF NOT "%TEMPDrive%"=="%TEMPDrive:&=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:(=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:)=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:<=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:>=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:{=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:}=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:]=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:[=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:#=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:^=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:+=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:-=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:/=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:\=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:|=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:$=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:!=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:?=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:@=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:'=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:,=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:.=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:;=%" GOTO invTEMPDrive
IF NOT "%TEMPDrive%"=="%TEMPDrive:`=%" GOTO invTEMPDrive

:: REM Test length

IF NOT "%TEMPDrive:~1%"=="" GOTO invTEMPDrive

:: REM Block Numbers

Setlocal enableDelayedExpansion
FOR %%a in (0,1,2,3,4,5,6,7,8,9) DO (
IF NOT "%TEMPDrive%"=="!TEMPDrive:%%a=!" GOTO invTEMPDrive
)
ECHO you entered "%TEMPDrive%" to be your Temp Drive, Press ENTER KEY yo Continue.
pause
goto CONFIRMGlTEMPTEMPDrive

:: REM rest of your program here.

:invTEMPDrive
echo "%TEMPDrive%" - ERROR! LETTERS ONLY AND 1 LETTER TO BE ENTERED!
pause
goto SetGlTEMPTEMPDrive
:CONFIRMGlTEMPTEMPDrive
cls
SET /P yesno=Are You Sure You Want to Move Gameloop Temp Folder To %TEMPDrive%:\ Drive? [Y/N]:
IF "%yesno%"=="y" GOTO ConfirmationMoveTemp
IF "%yesno%"=="Y" GOTO ConfirmationMoveTemp
IF "%yesno%"=="n" GOTO CancelMoveTemp
IF "%yesno%"=="N" GOTO CancelMoveTemp
goto CONFIRMGlTEMPTEMPDrive
:ConfirmationMoveTemp
echo Confirmed! Moving Your Temp NOW...
IF "%GameloopTEMPfolder%"=="%TEMPDrive%:\Temp" GOTO FileMatchedError
robocopy "%GameloopTEMPfolder%" "%TEMPDrive%:\Temp" /move /E /copyall /zb /w:1 /r:4 /xo
TIMEOUT 4 >nul
del /q "%GameloopTEMPfolder%\*" && FOR /D %%p IN (%GameloopTEMPfolder%\*.*) DO rmdir "%%p" /s /q
RMDIR "%GameloopTEMPfolder%" /S /Q
Echo Setting Up Registry Path...
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "sf" /t REG_SZ /d "%TEMPDrive%:\Temp\TxGameDownload\MobileGamePCShared" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Tencent\MobileGamePC" /v "TempPath" /t REG_SZ /d %TEMPDrive%:\Temp\TxGameDownload\Component\ /f
echo Starting Gameloop Services...
sc start aow_drv
sc start QMEmulatorService
sc start Tensafe
goto GameloopMenu
:FileMatchedError
cls
echo Your Temp Folder already is %TEMPDrive%:\Temp, Cancelled!
echo Press ENTER KEY yo Continue.
Pause >nul
goto CancelMoveTemp
:CancelMoveTemp
sc start aow_drv
sc start QMEmulatorService
sc start Tensafe
eco Cancelled!
goto GameloopMenu
:ValorantGame
cls
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Riot Game valorant.live" /v "InstallLocation" >nul 2>&1
if %ERRORLEVEL% EQU 0 goto ValorantGameFound
if %ERRORLEVEL% EQU 1 goto ValorantGameNotFound
:ValorantGameFound
cls
for /f "usebackq delims=" %%a in (`
powershell -NoProfile -ExecutionPolicy Bypass -c "$ValorantGetPath = (Get-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Riot Game valorant.live' -Name InstallLocation).InstallLocation; $ValorantSetPath = ($ValorantGetPath | foreach {$_.replace('/','\')}); $ValorantSetPath"
`) do set "ValorantGamePath=%%a"
echo %ValorantGamePath%

cls
echo.
echo ====== Valorant Game Optimization ======
echo.
echo 1. Apply Optimization
echo 2. Remove Optimization
echo 3. Fix Game Freeze when ALT^+TAB
echo 4. Back
echo 5. Back to Main Menu
echo 6. Exit
echo.
echo.
set /p answer=Type the number of your option and press ENTER KEY:
if %answer%==1 goto ApplyValorantOptimization
if %answer%==2 goto RemoveValorantOptimization
if %answer%==3 goto ValorantFixALTandTAB
if %answer%==4 goto GamesOptimizer
if %answer%==5 goto Menu
if %answer%==6 goto Exit
goto ValorantGameFound
:ApplyValorantOptimization
cls
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%ValorantGamePath%\ShooterGame\Binaries\Win64\VALORANT-Win64-Shipping.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "%ValorantGamePath%\ShooterGame\Binaries\Win64\VALORANT-Win64-Shipping.exe" /t REG_SZ /d "GpuPreference=2;" /f
cls
echo Optimization Applied Successfully!
pause >nul
goto GamesOptimizer
:RemoveValorantOptimization
cls
reg DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /f
reg DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%ValorantGamePath%\ShooterGame\Binaries\Win64\VALORANT-Win64-Shipping.exe" /f
reg DELETE "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "%ValorantGamePath%\ShooterGame\Binaries\Win64\VALORANT-Win64-Shipping.exe" /f
cls
echo Optimization Removed Successfully!
pause >nul
goto GamesOptimizer
:ValorantFixALTandTAB
cls
reg DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%ValorantGamePath%\ShooterGame\Binaries\Win64\VALORANT-Win64-Shipping.exe" /f
cls
echo Fix Applied Successfully!
pause >nul
goto GamesOptimizer
:ValorantGameNotFound
cls
echo Valorant Game is Not Installed! Please Install The Game First From Official Installer!
pause >nul
goto GamesOptimizer
:AutomatedVPN
cls
echo Getting Things Ready for you, Please Wait...
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat" (
goto choiceVPNAppInstaller
) ELSE (
GOTO VPNAppInstaller
)
:choiceVPNAppInstaller
cls
for /f "usebackq delims=" %%w in (`
powershell -NoProfile -ExecutionPolicy Bypass -c "$CheckAutomatedVPNAppsVersion = Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/DaddyMadu/Windows-Optimzier/main/Updaters/Automated-VPN-Updater.txt'; $AutomatedVPNAppsVersion = ($CheckAutomatedVPNAppsVersion.Content | Out-String).Trim(); $AutomatedVPNAppsVersion"
`) do set "OnlineAutomatedVPNAppsVersion=%%w"
for /f "tokens=3" %%z in ('reg query "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v AutomatedApps') do @set "AutomatedVPNAppsVersion=%%z"
IF "%OnlineAutomatedVPNAppsVersion%" EQU "%AutomatedVPNAppsVersion%" (
echo No Update Found, Lunching script!
goto continueVPNAppInstaller
) ELSE (
echo Automated Apps Update Found v%OnlineAutomatedVPNAppsVersion%, Script is updating NOW!
powershell -NoProfile -ExecutionPolicy Bypass -c "$CheckAutomatedVPNAppsChangelog = Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/DaddyMadu/Windows-Optimzier/main/Changelogs/AutomatedVPN-Changelog.txt'; $AutomatedVPNAppsChangelog = ($CheckAutomatedVPNAppsChangelog.Content | Out-String).Trim(); $AutomatedVPNAppsChangelog.Split([Environment]::NewLine) | Select -First 20"
timeout /t 20
cls
goto VPNAppInstaller
)
:VPNAppInstaller
cls
bitsadmin /transfer "Downloading Daddy Madu Automated VPN VOIP Latest Update" /priority FOREGROUND "https://raw.githubusercontent.com/DaddyMadu/Windows-Optimzier/main/DaddyMadu-VPN-VOIP.bat" "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat" (
goto continueVPNAppInstaller
) ELSE (
GOTO alternativedownloadVPNAppInstaller
)
:alternativedownloadVPNAppInstaller
cls
powershell -c "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/DaddyMadu/Windows-Optimzier/main/DaddyMadu-VPN-VOIP.bat', '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat')"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat" (
goto continueVPNAppInstaller
) ELSE (
GOTO alternativedownload2VPNAppInstaller
)
:alternativedownload2VPNAppInstaller
cls
powershell -c "Invoke-WebRequest 'https://raw.githubusercontent.com/DaddyMadu/Windows-Optimzier/main/DaddyMadu-VPN-VOIP.bat' -OutFile '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat'"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat" (
goto continueVPNAppInstaller
) ELSE (
cls
ECHO =============================================================================================
echo Please Make Sure you DISABLED YOUR ANTIVIRUS and You HAVE INTERNET Avaliable!
echo As something is BLOCKING script from downloading latest Version Avaliable!
ECHO =============================================================================================
echo Please Press ENTER KEY to try again!
ECHO =============================================================================================
pause >nul
goto VPNAppInstaller
)
:continueVPNAppInstaller
powershell -NoProfile -ExecutionPolicy Bypass -c "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%userprofile%\Desktop\Automated VPN.lnk'); $Shortcut.TargetPath = '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat'; $Shortcut.Save()"
cls
for /f "delims== tokens=2" %%a in ('wmic os get osarchitecture /value') do (
  set arch=%%a
)
if "%arch%"=="64-bit" (
goto :x64VPNAppInstaller
) else (
goto :x86VPNAppInstaller
)
:x64VPNAppInstaller
IF EXIST "%SystemRoot%\Sysnative\cmd.exe" (
start %SystemRoot%\Sysnative\cmd.exe /c "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat"
) ELSE (
start %SystemRoot%\System32\cmd.exe /c "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat"
)
goto ExitDaddyMaduAutomatedVPN
:x86VPNAppInstaller
start %SystemRoot%\System32\cmd.exe /c "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat"
goto ExitDaddyMaduAutomatedVPN
:ExitDaddyMaduAutomatedVPN
Exit
