Function New-MemWin32AppBuild {
    <#
    .SYNOPSIS
        Creates a new folder structure for MEM Win32 app package
    .DESCRIPTION

    .EXAMPLE
        New-MemWin32AppBuild

        Runs the command
    #>
    [OutputType([string])]
    [CmdletBinding()]
    param (
        # Parameter description can go here or above in format: .PARAMETER  <Parameter-Name>
        [Parameter(Position = 0, Mandatory = $true)]
        [string]$Name,

        [Parameter(Position = 1, Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Path = "$pwd"
    )

    $appPath = Join-Path -Path $Path -ChildPath $Name

    if (Test-Path -Path $appPath) {
        Write-Output "$appPath already exists"
        exit
    }
    else {
        New-Item $appPath -ItemType Directory > $null
    }


}



