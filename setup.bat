@echo off
setlocal DisableDelayedExpansion

if not "%~2"=="" (
    echo Usage: setup.bat [Linux home directory] >&2
    exit /b 2
)

where wsl.exe >nul 2>&1
if errorlevel 1 (
    echo WSL is required. Install a Linux distribution before running setup.bat. >&2
    exit /b 1
)

wsl.exe --cd "%~dp0." --exec /bin/sh ./setup.sh "%~1"
exit /b %errorlevel%
