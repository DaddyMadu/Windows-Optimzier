if ((Get-PackageProvider -Name NuGet).version -lt 2.8.5.208 ) {
    try {
		Write-Host "Checking if Nuget Package is installed..."
        Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.208 -Confirm:$False -Force 
    }
    catch [Exception]{
        $_.message 
        exit
    }
} else {
    Write-Host "Version of NuGet installed = " (Get-PackageProvider -Name NuGet).version
}

if (Get-Module -ListAvailable -Name VPNCredentialsHelper) {
    Write-Host "VPNCredentialsHelper Already Installed"
}  else {
    try {
		Write-Host "VPNCredentialsHelper is not found, trying to install it..."
        Install-Module -Name VPNCredentialsHelper -Confirm:$False -Force  
    }
    catch [Exception] {
        $_.message 
        exit
    }
}
	Remove-Item -Path "$env:USERPROFILE\VPNServers.txt" -Force -Recurse -ErrorAction SilentlyContinue
	Remove-Item -Path "$env:USERPROFILE\VPNServersSorted.txt" -Force -Recurse -ErrorAction SilentlyContinue
	Write-Host "Old VPN Servers list is deleted successfully, Fetching latest avaliable servers..."
	$VPNServerURI = "https://www.vpngate.net/en/"
    $VPNServerHTML = Invoke-WebRequest -Uri $VPNServerURI
    $VPNServersOut = ($VPNServerHTML.ParsedHtml.getElementsByTagName("td") | Where-Object{$_.className -eq "vg_table_row_1"}).innerText | select-string -CaseSensitive "SSTP Hostname :"
	$VPNServersText = $VPNServersOut -replace 'SSTP Hostname :' -replace 'MS-SSTP' -replace 'Connect guide' | ForEach-Object { $_.Trim() }
	foreach ($line in $VPNServersText) { 
    if ($line -like "*opengw*") {
     $line | out-file -FilePath "$env:USERPROFILE\VPNServers.txt" -Append
    }
}
$unsortedservers = Get-Content "$env:USERPROFILE\VPNServers.txt"
Write-Host "Pinging fetched vpn servers and removing dead ones..."
@(foreach ($vserver in $unsortedservers){
test-connection -ComputerName $vserver -Count 1 -ea 0 |
 measure responsetime -average |
 % {$_.average.tostring() + " $vserver"}}) |
 sort |% {$_.split()[1]} | out-file -FilePath "$env:USERPROFILE\VPNServersSorted.txt" -Append
    get-content "$env:USERPROFILE\VPNServersSorted.txt" | sort{get-random} | select -First 1 | Tee-Object -Variable VPNServerAdress | Out-Null
    $VPNusername = "vpn"
    $VPNpassword = "vpn"
    $VPNServername = "VPN"
if ((Get-VpnConnection).name -eq "VPN" ) {
	Write-Host "VPN Connection found! updating it with the latest fetched vpn server..."
	Set-VpnConnection -Name VPN -ServerAddress "$VPNServerAdress" -TunnelType "Sstp" -EncryptionLevel "Required" -AuthenticationMethod MSChapv2 -RememberCredential:$true -SplitTunneling:$true -PassThru -ErrorAction SilentlyContinue | Out-Null
	Set-VpnConnectionUsernamePassword -connectionname $VPNServername -username $VPNusername -password $VPNpassword -ErrorAction SilentlyContinue | Out-Null
} else { 
    Write-Host "VPN Connection was not found! adding new one with the latest fetched vpn server..."
    Add-VpnConnection -Name $VPNServername -ServerAddress "$VPNServerAdress" -TunnelType "Sstp" -EncryptionLevel "Required" -AuthenticationMethod MSChapv2 -RememberCredential:$true -SplitTunneling:$true -PassThru -ErrorAction SilentlyContinue | Out-Null
    Set-VpnConnectionUsernamePassword -connectionname $VPNServername -username $VPNusername -password $VPNpassword -ErrorAction SilentlyContinue | Out-Null
}
Write-Host "Done!"
