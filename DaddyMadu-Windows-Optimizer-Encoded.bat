��&cls
@echo off
cd /d "%systemdrive%\Windows\System32"
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
echo 5. DaddyMadu Windows10GamingFocus
echo 6. Fix Start Menu issues
echo 7. Fix and Rebuild Icons
echo 50. Gameloop Optimizer
echo 999. Exit
echo.
Echo.
Echo v3.1.20
echo.
echo.
set /p answer=Type the number of your option and press ENTER KEY:
if %answer%==1 goto cleartemp
if %answer%==2 goto malwarebytes
if %answer%==3 goto Repair
if %answer%==4 goto WiseUninstaller
if %answer%==5 goto Windows10GamingFocus
if %answer%==6 goto fixstartmenu
if %answer%==7 goto rebuildicon
if %answer%==50 goto GameloopMenu
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
echo Please restart the PC
echo ------------------------------------------------------------------------
pause >nul
goto Menu
:WiseUninstaller
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main" /v DisableFirstRunCustomize /t REG_DWORD /d 2 /f >nul 2>&1
for /f "usebackq delims=" %%a in (`
  powershell -NoProfile -ExecutionPolicy Bypass -c "$downloadwuiPage = Invoke-WebRequest -Uri https://www.wisecleaner.com/wise-program-uninstaller.html; $DownloadwuiLink = ($downloadwuiPage.ParsedHtml.getElementsByTagName('a') | ?{$_.id -match 'free-download'} | select @{expression={$_.href}} | ft -hide | Out-String).Trim(); $DownloadwuiLink"
`) do set "DownloadwuiLink=%%a"
for /f "usebackq delims=" %%b in (`
  powershell -NoProfile -ExecutionPolicy Bypass -c "$downloadwuiPage = Invoke-WebRequest -Uri https://www.wisecleaner.com/wise-program-uninstaller.html; $DownloadwuiLink = ($downloadwuiPage.ParsedHtml.getElementsByTagName('a') | ?{$_.id -match 'free-download'} | select @{expression={$_.href}} | ft -hide | Out-String).Trim(); $DownloadwuiLink; [System.IO.Path]::GetFileName(("$DownloadwuiLink"))"
`) do set "FilewuiName=%%b"
echo File Name: %FilewuiName%
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
Echo New Update %FilewuiName% Found, Uodating NOW!
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
echo Deleting Wise Program Uninstaller Source Files...
del /f /s /q "%systemdrive%\%FilewuiName%" >nul 2>&1
start http://daddymadu.gg/
cls
echo ------------------------------------------------------------------------
echo Process Completed Successfully. press ENTER KEY to Continue!
echo ------------------------------------------------------------------------
pause >nul
goto Menu 
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
pause >nul
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
echo Please restart the PC
echo ------------------------------------------------------------------------
pause >nul
goto Menu
:rebuildicon
set iconcache=%localappdata%\IconCache.db
set iconcache_x=%localappdata%\Microsoft\Windows\Explorer\iconcache*

echo.
echo The explorer process must be temporarily killed before deleting the IconCache.db file. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
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
SET "keepfile2=update.txt"
SET "keepfile3=DaddyMadu-Windows-Optimizer.ps1"
SET "keepdir=dmtmp"
FOR /d %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
FOR %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" IF /i NOT "%%~nxa"=="%keepfile2%" IF /i NOT "%%~nxa"=="%keepfile3%" DEL /S /F /Q "%%a"
SETLOCAL
SET "sourcedir=%userprofile%\AppData\Local\Temp\dmtmp"
SET "keepfile=DaddyMadu-Windows-Optimizer.bat"
SET "keepfile2=update.txt"
SET "keepfile3=DaddyMadu-Windows-Optimizer.ps1"
SET "keepdir=dmtmp"
FOR /d %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q /F "%%a"
FOR %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" IF /i NOT "%%~nxa"=="%keepfile2%" IF /i NOT "%%~nxa"=="%keepfile3%" DEL /S /F /Q "%%a"
SETLOCAL
SET "sourcedir=%userprofile%\Local Settings\Temp"
SET "keepfile=DaddyMadu-Windows-Optimizer.bat"
SET "keepfile2=update.txt"
SET "keepfile3=DaddyMadu-Windows-Optimizer.ps1"
SET "keepdir=dmtmp"
FOR /d %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q "%%a"
FOR %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" IF /i NOT "%%~nxa"=="%keepfile2%" IF /i NOT "%%~nxa"=="%keepfile3%" DEL /S /F /Q "%%a"
SETLOCAL
SET "sourcedir=%userprofile%\Local Settings\Temp\dmtmp"
SET "keepfile=DaddyMadu-Windows-Optimizer.bat"
SET "keepfile2=update.txt"
SET "keepfile3=DaddyMadu-Windows-Optimizer.ps1"
SET "keepdir=dmtmp"
FOR /d %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepdir%" RD /S /Q /F "%%a"
FOR %%a IN ("%sourcedir%\*") DO IF /i NOT "%%~nxa"=="%keepfile%" IF /i NOT "%%~nxa"=="%keepfile2%" IF /i NOT "%%~nxa"=="%keepfile3%" DEL /S /F /Q "%%a"
del /f /s /q "%userprofile%\recent\*.*"
del /f /s /q "%windir%\Temp\*.*"
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
  powershell -NoProfile -ExecutionPolicy Bypass -c "$downloadwcPage = Invoke-WebRequest -Uri https://www.wisecleaner.com/wise-registry-cleaner.html; $DownloadwcLink = ($downloadwcPage.ParsedHtml.getElementsByTagName('a') | ?{$_.id -match 'free-download'} | select @{expression={$_.href}} | ft -hide | Out-String).Trim(); $DownloadwcLink"
