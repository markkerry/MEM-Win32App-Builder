function downloadWin32AppUtil ($Path) {
    $edition = $PSVersionTable.PSEdition
    if ($edition -eq "Core") {
        $basicParsing = $false
    }
    else {
        $basicParsing = $true
    }

    $file = "IntuneWinAppUtil.exe"
    $uri = "https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool/blob/master/$file"
    $outPath = Join-Path -Path $Path -ChildPath $file

    $downloadParams = @{
        UseBasicParsing = $basicParsing
        Uri = $uri
        OutFile = $outPath
    }

    Invoke-WebRequest @downloadParams
}
