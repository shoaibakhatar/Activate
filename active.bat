@echo off
:: Check for administrative privileges
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    :: Prompt for administrative privileges
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~fs0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /b
)

:: Run PowerShell command as administrator and keep the window open
powershell -Command "Start-Process powershell -ArgumentList '-NoExit -Command ""irm https://get.activated.win | iex""' -Verb RunAs"