`) do set "DownloadwcLink=%%a"
for /f "usebackq delims=" %%b in (`
  powershell -NoProfile -ExecutionPolicy Bypass -c "$downloadwcPage = Invoke-WebRequest -Uri https://www.wisecleaner.com/wise-registry-cleaner.html; $DownloadwcLink = ($downloadwcPage.ParsedHtml.getElementsByTagName('a') | ?{$_.id -match 'free-download'} | select @{expression={$_.href}} | ft -hide | Out-String).Trim(); $DownloadwcLink; [System.IO.Path]::GetFileName(("$DownloadwcLink"))"
`) do set "FilewcName=%%b"
echo File Name: %FilewcName%
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
%DownloadwcLink%
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
Echo New Update %FilewcName% Found, Updating NOW!
timeout /t 3 /nobreak >nul
goto Confirmationwrc
)
:wrcscanandclean
cls
echo Cleaning Registry using Wise Registry Cleaner...
"%systemdrive%\Program Files (x86)\Wise\Wise Registry Cleaner\WiseRegCleaner.exe" -a -safe
del /f /s /q "%SystemDrive%\%FilewcName%" >nul 2>&1
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
:GameloopMenu
cls
title [ Daddy Madu ] Gameloop Optimizer!
echo ... Welcome %username% to DaddyMadu Gameloop Optimizer ...
echo.
echo 1. Force Stop All Gameloop Emulator Process
echo 2. Gameloop Emulator Optimization for no FPS Drop
echo TYPE "remove". Compelete Uninstall Gameloop Emulator Leftovers
echo 3. Install Latest Gameloop from Official Link Gameloop.com
echo 4. Main Menu
echo 5. Exit
echo.
set /p answer=Type the number of your option and press ENTER KEY:
if %answer%==1 goto forcestop
if %answer%==2 goto optimization
if %answer%==remove goto GLuninstaller
if %answer%==3 goto GLinstaller
if %answer%==4 goto Menu
if %answer%==5 goto Exit
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
cls
goto cleartemp 
:GLinstaller
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main" /v DisableFirstRunCustomize /t REG_DWORD /d 2 /f >nul 2>&1
for /f "usebackq delims=" %%a in (`
  powershell -NoProfile -ExecutionPolicy Bypass -c "$downloadglPage = Invoke-WebRequest -Uri https://www.gameloop.com/en/game/fps/play-pubg-mobile-on-pc; $DownloadglLink = ($downloadglPage.ParsedHtml.getElementsByTagName('a') | ?{$_.id -match 'download'} | select @{expression={$_.href}} | Select-Object -Skip 1 | ft -hide | Out-String).Trim(); $DownloadglLink"
`) do set "DownloadglLink=%%a"
for /f "usebackq delims=" %%b in (`
  powershell -NoProfile -ExecutionPolicy Bypass -c "$downloadglPage = Invoke-WebRequest -Uri https://www.gameloop.com/en/game/fps/play-pubg-mobile-on-pc; $DownloadglLink = ($downloadglPage.ParsedHtml.getElementsByTagName('a') | ?{$_.id -match 'download'} | select @{expression={$_.href}} | Select-Object -Skip 1 | ft -hide | Out-String).Trim(); $DownloadglLink; [System.IO.Path]::GetFileName(("$DownloadglLink"))"
