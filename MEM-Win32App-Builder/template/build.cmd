@echo off
IntuneWinAppUtil.exe -c "%~dp0source" -s AppName.exe -o "%~dp0output"
del IntuneWinAppUtil.exe /f /q
pause
