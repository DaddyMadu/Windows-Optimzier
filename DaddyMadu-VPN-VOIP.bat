@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
 :::::::::::::::::::::::::::: 
 ::START 
 :::::::::::::::::::::::::::: 
 mode 200 
title [ Daddy Madu ] Autmated VPN and VOIP! 
color 1f 
reg ADD "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v "AutomatedVPN" /t REG_SZ /d "1.3.3" /f >nul 2>&1 
for /f "tokens=3" %%z in ('reg query "HKEY_CURRENT_USER\SOFTWARE\DM Windows Optimizer\Updater" /v AutomatedVPN') do @set "CurrentVersion=%%z" 
mkdir "%userprofile%\AppData\Local\Temp\dmtmp">nul 2>&1 & attrib +h +s "%userprofile%\AppData\Local\Temp\dmtmp" 
set "ScriptsFullPath=%userprofile%\AppData\Local\Temp\dmtmp"
powershell -NoProfile -ExecutionPolicy Bypass -c "Add-MpPreference -ExclusionPath '%ScriptsFullPath%'">nul 2>&1 
ECHO =============================================================================================  
echo Please Make Sure you DISABLED YOUR ANTIVIRUS and You HAVE INTERNET Avaliable. 
echo As some ANTIVIRUS Might Detect This Script As False Positive! 
echo Or add This Script to Exclusion List. 
ECHO =============================================================================================  
echo Please Press ENTER KEY to Continue!  
ECHO =============================================================================================  
timeout /t 3 
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
timeout /t 2
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
timeout /t 10 
cls 
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
pause >nul 
goto downloadupdatevpn 
) 
:Continueaftervpnupdatedownloaded 
powershell -NoProfile -ExecutionPolicy Bypass -c "Copy-Item -Path '%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-VPN-VOIP.bat' -Destination '%CurrentScriptPath%' -Force" 
cls 
echo Update Completed Successfully! Trying to Relunch Script Again... 
timeout /t 2 
%CurrentScriptPath% 
exit 
:Continueaftervpnupdatecheck 
cd /d "%systemdrive%\Windows\System32" 
cls 
echo ... Welcome %username% to DaddyMadu Automated VPN and VOIP ... 
echo. 
Echo v%CurrentVersion% 
echo Setting up DaddyMadu Auotmated VPN...
echo>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 if ((Get-PackageProvider -Name NuGet).version -lt "2.8.5.208" ) {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     try {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 		Write-Host "Checking if Nuget Package is installed..." (Get-PackageProvider -Name "NuGet").version
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 		Write-Host "Installing Nuget packageprovider updates..."
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1         echo Y ^| Install-PackageProvider -Name "NuGet" -MinimumVersion "2.8.5.208" -Confirm:$False -Force 
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
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 test-connection -ComputerName $vserver -Count 1 -ea 0 ^|
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1  measure responsetime -average ^|
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1  %% {$_.average.tostring() + " $vserver"}}) ^|
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1  sort ^|%% {$_.split()[1]} ^| out-file -FilePath $env:USERPROFILE\VPNServersSorted.txt -Append
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     get-content "$env:USERPROFILE\VPNServersSorted.txt" ^| sort{get-random} ^| select -First 1 ^| Tee-Object -Variable VPNServerAdress ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     $VPNusername = "vpn"
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     $VPNpassword = "vpn"
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     $VPNServername = "VPN"
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 if ((Get-VpnConnection).name -eq "VPN" ) {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	Write-Host "VPN Connection found! updating it with the latest fetched vpn server..."
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	Set-VpnConnection -Name VPN -ServerAddress "$VPNServerAdress" -TunnelType "Sstp" -EncryptionLevel "Required" -AuthenticationMethod MSChapv2 -RememberCredential:$true -SplitTunneling:$true -PassThru -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 	Set-VpnConnectionUsernamePassword -connectionname $VPNServername -username $VPNusername -password $VPNpassword -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 } else { 
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     Write-Host "VPN Connection was not found! adding new one with the latest fetched vpn server..."
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     Add-VpnConnection -Name $VPNServername -ServerAddress "$VPNServerAdress" -TunnelType "Sstp" -EncryptionLevel "Required" -AuthenticationMethod MSChapv2 -RememberCredential:$true -SplitTunneling:$true -PassThru -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     Set-VpnConnectionUsernamePassword -connectionname $VPNServername -username $VPNusername -password $VPNpassword -ErrorAction SilentlyContinue ^| Out-Null
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 Write-Host "Done!"
powershell -ExecutionPolicy Bypass %userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1
echo Setting VPN Connection ready to connect without Confirmation...
echo>%userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1 $content = [System.IO.File]::ReadAllText("$env:APPDATA\Microsoft\Network\Connections\Pbk\rasphone.pbk").Replace("PreviewUserPw=1","PreviewUserPw=0")
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1 [System.IO.File]::WriteAllText("$env:APPDATA\Microsoft\Network\Connections\Pbk\rasphone.pbk", $content)
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1 $content = [System.IO.File]::ReadAllText("$env:APPDATA\Microsoft\Network\Connections\Pbk\rasphone.pbk").Replace("PreviewDomain=1","PreviewDomain=0")
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1 [System.IO.File]::WriteAllText("$env:APPDATA\Microsoft\Network\Connections\Pbk\rasphone.pbk", $content)
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1 Write-Host "Done!"
powershell -ExecutionPolicy Bypass %userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1
powershell Start-Sleep -s 1
powershell Remove-Item -Path %userprofile%\AppData\Local\Temp\dmtmp\DisableAuthConfirmation.ps1 -Force
powershell Remove-Item -Path %userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 -Force
echo Setting VPN connection to accept split tunneling...
:CheckVPNStatus
for /f "usebackq delims=" %%w in (` 
powershell -NoProfile -ExecutionPolicy Bypass -c "$vpnStatus = If ((rasdial | select-string 'VPN').count -eq 0) {'Disconnected'} else {'Online'}; $vpnStatus" 
`) do set "VPNChecker=%%w"
IF %VPNChecker% EQU Disconnected ( 
goto RestOFfile 
) ELSE ( 
rasphone -h "VPN"
goto CheckVPNStatus 
)
:RestOFfile
rasphone -d "VPN"
Powershell Set-VpnConnection -Name "VPN" -SplitTunneling $True
rasphone -h "VPN"
rasphone -d "VPN"
powershell -c "Get-NetAdapter -Physical | ForEach-Object { Set-DnsClientServerAddress $_.Name -ServerAddresses ('8.8.8.8') }"
ECHO Starting Valorant Voip Routing...
set ip="IP Address"
rem set ip="IP Address"
for /f "tokens=3 delims=: " %%I in ('netsh interface IPv4 show addresses "VPN" ^| findstr /C:%ip%') do set ip_address=%%I
route add 3.0.0.0 mask 255.0.0.0 %ip_address%
route add 18.0.0.0 mask 255.0.0.0 %ip_address%
route add 34.0.0.0 mask 255.0.0.0 %ip_address%
route add 35.0.0.0 mask 255.0.0.0 %ip_address%
route add 50.0.0.0 mask 255.0.0.0 %ip_address%
route add 52.0.0.0 mask 255.0.0.0 %ip_address%
route add 54.0.0.0 mask 255.0.0.0 %ip_address%

ECHO ***********************DONE***********************
