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
 mode 200 
title [ Daddy Madu ] Autmated VPN and VOIP! 
color 1f 
reg ADD "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v "AutomatedVPN" /t REG_SZ /d "3.0.4" /f >nul 2>&1 
for /f "tokens=3" %%z in ('reg query "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v AutomatedVPN') do @set "CurrentVersion=%%z" 
mkdir "%userprofile%\AppData\Local\Temp\dmtmp">nul 2>&1 & attrib +h +s "%userprofile%\AppData\Local\Temp\dmtmp" 
set "ScriptsFullPath=%userprofile%\AppData\Local\Temp\dmtmp"
set "CurrentRunningScript=%~dpn0.bat"
set "ScriptsBackupFile=%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIPBK.bat"
set "ScriptMainFile=%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat"
powershell -NoProfile -ExecutionPolicy Bypass -c "Add-MpPreference -ExclusionPath '%ScriptsFullPath%'">nul 2>&1 
:checkifrunningfromMainorno
IF "%CurrentRunningScript%" EQU "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat" ( 
goto PremiumsubscriptionChoice
) ELSE ( 
 IF "%CurrentRunningScript%" EQU "%ScriptsBackupFile%" ( 
 goto PremiumsubscriptionChoice
 ) ELSE (
powershell -c "Copy-Item '%CurrentRunningScript%' -Destination '%ScriptMainFile%' -Recurse -Force"
timeout /t 3 /nobreak >nul
powershell -NoProfile -ExecutionPolicy Bypass -c "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%userprofile%\Desktop\Automated VPN.lnk'); $Shortcut.TargetPath = '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat'; $Shortcut.Save()"
start /b powershell -c "Remove-Item -Path %CurrentRunningScript% -Force -ea silentlycontinue | Out-Null" & start /b %ScriptMainFile%
)
) 
goto PremiumsubscriptionChoice
:PremiumsubscriptionChoice
setlocal enableDelayedExpansion
(Set LF=^
%Null%
)
for /l %%N in (3 -1 1) do (
  set /a "min=%%N/60, sec=%%N%%60, n-=1"
  if !sec! lss 3 set sec=0!sec!
  cls
  choice /c:CN1 /n /m "Continue in !min!:!sec! - Press N to Continue Now, or C to put your Premium DaddyMadu VPN subscription.!LF!^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=!LF!Make Sure to add This Script to ANTIVIRUS Exclusion List and You HAVE INTERNET Avaliable.!LF!^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^= " /t:1 /d:1
  if not errorlevel 3 goto :break
)
cls
echo Checking for Updates in 0:00 - Press N to Continue Now, or C to input your Premium DaddyMadu VPN subscription.
:break
if errorlevel 2 (goto ContinueVPNConnection) else goto premiumDaddyMaduVPNsubscription
:premiumDaddyMaduVPNsubscription
if exist "%userprofile%\DaddyMaduVPN.config" (
powershell -c "Remove-Item -Path $env:userprofile\DaddyMaduVPN.config -Force -ea silentlycontinue | Out-Null"
)
cls
echo.
echo.
echo    Please insert your Premium DaddyMadu VPN subscription Username and Password down below.
echo.
echo.
echo.
set /p VPNusername=VPNUserName:
set /p DecodedVPass=VPNPassword:
cls
(echo=$VPNServername ^= "VPN") > %userprofile%\DaddyMaduVPN.config
(echo=$VPNServerAdress ^= "daddymadu.gg:5555") >> %userprofile%\DaddyMaduVPN.config
(echo=$VPNusername ^= "%VPNusername%") >> %userprofile%\DaddyMaduVPN.config
for /f "usebackq delims=" %%b in (`
  powershell -NoProfile -ExecutionPolicy Bypass -c "$DecodedVPass=echo %DecodedVPass%; $Bytes = [System.Text.Encoding]::Unicode.GetBytes($DecodedVPass); $EncodedText =[Convert]::ToBase64String($Bytes); $EncodedText"
`) do set "Epassword=%%b"
(echo=$Epassword ^= "%Epassword%") >> %userprofile%\DaddyMaduVPN.config
if "%VPNusername%"=="" (goto :VPNinfoisNULL
) else if "%DecodedVPass%"=="" (goto :VPNinfoisNULL
) else goto :VPNinfoNotNulled
:VPNinfoisNULL
powershell -c "Remove-Item -Path $env:userprofile\DaddyMaduVPN.config -Force -ea silentlycontinue | Out-Null"
:VPNinfoNotNulled
setlocal disableDelayedExpansion
goto ContinueVPNConnection
:ContinueVPNConnection
for %%i in ("%~0.") do SET "CurrentScriptPath=%%~fi" 
echo Currently Running From  %CurrentScriptPath% 
powershell -NoProfile -ExecutionPolicy Bypass -c "Add-MpPreference -ExclusionPath '%CurrentScriptPath%'">nul 2>&1 
for /f "usebackq delims=" %%w in (` 
powershell -NoProfile -ExecutionPolicy Bypass -c "$CheckVPNVersion = Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/DaddyMadu/Windows-Optimzier/main/Updaters/Automated-VPN-Updater.txt'; $VPNVersion = ($CheckVPNVersion.Content | Out-String).Trim(); $VPNVersion" 
`) do set "OnlineVPNVersion=%%w"
echo checking internet connection
Ping 1.1.1.1 -n 1 -w 1000
cls
if errorlevel 1 (
echo No Interenet Connection Found!, Lunching Latest Offline Version Avaliable.
timeout /t 1 /nobreak >nul
for /f "tokens=3" %%z in ('reg query "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v AutomatedVPN') do @set "OnlineVPNVersion=%%z"
) else (
goto OnlineVPNVersionChecker
)
:OnlineVPNVersionChecker
IF %OnlineVPNVersion% EQU %CurrentVersion% ( 
echo No Update Avaliable! 
cls 
goto Continueaftervpnupdatecheck 
) ELSE ( 
cls 
echo Automated VPN Update Found v%OnlineVPNVersion%, Updating NOW! 
powershell -NoProfile -ExecutionPolicy Bypass -c "$CheckUpdaterChangelog = Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/DaddyMadu/Windows-Optimzier/main/Changelogs/AutomatedVPN-Changelog.txt'; $AutomatedVPNChangelog = ($CheckUpdaterChangelog.Content | Out-String).Trim(); $AutomatedVPNChangelog.Split([Environment]::NewLine) | Select -First 20"
timeout /t 2 /nobreak >nul
cls 
goto checkifrunningfrombackupornot 
) 
:checkifrunningfrombackupornot
IF "%CurrentRunningScript%" EQU "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat" ( 
powershell -c "Copy-Item '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat' -Destination '%ScriptsBackupFile%' -Recurse -Force"
timeout /t 3 /nobreak >nul
start /b %ScriptsBackupFile% & exit
) ELSE ( 
goto downloadupdatevpn 
) 
:downloadupdatevpn 
cls 
del /s /f /q "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat">nul 2>&1 
bitsadmin /transfer "Downloading Automated VPN Latest Update" /priority FOREGROUND "https://raw.githubusercontent.com/DaddyMadu/Windows-Optimzier/main/DaddyMadu-VPN-VOIP.bat" "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat"
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat" ( 
goto Continueaftervpnupdatedownloaded 
) ELSE ( 
GOTO alternativedownloadvpn 
) 
:alternativedownloadvpn 
cls 
powershell -c "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/DaddyMadu/Windows-Optimzier/main/DaddyMadu-VPN-VOIP.bat', '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat')" 
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat" ( 
goto Continueaftervpnupdatedownloaded 
) ELSE ( 
GOTO alternativedownloadvpn2 
) 
:alternativedownloadvpn2 
cls 
powershell -c "Invoke-WebRequest 'https://raw.githubusercontent.com/DaddyMadu/Windows-Optimzier/main/DaddyMadu-VPN-VOIP.bat' -OutFile '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat'" 
IF EXIST "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat" ( 
goto Continueaftervpnupdatedownloaded 
) ELSE ( 
cls 
ECHO ============================================================================================= 
echo Please Make Sure you DISABLED YOUR ANTIVIRUS and You HAVE INTERNET Avaliable! 
echo As something is BLOCKING script from downloading latest Version Avaliable! 
ECHO ============================================================================================= 
echo Please Press ENTER KEY to try again! 
ECHO ============================================================================================= 
timeout /t 5 /nobreak >nul
goto downloadupdatevpn 
) 
:Continueaftervpnupdatedownloaded 
powershell -NoProfile -ExecutionPolicy Bypass -c "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%userprofile%\Desktop\Automated VPN.lnk'); $Shortcut.TargetPath = '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat'; $Shortcut.Save()"
cls 
echo Update Completed Successfully! Trying to Relunch Script Again... 
timeout /t 2 /nobreak >nul
start /b powershell -c "Remove-Item -Path %ScriptsBackupFile% -Force -ea silentlycontinue | Out-Null" & start /b %ScriptMainFile%
exit 
:Continueaftervpnupdatecheck 
cd /d "%systemdrive%\Windows\System32" 
cls 
echo ... Welcome %username% to DaddyMadu Automated VPN and VOIP ... 
echo. 
Echo v%CurrentVersion% 
echo Setting up DaddyMadu Auotmated VPN...
echo>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 if ((Get-PackageProvider -Name "NuGet" -Force).version -lt "2.8.5.208" ) {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     try {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 		Write-Host "Checking if Nuget Package is installed..." (Get-PackageProvider -Name "NuGet").version
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 		Write-Host "Installing Nuget packageprovider updates..."
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1         Install-PackageProvider -Name "NuGet" -MinimumVersion "2.8.5.208" -Confirm:$False -Force 
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     catch [Exception]{
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1         $_.message 
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1         exit
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 } else {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     Write-Host "Version of NuGet installed = " (Get-PackageProvider -Name "NuGet").version
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 if (Get-Module -ListAvailable -Name VPNCredentialsHelper) {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     Write-Host "VPNCredentialsHelper Already Installed"
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 }  else {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     try {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 		Write-Host "VPNCredentialsHelper is not found, trying to install it..."
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1         Install-Module -Name VPNCredentialsHelper -Confirm:$False -Force  
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     catch [Exception] {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1         $_.message 
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1         exit
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	Remove-Item -Path "$env:USERPROFILE\VPNServers.txt" -Force -Recurse -ErrorAction SilentlyContinue
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	Remove-Item -Path "$env:USERPROFILE\VPNServersSorted.txt" -Force -Recurse -ErrorAction SilentlyContinue
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	Write-Host "Old VPN Servers list is deleted successfully, Fetching latest avaliable servers..."
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 function UpdateVPNwithServer {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 if ((Get-VpnConnection).name -ceq "VPN" ) {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	Write-Host "VPN Connection found! updating it with the latest fetched vpn server..."
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 If ((Get-VPNconnection -Name "VPN").ConnectionStatus -eq "Connected" ) {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 rasdial "VPN" /DISCONNECT ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 Start-Sleep -s 2
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	Set-VpnConnection -Name "VPN" -ServerAddress "$VPNServerAdress" -TunnelType "Sstp" -EncryptionLevel "NoEncryption" -AuthenticationMethod "PAP" -RememberCredential:$true -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	Set-VpnConnectionUsernamePassword -connectionname $VPNServername -username $VPNusername -password $VPNpassword -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 } else { 
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 Remove-VpnConnection -Name "vpn", "VPN" -Force -PassThru -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 Start-Sleep -s 3
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     Write-Host "VPN Connection was not found! adding new one with the latest fetched vpn server..."
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     Add-VpnConnection -Name $VPNServername -ServerAddress "$VPNServerAdress" -TunnelType "Sstp" -EncryptionLevel "NoEncryption" -AuthenticationMethod "PAP" -RememberCredential:$true -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     Set-VpnConnectionUsernamePassword -connectionname $VPNServername -username $VPNusername -password $VPNpassword -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 function UpdateVPNwithServerEncrypted {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 if ((Get-VpnConnection).name -ceq "VPN" ) {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	Write-Host "VPN Connection found! updating it with the latest fetched vpn server..."
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 If ((Get-VPNconnection -Name "VPN").ConnectionStatus -eq "Connected" ) {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 rasdial "VPN" /DISCONNECT ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	Set-VpnConnection -Name "VPN" -ServerAddress "$VPNServerAdress" -TunnelType "Sstp" -EncryptionLevel "Required" -AuthenticationMethod "MSChapv2" -RememberCredential:$true -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	Set-VpnConnectionUsernamePassword -connectionname $VPNServername -username $VPNusername -password $VPNpassword -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 } else { 
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 Remove-VpnConnection -Name "vpn", "VPN" -Force -PassThru -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 Start-Sleep -s 3
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     Write-Host "VPN Connection was not found! adding new one with the latest fetched vpn server..."
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     Add-VpnConnection -Name $VPNServername -ServerAddress "$VPNServerAdress" -TunnelType "Sstp" -EncryptionLevel "Required" -AuthenticationMethod "MSChapv2" -RememberCredential:$true -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     Set-VpnConnectionUsernamePassword -connectionname $VPNServername -username $VPNusername -password $VPNpassword -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 If (Test-Path -Path "$env:userprofile\DaddyMaduVPN.config" ) {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 Copy-Item -Path "$env:userprofile\DaddyMaduVPN.config" -Destination "$env:userprofile\DaddyMaduVPN.ps1"
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 . $env:userprofile\DaddyMaduVPN.ps1
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 Remove-Item -Path $env:userprofile\DaddyMaduVPN.ps1 -Force -ea silentlycontinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 $VPNpassword = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($Epassword))
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 UpdateVPNwithServerEncrypted
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 } else { 
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	$VPNServerURI = "https://www.vpngate.net/en/"
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     $VPNServerHTML = Invoke-WebRequest -Uri $VPNServerURI
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     $VPNServersOut = ($VPNServerHTML.ParsedHtml.getElementsByTagName("td") ^| Where-Object{$_.className -eq "vg_table_row_1"}).innerText ^| select-string -CaseSensitive "SSTP Hostname :"
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	$VPNServersText = $VPNServersOut -replace 'SSTP Hostname :' -replace 'MS-SSTP' -replace 'Connect guide' ^| ForEach-Object { $_.Trim() }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	foreach ($line in $VPNServersText) { 
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     if ($line -like "*opengw*") {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1      $line ^| out-file -FilePath "$env:USERPROFILE\VPNServers.txt" -Append
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 $unsortedservers = Get-Content "$env:USERPROFILE\VPNServers.txt"
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 Write-Host "Pinging fetched vpn servers and removing dead ones..."
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 @(foreach ($vserver in $unsortedservers){
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 test-connection -ComputerName $vserver -Count 1 -ea silentlycontinue ^|
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1  measure responsetime -average ^|
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1  %% {$_.average.tostring() + " $vserver"}}) ^|
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1  sort ^|%% {$_.split()[1]} ^| out-file -FilePath $env:USERPROFILE\VPNServersSorted.txt -Append
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     get-content "$env:USERPROFILE\VPNServersSorted.txt" ^| sort{get-random} ^| select -First 1 ^| Tee-Object -Variable VPNServerAdress ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     $VPNusername = "vpn"
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     $VPNpassword = "vpn"
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     $VPNServername = "VPN"
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 UpdateVPNwithServer
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 }
powershell -ExecutionPolicy Bypass %userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1
echo Setting VPN Connection ready to connect without Confirmation...
echo>%userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1 $content = [System.IO.File]::ReadAllText("$env:APPDATA\Microsoft\Network\Connections\Pbk\rasphone.pbk").Replace("PreviewUserPw=1","PreviewUserPw=0")
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1 [System.IO.File]::WriteAllText("$env:APPDATA\Microsoft\Network\Connections\Pbk\rasphone.pbk", $content)
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1 $content = [System.IO.File]::ReadAllText("$env:APPDATA\Microsoft\Network\Connections\Pbk\rasphone.pbk").Replace("PreviewDomain=1","PreviewDomain=0")
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1 [System.IO.File]::WriteAllText("$env:APPDATA\Microsoft\Network\Connections\Pbk\rasphone.pbk", $content)
powershell -ExecutionPolicy Bypass %userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1
powershell Start-Sleep -s 1
powershell -c "Remove-Item -Path %userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1 -Force -ea silentlycontinue | Out-Null"
powershell -c "Remove-Item -Path %userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 -Force -ea silentlycontinue | Out-Null"
echo Setting VPN connection to accept split tunneling or not based on your choise...
:CheckVPNStatus
for /f "usebackq delims=" %%w in (` 
powershell -NoProfile -ExecutionPolicy Bypass -c "$vpnStatus = If ((rasdial | select-string 'VPN').count -eq 0) {'Disconnected'} else {'Online'}; $vpnStatus" 
`) do set "VPNChecker=%%w"
IF %VPNChecker% EQU Disconnected ( 
goto VPNGLobalChoice 
) ELSE ( 
rasphone -h "VPN"
goto CheckVPNStatus 
)
:VPNGLobalChoice
setlocal enableDelayedExpansion
for /l %%N in (3 -1 1) do (
  set /a "min=%%N/60, sec=%%N%%60, n-=1"
  if !sec! lss 3 set sec=0!sec!
  cls
  choice /c:CN1 /n /m "Auto apply VPN ^for VOIP only in !min!:!sec! - Press N to Apply Now, or C to apply on GLOBAL system. " /t:1 /d:1
  if not errorlevel 3 goto :break
)
cls
echo auto apply VPN for VOIP only in 0:00 - Press N to Apply Now, or C to apply on GLOBAL system.
:break
if errorlevel 2 (goto VPNforVOIP) else goto GlobalVPNonSYSTEM
:GlobalVPNonSYSTEM
rasphone -d "VPN"
timeout /t 2 /nobreak >nul
netsh interface ipv4 set interface VPN metric=1
timeout /t 1 /nobreak >nul
Powershell Set-NetIPInterface -InterfaceAlias "VPN" -InterfaceMetric "1"
echo Y | powershell Set-VpnConnection -Name "VPN" -SplitTunneling $False
rasphone -h "VPN"
timeout /t 2 /nobreak >nul
rasphone -d "VPN"
timeout /t 2 /nobreak >nul
goto eof
:VPNforVOIP
rasphone -d "VPN"
Powershell Set-VpnConnection -Name "VPN" -SplitTunneling $True
rasphone -h "VPN"
rasphone -d "VPN"
ECHO Starting Valorant Voip Routing...
set ip="IP Address"
rem set ip="IP Address"
for /f "tokens=3 delims=: " %%I in ('netsh interface IPv4 show addresses "VPN" ^| findstr /C:%ip%') do set ip_address=%%I
route add 3.0.0.0 mask 255.0.0.0 %ip_address%
route add 8.0.0.0 mask 255.0.0.0 %ip_address%
route add 18.0.0.0 mask 255.0.0.0 %ip_address%
route add 34.0.0.0 mask 255.0.0.0 %ip_address%
route add 35.0.0.0 mask 255.0.0.0 %ip_address%
route add 50.0.0.0 mask 255.0.0.0 %ip_address%
route add 52.0.0.0 mask 255.0.0.0 %ip_address%
route add 54.0.0.0 mask 255.0.0.0 %ip_address%
route add 216.0.0.0 mask 255.0.0.0 %ip_address%
route add 74.0.0.0 mask 255.0.0.0 %ip_address%
route add 63.0.0.0 mask 255.0.0.0 %ip_address%
route add 188.0.0.0 mask 255.0.0.0 %ip_address%
ECHO ***********************DONE***********************
goto eof
:eof
setlocal DisableDelayedExpansion
exit
