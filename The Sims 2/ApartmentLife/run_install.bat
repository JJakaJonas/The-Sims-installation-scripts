@echo off
:: Sikrer at arbejdsmappen er lige præcis her, hvor filen ligger
cd /d "%~dp0"

echo Starter installationen...

:: Start installationsfilen (vi tjekker efterfølgende om den kører)
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

echo [ERROR] Fandt hverken AutoRun.exe eller setup.exe!
pause
exit /b

:wait_loop
:: Giv programmet 4 sekunder til overhovedet at starte op og dukke op i Windows
timeout /t 4 >nul

echo.
echo ===================================================
echo   VENTER PAA AT %EXE_NAME% LUKKER...
echo ===================================================
echo Luk IKKE dette sorte vindue. Det lukker selv,
echo naar du er helt faerdig med installationsguiden.
echo.

:loop
:: Spørg Windows direkte om processen stadig er aktiv i Joblisten
tasklist /FI "IMAGENAME eq %EXE_NAME%" 2>nul | find /I "%EXE_NAME%" >nul
if %errorlevel% equ 0 (
    :: Processen kører stadig. Vent 3 sekunder og tjek igen.
    timeout /t 3 >nul
    goto loop
)

echo [INFO] %EXE_NAME% er nu lukket ned!
timeout /t 2 >nul
exit /b
