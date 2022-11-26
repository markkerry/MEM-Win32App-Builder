# Ensure the physical machine is Dell hardware
# Requirements in Intune must be expecting an integer of 1 returned to evaulate as true
$manufacturer = Get-CimInstance Win32_ComputerSystem | Select-Object Manufacturer -ExpandProperty Manufacturer
if ($manufacturer -like "*Dell*") {
    Write-Output 1
    exit 0
}
else {
    exit 1
}