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
powershell -c "Get-NetAdapter -Physical | ForEach-Object { Set-DnsClientServerAddress $_.Name -ServerAddresses ('127.0.0.1') }"
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
