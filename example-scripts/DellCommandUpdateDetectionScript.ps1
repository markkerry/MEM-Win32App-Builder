$universalDCU = "$env:ProgramFiles\Dell\CommandUpdate\dcu-cli.exe"
$nonUninversalDCU = "${env:ProgramFiles(x86)}\Dell\CommandUpdate\dcu-cli.exe"
$universalInstalled = Test-Path -Path $universalDCU
$nonUniversalInstalled = Test-Path -Path $nonUninversalDCU

if (($universalInstalled -eq $true) -or ($nonUniversalInstalled -eq $true)) {
    Write-Output "DCU Installed"
    exit 0
}
else {
    exit 1
}