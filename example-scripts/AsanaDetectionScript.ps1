<#
.Synopsis
    Script used for application detection method
.DESCRIPTION
    This script is used as part of the Asana install to detect if the app is installed or not
    For Asana version 1.2.0
.Notes
    FileName:    AsanaDetectionScript.PS1
    Author:      Mark kerry
    Created:     2021-06-10
#>

# Set ErrorActionPreference
$ErrorActionPreference = "SilentlyContinue"

# Determine current logged on user
$UserName = Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName

# Create a hash-table for each UserProfileList with translated SIDs
$ProfileTable = @{}
$UserProfileListItems = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\ProfileList\*"
foreach ($UserProfileListItem in $UserProfileListItems) {
    $SecurityIdentifier = New-Object -TypeName System.Security.Principal.SecurityIdentifier($UserProfileListItem.PSChildName)    
    $UserNameTranslated = $SecurityIdentifier.Translate([System.Security.Principal.NTAccount])
    if ($UserNameTranslated -ne $null) {
        $ProfileTable.Add($UserNameTranslated.Value, $UserProfileListItem.ProfileImagePath)
    }
}

# Determine user profile path from current logged on user
$UserProfilePath = $ProfileTable[$UserName]

# Construct Asana.exe path
$asanaPath = Join-Path -Path $UserProfilePath -ChildPath "\AppData\Local\Asana\Asana.exe"

# Validate Asana.exe file exists and check version
if (Test-Path -LiteralPath $asanaPath) {
    $version = Get-Item -Path $asanaPath
    if ($version.VersionInfo.FileVersion -ge "1.2.0") {
        Write-Output "Asana $($version.VersionInfo.FileVersion) found"
        exit 0
    }
    else {
        exit 1
    }
}
else {
    exit 1
}