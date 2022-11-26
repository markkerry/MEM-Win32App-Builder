function Get-PendingReboot {
    $cbsRebootPend = $false
    $wuauRebootReq = $false

    ## Query Component Based Servicing from the registry
    $cbsPath = "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\"
    $cbsItems = Get-Item -Path $cbsPath | Select-Object -ExpandProperty Property
    foreach ($cbsItem in $cbsItems) {
        if ((Get-ItemPropertyValue -Path $cbsPath -Name $cbsItem) -eq "RebootPending") {
            $cbsRebootPend = $true
            break
        }
    }

    ## Query WUAU from the registry
    $wuauPath = "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
    if (Test-Path -Path $wuauPath) {
            $wuauRebootReq = $true
    }

    ## Creating Custom PSObject and Select-Object Splat
    $selectSplat = @{
        Property=(
            'CBServicing',
            'WindowsUpdate',
            'RebootPending'
        )}
    New-Object -TypeName PSObject -Property @{
        CBServicing = $cbsRebootPend
        WindowsUpdate = $wuauRebootReq
        RebootPending = ($wuauRebootPend -or $wuauRebootReq)
    } | Select-Object @selectSplat
}

# Get-Peding reboot state
$getPendingReboot = Get-PendingReboot

if ($getPendingReboot.RebootPending -eq $false) {
    Write-Output "OK"
    exit 0
}
else {
    Exit 1
}