function createDirectories ($Path) {
    if ($null -eq $Path) {
        throw
    }
    New-Item -Path $Path -Name "detection" -ItemType Directory > $null
    New-Item -Path $Path -Name "icon" -ItemType Directory > $null
    New-Item -Path $Path -Name "output" -ItemType Directory > $null
    New-Item -Path $Path -Name "requirements" -ItemType Directory > $null
    New-Item -Path $Path -Name "source" -ItemType Directory > $null
}
