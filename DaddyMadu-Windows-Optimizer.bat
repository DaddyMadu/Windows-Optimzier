��&cls
@echo off
 ECHO.
 ECHO =============================
 ECHO Running Admin shell
 ECHO =============================

:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~0"
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
  ECHO.
  ECHO **************************************
  ECHO Invoking UAC for Privilege Escalation
  ECHO **************************************

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"

  if '%cmdInvoke%'=='1' goto InvokeCmd 

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

 ::::::::::::::::::::::::::::
 ::START
 ::::::::::::::::::::::::::::
title [ Daddy Madu ] Windows Optimizer!
color 1f
reg ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t REG_DWORD /d "2" /f >nul 2>&1
reg ADD "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v "LuncherVersion" /t REG_SZ /d "2.0.3" /f >nul 2>&1
mkdir "%userprofile%\AppData\Local\Temp\dmtmp">nul 2>&1 & attrib +h +s "%userprofile%\AppData\Local\Temp\dmtmp"
for /f "tokens=3" %%z in ('reg query "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v LuncherVersion') do @set "CurrentVersion=%%z"
for %%i in ("%~0.") do SET "CurrentScriptPath=%%~fi"
echo Currently Running From  %CurrentScriptPath%
for /f "usebackq delims=" %%w in (`
powershell -NoProfile -ExecutionPolicy Bypass -c "$CheckLuncherVersion = Invoke-WebRequest -Uri https://git.io/JOFKV; $LuncherVersion = ($CheckLuncherVersion.Content | Out-String).Trim(); $LuncherVersion"
`) do set "OnlineLuncherVersion=%%w"
IF %OnlineLuncherVersion% EQU %CurrentVersion% (
echo No Update Avaliable!
goto Continueafterluncherupdatecheck
) ELSE (
echo Update Found, Updating Luncher NOW^!
timeout /t 3 /nobreak >nul
goto downloadupdateluncher
)
:downloadupdateluncher
cls
del /s /f /q "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Luncher.bat">nul 2>&1
bitsadmin /transfer "Downloading Luncher Latest Update" /priority FOREGROUND "https://git.io/JOFPg" "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Luncher.bat"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Luncher.bat" (
goto Continueafterluncherupdatedownloaded
) ELSE (
GOTO alternativedownloadluncher
)
:alternativedownloadluncher
cls
powershell -c "(New-Object Net.WebClient).DownloadFile('https://git.io/JOFPg', '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Luncher.bat')"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Luncher.bat" (
goto Continueafterluncherupdatedownloaded
) ELSE (
GOTO alternativedownloadluncher2
)
:alternativedownloadluncher2
cls
powershell -c "Invoke-WebRequest https://git.io/JOFPg -OutFile %userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Luncher.bat"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Luncher.bat" (
goto Continueafterluncherupdatedownloaded
) ELSE (
cls
ECHO =============================================================================================
echo Please Make Sure you DISABLED YOUR ANTIVIRUS and You HAVE INTERNET Avaliable!
echo As something is BLOCKING script from downloading latest Version Avaliable!
ECHO =============================================================================================
echo Please Press ENTER KEY to try again!
ECHO =============================================================================================
pause >nul
goto downloadupdateluncher
)
:Continueafterluncherupdatedownloaded
powershell -NoProfile -ExecutionPolicy Bypass -c "Copy-Item -Path '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Luncher.bat' -Destination '%CurrentScriptPath%' -Force"
exit
:Continueafterluncherupdatecheck
cd /d "%systemdrive%\Windows\System32"
cls
echo ... Welcome %username% to DaddyMadu Windows Optimizer ...
echo.
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat" (
goto choice
) ELSE (
GOTO downloadupdate
)
:choice
for /f "usebackq delims=" %%w in (`
powershell -NoProfile -ExecutionPolicy Bypass -c "$CheckOptimizerVersion = Invoke-WebRequest -Uri https://git.io/JOYeU; $OptimizerVersion = ($CheckOptimizerVersion.Content | Out-String).Trim(); $OptimizerVersion"
`) do set "OnlineOptimizerVersion=%%w"
for /f "tokens=3" %%z in ('reg query "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v OptimizerVersion') do @set "OptimizerVersion=%%z"
IF "%OnlineOptimizerVersion%" EQU "%OptimizerVersion%" (
echo No Update Found, Lunching script!
timeout /t 1 /nobreak >nul
goto continue
) ELSE (
echo Update Found, Script is updating NOW!
timeout /t 3 /nobreak >nul
goto downloadupdate
)
:downloadupdate
cls
del /s /f /q "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat">nul 2>&1
bitsadmin /transfer "Downloading Daddy Madu Windows Optimizer Latest Update" /priority FOREGROUND "https://git.io/JOLBr" "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat" (
goto continue
) ELSE (
GOTO alternativedownload
)
:alternativedownload
cls
powershell -c "(New-Object Net.WebClient).DownloadFile('https://git.io/JOLBr', '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat')"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat" (
goto continue
) ELSE (
GOTO alternativedownload2
)
:alternativedownload2
cls
powershell -c "Invoke-WebRequest https://git.io/JOLBr -OutFile %userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat" (
goto continue
) ELSE (
cls
ECHO =============================================================================================
echo Please Make Sure you DISABLED YOUR ANTIVIRUS and You HAVE INTERNET Avaliable!
echo As something is BLOCKING script from downloading latest Version Avaliable!
ECHO =============================================================================================
echo Please Press ENTER KEY to try again!
ECHO =============================================================================================
pause >nul
goto downloadupdate
)
:continue
cls
for /f "delims== tokens=2" %%a in ('wmic os get osarchitecture /value') do (
  set arch=%%a
)
if "%arch%"=="64-bit" (
goto :x64
) else (
goto :x86
)
:x64
IF EXIST "%SystemRoot%\Sysnative\cmd.exe" (
start %SystemRoot%\Sysnative\cmd.exe /c "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat"
) ELSE (
start %SystemRoot%\System32\cmd.exe /c "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat"
)
goto :eof
:x86
start %SystemRoot%\System32\cmd.exe /c "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat"
goto :eof
pause