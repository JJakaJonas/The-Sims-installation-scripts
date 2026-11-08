@echo off
:: Lock the working directory to the sub-folder location
cd /d "%~dp0"

echo Launching installation...

:: Start the installation file
if exist "AutoRun.exe" (
    start "" "AutoRun.exe"
    set "EXE_NAME=AutoRun.exe"
    goto wait_loop
)

if exist "setup.exe" (
    start "" "setup.exe"
    set "EXE_NAME=setup.exe"
    goto wait_loop
)

echo [ERROR] Neither AutoRun.exe nor setup.exe was found in this directory!
pause
exit /b

:wait_loop
:: Give the process 4 seconds to register in Windows
timeout /t 4 >nul

echo.
echo ===================================================
echo   WAITING FOR %EXE_NAME% TO CLOSE...
echo ===================================================
echo DO NOT close this black window. It will exit automatically
echo once you are completely finished with the setup wizard.
echo.

:loop
:: Check Windows tasklist to see if process is still alive
tasklist /FI "IMAGENAME eq %EXE_NAME%" 2>nul | find /I "%EXE_NAME%" >nul
if %errorlevel% equ 0 (
    timeout /t 3 >nul
    goto loop
)

echo [INFO] %EXE_NAME% has closed! Handing control back...
timeout /t 2 >nul
exit /b