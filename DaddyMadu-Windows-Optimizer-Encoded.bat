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
echo 1. Clear All Temp Folders, logs, chks and Caches and Fix DNS problems
echo 2. Force Stop All Gameloop Emulator Process
echo 3. Gameloop Emulator Optimization for no FPS Drop
echo 44. Compelete Uninstall Gameloop Emulator Leftovers
echo 77. Install and scan system with MalwareBytes
echo 99. DaddyMadu Windows10GamingFocus
echo 5. Exit
echo.
set /p answer=Type the number of your option and press ENTER KEY:
if %answer%==1 goto cleartemp
if %answer%==2 goto forcestop
if %answer%==3 goto optimization
if %answer%==44 goto uninstaller
if %answer%==77 goto malwarebytes
if %answer%==99 goto Windows10GamingFocus
if %answer%==5 goto Exit
:Exit
cls
echo Thank you for using Daddy Madu Gameloop Optimizer and Uninstaller!
echo Press Enter from your keyboard to close this program.
echo.
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
pause >nul
exit /b
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
cls
echo All Gameloop Process Stopped Successfully. press ENTER KEY to Continue!
pause >nul
goto Menu
:uninstaller
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
net stop aow_drv
net stop QMEmulatorService
net stop Tensafe
sc delete aow_drv
sc delete QMEmulatorService
sc delete Tensafe
cls
appwiz.cpl
echo After uninsatlling Gameloop from AddRemove Programs please press Enter to continue...
pause >nul
reg delete HKEY_USERS\S-1-5-21-4002759195-144648827-3263099209-1000\SOFTWARE\Tencent /f
reg delete HKEY_CURRENT_USER\SOFTWARE\Tencent /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Tencent /f
del /q "C:\Temp\*" && FOR /D %%p IN ("C:\Temp\*.*") DO rmdir "%%p" /s /q
RMDIR "C:\Temp" /S /Q
del /q "D:\Temp\*" && FOR /D %%p IN ("D:\Temp\*.*") DO rmdir "%%p" /s /q
RMDIR "D:\Temp" /S /Q
del /q "E:\Temp\*" && FOR /D %%p IN ("E:\Temp\*.*") DO rmdir "%%p" /s /q
RMDIR "E:\Temp" /S /Q
del /q "F:\Temp\*" && FOR /D %%p IN ("F:\Temp\*.*") DO rmdir "%%p" /s /q
RMDIR "F:\Temp" /S /Q
del /q "H:\Temp\*" && FOR /D %%p IN ("H:\Temp\*.*") DO rmdir "%%p" /s /q
RMDIR "H:\Temp" /S /Q
del /q "G:\Temp\*" && FOR /D %%p IN ("G:\Temp\*.*") DO rmdir "%%p" /s /q
RMDIR "G:\Temp" /S /Q
del /q "J:\Temp\*" && FOR /D %%p IN ("J:\Temp\*.*") DO rmdir "%%p" /s /q
RMDIR "J:\Temp" /S /Q
del /q "M:\Temp\*" && FOR /D %%p IN ("M:\Temp\*.*") DO rmdir "%%p" /s /q
RMDIR "M:\Temp" /S /Q
del /q "I:\Temp\*" && FOR /D %%p IN ("I:\Temp\*.*") DO rmdir "%%p" /s /q
RMDIR "I:\Temp" /S /Q
del /q "K:\Temp\*" && FOR /D %%p IN ("K:\Temp\*.*") DO rmdir "%%p" /s /q
RMDIR "K:\Temp" /S /Q
del /q "L:\Temp\*" && FOR /D %%p IN ("L:\Temp\*.*") DO rmdir "%%p" /s /q
RMDIR "L:\Temp" /S /Q
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
pushd C:\
for /d /r . %%d in (txgameassistant tencent) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
popd
pushd D:\
for /d /r . %%d in (txgameassistant tencent) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
popd
pushd E:\
for /d /r . %%d in (txgameassistant tencent) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
popd
pushd F:\
for /d /r . %%d in (txgameassistant tencent) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
popd
pushd G:\
for /d /r . %%d in (txgameassistant tencent) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
popd
pushd H:\
for /d /r . %%d in (txgameassistant tencent) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
popd
pushd I:\
for /d /r . %%d in (txgameassistant tencent) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
popd
pushd L:\
for /d /r . %%d in (txgameassistant tencent) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
popd
pushd M:\
for /d /r . %%d in (txgameassistant tencent) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
popd
pushd K:\
for /d /r . %%d in (txgameassistant tencent) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
popd
del /f /s /q "%SystemDrive%\aow_drv.log"
del /s /f /q "C:\Windows\SysWOW64\drivers\com.tencent.ig.bin"
del /s /f /q "C:\aow_drv.log"
del /s /f /q "D:\aow_drv.log"
del /s /f /q "E:\aow_drv.log"
del /s /f /q "F:\aow_drv.log"
del /s /f /q "G:\aow_drv.log"
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
pushd "%userprofile%\Local Settings\Temp" || exit /B 1
for /D %%D in ("*") do (
    if /I not "%%~nxD"=="DaddyMadu-Windows-Optimizer.bat" rd /S /Q "%%~D"
)
for %%F in ("*") do (
    del "%%~F"
)
popd
del /f /s /q "%userprofile%\recent\*.*"
del /f /s /q "%windir%\Temp\*.*"
pushd "%userprofile%\AppData\Local\Temp" || exit /B 1
for /D %%D in ("*") do (
    if /I not "%%~nxD"=="DaddyMadu-Windows-Optimizer.bat" rd /S /Q "%%~D"
)
for %%F in ("*") do (
    del "%%~F"
)
popd
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
ipconfig /registerdns
timeout /t 10 /nobreak >nul
CLS
SET /P yesno=Do you want to install and clean your PC with Wise Registry Cleaner? [Y/N]:
IF "%yesno%"=="y" GOTO Confirmation
IF "%yesno%"=="Y" GOTO Confirmation
IF "%yesno%"=="n" GOTO End
IF "%yesno%"=="N" GOTO End
:Confirmation
echo Downloading Wise Registry Cleaner...
bitsadmin /transfer "Downloading Wise Registry Cleaner" "https://downloads.wisecleaner.com/soft/WRCFree_10.3.4.693.exe" "%systemdrive%\WRCFree_10.3.4.693.exe"
echo Installing Wise Registry Cleaner...
"%systemdrive%\WRCFree_10.3.4.693.exe" /VERYSILENT
TIMEOUT 10 >nul
echo Cleaning Registry using Wise Registry Cleaner...
"%systemdrive%\Program Files (x86)\Wise\Wise Registry Cleaner\WiseRegCleaner.exe" -a -safe
echo Uninstalling Wise Registry Cleaner...
"%systemdrive%\Program Files (x86)\Wise\Wise Registry Cleaner\unins000.exe" /VERYSILENT
echo Deleting Wise Registry Cleaner Source Files...
del /f /s /q "%SystemDrive%\WRCFree_10.3.4.693.exe"
echo Processed Successfully!
GOTO EOF
:End    
ECHO Moving to next step...     
:EOF
start http://daddymadu.gg/
cls
echo ------------------------------------------------------------------------
echo Please restart the PC and Run this Option one more time. press ENTER KEY to Continue!
echo ------------------------------------------------------------------------
SET /P yesno=Do you want to Reboot this machine NOW? [Y/N]:
IF "%yesno%"=="y" GOTO Confirmation
IF "%yesno%"=="Y" GOTO Confirmation
IF "%yesno%"=="n" GOTO End
IF "%yesno%"=="N" GOTO End
:Confirmation
ECHO System is going to Reboot now    
shutdown /r /f /t 0
GOTO EOF
:End
ECHO System Reboot cancelled
TIMEOUT 5 >nul
:EOF
cls
echo Processed Successfully!
echo ------------------------------------------------------------------------
echo Please restart the PC and Run this Option one more time. press ENTER KEY to Continue!
echo ------------------------------------------------------------------------
pause >nul
goto Menu 
:optimization
cls
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\AndroidEmulator.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\AndroidEmulatorEn.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\AndroidEmulatorEx.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "D:\Program Files\TxGameAssistant\ui\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "D:\Program Files\TxGameAssistant\ui\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "D:\Program Files\TxGameAssistant\ui\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files\TxGameAssistant\ui\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files\TxGameAssistant\ui\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files\TxGameAssistant\ui\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "E:\Program Files\TxGameAssistant\ui\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "E:\Program Files\TxGameAssistant\ui\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "E:\Program Files\TxGameAssistant\ui\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "F:\Program Files\TxGameAssistant\ui\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "F:\Program Files\TxGameAssistant\ui\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "F:\Program Files\TxGameAssistant\ui\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "D:\Program Files (x86)\TxGameAssistant\ui\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "D:\Program Files (x86)\TxGameAssistant\ui\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "D:\Program Files (x86)\TxGameAssistant\ui\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files (x86)\TxGameAssistant\ui\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files (x86)\TxGameAssistant\ui\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files (x86)\TxGameAssistant\ui\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "E:\Program Files (x86)\TxGameAssistant\ui\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "E:\Program Files (x86)\TxGameAssistant\ui\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "E:\Program Files (x86)\TxGameAssistant\ui\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "F:\Program Files (x86)\TxGameAssistant\ui\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "F:\Program Files (x86)\TxGameAssistant\ui\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "F:\Program Files (x86)\TxGameAssistant\ui\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "D:\TxGameAssistant\ui\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "D:\TxGameAssistant\ui\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "D:\TxGameAssistant\ui\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\TxGameAssistant\ui\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\TxGameAssistant\ui\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\TxGameAssistant\ui\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "E:\TxGameAssistant\ui\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "E:\TxGameAssistant\ui\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "E:\TxGameAssistant\ui\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "F:\TxGameAssistant\ui\AndroidEmulator.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "F:\TxGameAssistant\ui\AndroidEmulatorEn.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
reg ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "F:\TxGameAssistant\ui\AndroidEmulatorEx.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f
start http://daddymadu.gg/
cls
echo Gameloop Optimization Applied Successfully!
echo ------------------------------------------------------------------------
echo Please restart your PC Before Running The Game. press ENTER KEY to Continue!
echo ------------------------------------------------------------------------
pause >nul
goto Menu 
:Windows10GamingFocus
cls
start /wait powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('http://tweaks.daddymadu.gg')"
cls
echo DaddyMadu Windows10GamingFocus Applied Successfully!
echo ------------------------------------------------------------------------
echo Please restart your PC!
echo ------------------------------------------------------------------------
SET /P yesno=Do you want to Reboot this machine NOW? [Y/N]:
IF "%yesno%"=="y" GOTO Confirmation
IF "%yesno%"=="Y" GOTO Confirmation
IF "%yesno%"=="n" GOTO End
IF "%yesno%"=="N" GOTO End
:Confirmation
ECHO System is going to Reboot now    
shutdown /r /f /t 0
GOTO EOF
:End
ECHO System Reboot cancelled
TIMEOUT 5 >nul
:EOF
cls
echo Please restart your PC. press ENTER KEY to Continue!
pause >nul
goto Menu 
:malwarebytes
IF EXIST "%ProgramFiles%\Malwarebytes\Anti-Malware\mbam.exe" (
  GOTO scananduninstall
) ELSE (
 GOTO Downloadmalwarebytes
)
:Downloadmalwarebytes
echo Downloading MalwareBytes...
bitsadmin /transfer "Downloading MalwareBytes" "https://data-cdn.mbamupdates.com/web/mb4-setup-consumer/MBSetup.exe" "%systemdrive%\MBSetup.exe"
echo Installing MalwareBytes...
"%systemdrive%\MBSetup.exe" /VERYSILENT /NORESTART
TIMEOUT 10 >nul
GOTO scananduninstall
:scananduninstall
echo Scanning your system with MalwareBytes...
"%ProgramFiles%\Malwarebytes\Anti-Malware\mbam.exe" /scan -full -silent
SET /P yesno=Do you want to Uninstall Malwarebytes? [Y/N]:
IF "%yesno%"=="y" GOTO Confirmation
IF "%yesno%"=="Y" GOTO Confirmation
IF "%yesno%"=="n" GOTO End
IF "%yesno%"=="N" GOTO End
:Confirmation   
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
pushd "%userprofile%\Local Settings\Temp" || exit /B 1
for /D %%D in ("*") do (
    if /I not "%%~nxD"=="DaddyMadu-Windows-Optimizer.bat" rd /S /Q "%%~D"
)
for %%F in ("*") do (
    del "%%~F"
)
popd
del /f /s /q "%userprofile%\recent\*.*"
del /f /s /q "%windir%\Temp\*.*"
pushd "%userprofile%\AppData\Local\Temp" || exit /B 1
for /D %%D in ("*") do (
    if /I not "%%~nxD"=="DaddyMadu-Windows-Optimizer.bat" rd /S /Q "%%~D"
)
for %%F in ("*") do (
    del "%%~F"
)
popd
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
ipconfig /registerdns
timeout /t 10 /nobreak >nul
cls
SET /P yesno=Do you want to install and clean your PC with Wise Registry Cleaner? [Y/N]:
IF "%yesno%"=="y" GOTO Confirmation
IF "%yesno%"=="Y" GOTO Confirmation
IF "%yesno%"=="n" GOTO End
IF "%yesno%"=="N" GOTO End
:Confirmation
echo Downloading Wise Registry Cleaner...
bitsadmin /transfer "Downloading Wise Registry Cleaner" "https://downloads.wisecleaner.com/soft/WRCFree_10.3.4.693.exe" "%systemdrive%\WRCFree_10.3.4.693.exe"
echo Installing Wise Registry Cleaner...
"%systemdrive%\WRCFree_10.3.4.693.exe" /VERYSILENT
TIMEOUT 10 >nul
echo Cleaning Registry using Wise Registry Cleaner...
"%systemdrive%\Program Files (x86)\Wise\Wise Registry Cleaner\WiseRegCleaner.exe" -a -safe
echo Uninstalling Wise Registry Cleaner...
"%systemdrive%\Program Files (x86)\Wise\Wise Registry Cleaner\unins000.exe" /VERYSILENT
echo Deleting Wise Registry Cleaner Source Files...
del /f /s /q "%SystemDrive%\WRCFree_10.3.4.693.exe"
echo Processed Successfully!
GOTO EOF
:End
ECHO Moving to next step...
TIMEOUT 5 >nul
:EOF
start http://daddymadu.gg/
cls
echo Processed Successfully!
echo ------------------------------------------------------------------------
echo Please restart the PC. press ENTER KEY to Continue!
echo ------------------------------------------------------------------------
pause >nul
goto Menu 
