$wslFeature = Get-WindowsOptionalFeature -online -FeatureName Microsoft-Windows-Subsystem-Linux
$vmPlatformFeature = Get-WindowsOptionalFeature -online -FeatureName VirtualMachinePlatform

if ($wslFeature.State -eq "Enabled" -and $vmPlatformFeature.State -eq "Enabled") {
    Write-Output 'OK'
    exit 0
}
else {
    exit 1
}