`) do set "FileGlName=%%b"
cls
SET /P yesno=Do you want to install Gameloop From Official Website? [Y/N]:
IF "%yesno%"=="y" GOTO ConfirmationGLI
IF "%yesno%"=="Y" GOTO ConfirmationGHI
IF "%yesno%"=="n" GOTO EndGLI
IF "%yesno%"=="N" GOTO EndGLI
goto GLinstaller
:ConfirmationGLI
cls
ECHO Grapping Gameloop Official Latest Version Link...
echo %DownloadglLink%
echo Downloading Gameloop %FileGlName% ...
bitsadmin /transfer "Downloading Gameloop Official Latest Version" /priority FOREGROUND "%DownloadglLink%" "%systemdrive%\%FileGlName%"
IF EXIST "%systemdrive%\%FileGlName%" (
goto GLIcontinue
) ELSE (
GOTO alternativeGLIdownload
)
:alternativeGLIdownload
powershell -c "(New-Object Net.WebClient).DownloadFile('%DownloadglLink%', '%systemdrive%\%FileGlName%')"
:GLIcontinue
goto chooseGtemp
:chooseGtemp
cls
echo ------------------------------------------------------------------------
Powershell -c "Write-Host 'PLEASE DISABLE YOUR AntiVirus to avoid any issues during installation process!' -ForegroundColor Red -BackgroundColor Black"
echo ------------------------------------------------------------------------
SET /P yesno=Do you want to Force Gameloop Temp Folder on Windows C: Drive? [Y/N]:
IF "%yesno%"=="y" GOTO yesGtemp
IF "%yesno%"=="Y" GOTO yesGtemp
IF "%yesno%"=="n" GOTO noGtemp
IF "%yesno%"=="N" GOTO noGtemp
goto chooseGtemp
:yesGtemp
cls
del /f /s /q "%userprofile%\DrivesLettersTemp.txt" >nul 2>&1
del /f /s /q "%userprofile%\DrivesUIUDTemp.txt" >nul 2>&1
SETLOCAL ENABLEDELAYEDEXPANSION 
set "LocalDrives=wmic logicaldisk where DriveType^="3" Get DeviceID"
echo Getting Drive Letters...
for /f "skip=1" %%i in ('%LocalDrives% ^| findstr /r /v "^$"') do (
echo %%i>>%userprofile%\DrivesLettersTemp.txt
echo %%i Drive is found.
)
echo Getting Drives UIUD...
for /F "tokens=* USEBACKQ" %%q in (%userprofile%\DrivesLettersTemp.txt) do (
powershell -c "Write-Host -NoNewline '%%q'">>%userprofile%\DrivesUIUDTemp.txt
mountvol %%q /L>>%userprofile%\DrivesUIUDTemp.txt
)
echo Dismounting Drives Letters...
for /F "tokens=* USEBACKQ" %%i in (%userprofile%\DrivesLettersTemp.txt) do mountvol %%i /P >nul 2>&1
echo.
echo Installing Gameloop Official Latest Version...
"%systemdrive%\%FileGlName%"
TIMEOUT 20 >nul
echo.
cls
echo ------------------------------------------------------------------------
Powershell -c "Write-Host 'Please Download Gameloop Engine First and after it Finished Press ENTER KEY!' -ForegroundColor Red -BackgroundColor Black"
echo ------------------------------------------------------------------------
pause >nul
echo Remounting your Drives Back to their Respective Letters...
for /F "tokens=* USEBACKQ" %%b in (%userprofile%\DrivesUIUDTemp.txt) do mountvol %%b
del /f /s /q "%userprofile%\DrivesLettersTemp.txt" >nul 2>&1
del /f /s /q "%userprofile%\DrivesUIUDTemp.txt" >nul 2>&1
echo Done!
SETLOCAL DisableDelayedExpansion
ENDLOCAL
Goto EOFGLI
:noGtemp
goto GLINoTMPcontinue
:GLINoTMPcontinue
cls
echo Installing Gameloop Official Latest Version...
"%systemdrive%\%FileGlName%"
TIMEOUT 10 >nul
goto EOFGLI
:EndGLI
cls
ECHO Cancelled! 
del /f /s /q "%SystemDrive%\%FileGlName%" >nul 2>&1
goto GameloopMenu
:EOFGLI
cls
del /f /s /q "%SystemDrive%\%FileGlName%" >nul 2>&1
echo ------------------------------------------------------------------------
echo Installed Successfully. press ENTER KEY to Continue!
echo ------------------------------------------------------------------------
pause >nul
goto GameloopMenu 
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
start http://daddymadu.gg/
cls
echo Gameloop Optimization Done Successfully, Please RESTART your Emulator!
pause >nul
goto EOGLO
:gameloopuipath2notfound
echo Gameloop UI Path not Found! Please Install The Game First From Official Installer!
pause >nul
goto EOGLO
:EOGLO
SETLOCAL DISABLEEXTENSIONS
ENDLOCAL
goto GameloopMenu