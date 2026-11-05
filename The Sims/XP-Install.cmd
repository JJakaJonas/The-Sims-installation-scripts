@echo off
TITLE The Sims 1 Universal Installer Loader
CLS

:: ------------------------------------------------------------------------------
:: AUTOMATISK ADMINISTRATOR-TJEK (UAC ELEVATION)
:: ------------------------------------------------------------------------------
NET SESSION >nul 2>&1
if %errorlevel% neq 0 (
    echo [-] Kræver administrator-rettigheder. Anmoder om adgang...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo [+] Administrator-rettigheder opnået!
echo === Tjekker system og forudsætninger ===

:: Tjek om PowerShell er til stede
powershell -Command "Write-Host 'PowerShell er aktivt!'" >nul 2>&1
if %errorlevel% neq 0 (
    echo [-] PowerShell ser ikke ud til at være installeret eller fungere.
    echo [-] Sørg for at installere .NET Framework og Windows PowerShell.
    pause
    exit /b
)

echo [+] PowerShell fundet. Starter installationsscriptet...
echo --------------------------------------------------

:: Kør Install PowerShell-script automatisk i samme mappe
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1"

echo.
echo ==================================================
echo Processen er fuldført.
pause