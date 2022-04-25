Function New-MemWin32AppBuild {
    <#
    .SYNOPSIS
        Creates a new folder structure for MEM Win32 app package
    .DESCRIPTION
        After the new app directory is created, the template files from
        within the module are copied.
    .PARAMETER Name
        Name of the application. E.g. "GoogleChrome" or "Google Chrome 90"
    .PARAMETER Path
        Path of your local app packaging environment. E.g. "C:\Apps"
    .EXAMPLE
        New-MemWin32AppBuild -Name "App Name 1.0" -Path "C:\Apps"

        Creates a new build env in C:\Apps
    #>

    [OutputType([string])]
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [string]$Name,

        [Parameter(Position = 1, Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Path
    )

    # Set some variables
    $appPath = Join-Path -Path $Path -ChildPath $Name
    $moduleBase = $ExecutionContext.SessionState.Module.ModuleBase
    $template = Join-Path -Path $moduleBase -ChildPath 'template'

    # This will most likely only be run by Windows admins
    if (($IsLinux -eq $true) -or ($IsMacOS -eq $true)) {
        Write-Output "This function is designed to run on Windows only"
        throw
    }

    # Error if directory already exists. If not, create it
    if (Test-Path -Path $appPath) {
        Write-Output "$appPath already exists. Delete before trying again."
        throw
    }
    else {
        Write-Output "Creating directory: $appPath"
        try {
            New-Item $appPath -ItemType Directory | Out-Null -ErrorAction Stop
        }
        catch {
            Write-Warning "Failed to create $appPath"
            throw
        }
    }

    # Copy the template files to the new directory
    Write-Output "Populating directory: $appPath"
    try {
        Copy-Item -Path $template\* -Destination $appPath -Recurse | Out-Null -ErrorAction Stop
        Remove-Item -Path "$appPath\outputIntuneWin\DELETEME.txt" -Force
        Remove-Item -Path "$appPath\source\DELETEME.txt" -Force
    }
    catch {
        catch {
            Write-Warning "Failed to copy template to $appPath"
            throw
        }
    }
}



