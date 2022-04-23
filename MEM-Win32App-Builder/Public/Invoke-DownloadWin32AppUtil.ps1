function Invoke-DownloadWin32AppUtil {
    <#
    .SYNOPSIS
        Downloads the latest IntuneWinAppUtil.exe from Github
    .DESCRIPTION
        Uses Invoke-WebRequest
    .EXAMPLE
        Invoke-DownloadWin32AppUtil -Path C:\Apps

        Runs the command
    .PARAMETER Path
        Path to download the file
    #>
    [OutputType([string])]
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [string]$Path
    )

    # This will most likely only be run by Windows admins
    if (($IsLinux -eq $true) -or ($IsMacOS -eq $true)) {
        Write-Output "This function is for Windows only"
        throw
    }

    # Check if running Windows PowerShell or PowerShell (Core)
    $edition = $PSVersionTable.PSEdition
    if ($edition -eq "Core") {
        $basicParsing = $false
    }
    else {
        $basicParsing = $true
    }

    # Set variables
    $file = "IntuneWinAppUtil.exe"
    $uri = "https://raw.githubusercontent.com/microsoft/Microsoft-Win32-Content-Prep-Tool/master/$file"
    $outPath = Join-Path -Path $Path -ChildPath $file

    # Set splat params
    $downloadParams = @{
        UseBasicParsing = $basicParsing
        Uri = $uri
        OutFile = $outPath
        ErrorAction = "Stop"
    }

    # Download IntuneWinAppUtil.exe
    Write-Output "Downloading IntuneWinAppUtil.exe to $Path"
    try {
        Invoke-WebRequest @downloadParams
    }
    catch {
        $_
        Write-Output "Failed to download IntuneWinAppUtil.exe"
    }
}
