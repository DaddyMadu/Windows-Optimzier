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

echo Setting up DaddyMadu Auotmated VPN...
echo>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 if ((Get-PackageProvider -Name NuGet).version -lt 2.8.5.208 ) {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     try {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 		Write-Host "Checking if Nuget Package is installed..."
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1         Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.208 -Confirm:$False -Force 
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     catch [Exception]{
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1         $_.message 
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1         exit
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     }
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1 } else {
echo>>%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1     Write-Host "Version of NuGet installed = " (Get-PackageProvider -Name NuGet).version
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
powershell -ExecutionPolicy RemoteSigned "%userprofile%\AppData\Local\Temp\dmtmp\DaddyMadu-AutomatedVPN.ps1"
echo Setting VPN Connection ready to connect without Confirmation...
echo>%temp%\DisableAuthConfirmation.ps1 $content = [System.IO.File]::ReadAllText("$env:APPDATA\Microsoft\Network\Connections\Pbk\rasphone.pbk").Replace("PreviewUserPw=1","PreviewUserPw=0")
echo>>%temp%\DisableAuthConfirmation.ps1 [System.IO.File]::WriteAllText("$env:APPDATA\Microsoft\Network\Connections\Pbk\rasphone.pbk", $content)
echo>>%temp%\DisableAuthConfirmation.ps1 $content = [System.IO.File]::ReadAllText("$env:APPDATA\Microsoft\Network\Connections\Pbk\rasphone.pbk").Replace("PreviewDomain=1","PreviewDomain=0")
echo>>%temp%\DisableAuthConfirmation.ps1 [System.IO.File]::WriteAllText("$env:APPDATA\Microsoft\Network\Connections\Pbk\rasphone.pbk", $content)
echo>>%temp%\DisableAuthConfirmation.ps1 Write-Host "Done!"
powershell -executionpolicy bypass %temp%\DisableAuthConfirmation.ps1
powershell Start-Sleep -s 1
powershell Remove-Item -Path %temp%\DisableAuthConfirmation.ps1 -Force
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
