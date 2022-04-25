@echo off
IntuneWinAppUtil.exe -c "%~dp0source" -s AppName.exe -o "%~dp0outputIntuneWin"
del IntuneWinAppUtil.exe /f /q
pause
