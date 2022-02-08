if ((Get-PackageProvider -Name NuGet).version -lt 2.8.5.208 ) {
    try {
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
        Install-Module -Name VPNCredentialsHelper -Confirm:$False -Force  
    }
    catch [Exception] {
        $_.message 
        exit
    }
}
	Remove-Item -Path "$env:USERPROFILE\VPNServers.txt" -Force -Recurse -ErrorAction SilentlyContinue
	Remove-Item -Path "$env:USERPROFILE\VPNServersSorted.txt" -Force -Recurse -ErrorAction SilentlyContinue
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
@(foreach ($vserver in $unsortedservers){
test-connection -ComputerName $vserver -Count 1 -ea 0 |
 measure responsetime -average |
 % {$_.average.tostring() + " $vserver"}}) |
 sort |% {$_.split()[1]} | out-file -FilePath "$env:USERPROFILE\VPNServersSorted.txt" -Append
	
  $__lines = get-content "$env:USERPROFILE\VPNServersSorted.txt"
  $ScriptProperty = @{
  Name = 'NextSentence'
  MemberType = 'ScriptProperty' 
  Value = {
    return $this[++$global:__idx % @($this).Count]
  }
}
Add-Member @ScriptProperty -InputObject $__lines 
  function GetRandomServer (){
  $global:__lines.NextSentence
}
    GetRandomServer | Tee-Object -Variable VPNServerAdress
    $VPNusername = "vpn"
    $VPNpassword = "vpn"
	$VPNServername = "VPN"
if ((Get-VpnConnection).name -eq "VPN" ) {
	Set-VpnConnection -Name VPN -ServerAddress "$VPNServerAdress" -TunnelType "Sstp" -EncryptionLevel "Required" -AuthenticationMethod MSChapv2 -RememberCredential:$true -SplitTunneling:$true -PassThru -ErrorAction SilentlyContinue | Out-Null
	Set-VpnConnectionUsernamePassword -connectionname $VPNServername -username $VPNusername -password $VPNpassword -ErrorAction SilentlyContinue | Out-Null
} else { 
    Add-VpnConnection -Name $VPNServername -ServerAddress "$VPNServerAdress" -TunnelType "Sstp" -EncryptionLevel "Required" -AuthenticationMethod MSChapv2 -RememberCredential:$true -SplitTunneling:$true -PassThru -ErrorAction SilentlyContinue | Out-Null
    Set-VpnConnectionUsernamePassword -connectionname $VPNServername -username $VPNusername -password $VPNpassword -ErrorAction SilentlyContinue | Out-Null
}
