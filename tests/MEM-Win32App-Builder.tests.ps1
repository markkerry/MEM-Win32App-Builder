<#
$moduleName         = $env:BHProjectName
$modulePath         = $env:BHModulePath

Get-Module $moduleName | Remove-Module

BeforeAll {
    Import-Module $modulePath\$moduleName.psd1
}
#>

BeforeAll {

    function global:FilterOutCommonParams {
        param ($Params)
        $commonParams = @(
            'Debug', 'ErrorAction', 'ErrorVariable', 'InformationAction', 'InformationVariable',
            'OutBuffer', 'OutVariable', 'PipelineVariable', 'Verbose', 'WarningAction',
            'WarningVariable', 'Confirm', 'Whatif'
        )
        $params | Where-Object { $_.Name -notin $commonParams } | Sort-Object -Property Name -Unique
    }

    $manifest = Import-PowerShellDataFile -Path $env:BHPSModuleManifest
    $outputDir = Join-Path -Path $env:BHProjectPath -ChildPath 'Output'
    $outputModDir = Join-Path -Path $outputDir -ChildPath $env:BHProjectName
    $outputModVerDir = Join-Path -Path $outputModDir -ChildPath $manifest.ModuleVersion
    $outputModVerManifest = Join-Path -Path $outputModVerDir -ChildPath "$($env:BHProjectName).psd1"

    # Get module commands
    # Remove all versions of the module from the session. Pester can't handle multiple versions.
    Get-Module $env:BHProjectName | Remove-Module -Force -ErrorAction Ignore
    Import-Module -Name $outputModVerManifest -Verbose:$false -ErrorAction Stop
    $params = @{
        Module      = (Get-Module $env:BHProjectName)
        CommandType = [System.Management.Automation.CommandTypes[]]'Cmdlet, Function' # Not alias
    }
    if ($PSVersionTable.PSVersion.Major -lt 6) {
        $params.CommandType[0] += 'Workflow'
    }
    $commands = Get-Command @params
}

AfterAll {
    Remove-Item Function:/FilterOutCommonParams
}

Describe 'Can see functions' {

    Context 'MEM-Win32App-Builder Functions' {

        It 'Has imported functions' {
            $commands | Should -Not -BeNullOrEmpty
        }

        It 'Invoke-DownloadWin32AppUtil exists' {
            'Invoke-DownloadWin32AppUtil' | Should -BeIn $commands.Name
        }

        It 'New-MemWin32AppBuild exists' {
            'New-MemWin32AppBuild' | Should -BeIn $commands.Name
        }
    }
}
