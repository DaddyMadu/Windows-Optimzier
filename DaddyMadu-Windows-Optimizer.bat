��&cls
@echo off
CLS
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
cd /d "%systemdrive%\Windows\System32"
mkdir "%userprofile%\AppData\Local\Temp\dmtmp">nul 2>&1 & attrib +h +s "%userprofile%\AppData\Local\Temp\dmtmp"
cls
title [ Daddy Madu ] Windows Optimizer!
color 1f
echo ... Welcome %username% to DaddyMadu Windows Optimizer ...
echo.
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat" (
goto choice
) ELSE (
GOTO downloadupdate
)
:choice
for /f "delims=" %%a in ('CertUtil -hashfile "%userprofile%\AppData\Local\Temp\dmtmp\update.txt" MD5 ^| findstr /v "MD5 CertUtil"') do set "Hashcode=%%a"
set "Hashcode=%Hashcode: =%"
powershell -c "(New-Object Net.WebClient).DownloadFile('https://git.io/JOYeU', '%userprofile%\AppData\Local\Temp\dmtmp\update.txt')"
for /f "delims=" %%a in ('CertUtil -hashfile "%userprofile%\AppData\Local\Temp\dmtmp\update.txt" MD5 ^| findstr /v "MD5 CertUtil"') do set "Hashcode2=%%a"
set "Hashcode2=%Hashcode2: =%"
IF "%Hashcode%"=="%Hashcode2%" (
goto continue
) ELSE (
echo Update Found! Script is updating NOW!
timeout /t 3 /nobreak >nul
goto downloadupdate
)
:downloadupdate
cls
del /s /f /q "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat">nul 2>&1
powershell -c "(New-Object Net.WebClient).DownloadFile('https://git.io/JOLBr', '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat')"
powershell -c "(New-Object Net.WebClient).DownloadFile('https://git.io/JOYeU', '%userprofile%\AppData\Local\Temp\dmtmp\update.txt')"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat" (
goto continue
) ELSE (
GOTO alternativedownload
)
:alternativedownload
cls
bitsadmin /transfer "Downloading Daddy Madu Windows Optimizer Latest Update" /priority FOREGROUND "https://git.io/JOLBr" "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat"
bitsadmin /transfer "Downloading Daddy Madu Updater File" /priority FOREGROUND "https://git.io/JOYeU" "%userprofile%\AppData\Local\Temp\dmtmp\update.txt"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat" (
goto continue
) ELSE (
GOTO alternativedownload2
)
:alternativedownload2
cls
powershell -c "Invoke-WebRequest https://git.io/JOLBr -OutFile %userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-Windows-Optimizer.bat"
powershell -c "Invoke-WebRequest https://git.io/JOYeU -OutFile %userprofile%\AppData\Local\Temp\dmtmp\update.txt"
goto continue
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