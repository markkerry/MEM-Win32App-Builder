
Function Get-HelloWorld {
    <#
    .SYNOPSIS
        Returns Hello world
    .DESCRIPTION
        Returns Hello world
    .EXAMPLE
        PS> Get-HelloWorld

        Runs the command
    #>
    [OutputType([string])]
    [CmdletBinding()]
    param (
        # Parameter description can go here or above in format: .PARAMETER  <Parameter-Name>
        [Parameter()]
        [string]$Path = "$pwd"
    )

    $resolvedPath = $PSCmdLet.GetUnresolvedProviderPathFromPSPath($Path)
    Write-Output "Path is $resolvedPath"
}
