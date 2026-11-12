@echo off
title The Sims 2 - Chronological Master Installer Launcher (32-bit)

:: Save the root folder as a variable
set "ROOT_DIR=%~dp0"
cd /d "%ROOT_DIR%"

echo ===================================================
echo   INSTALLING THE SIMS 2 - CHRONOLOGICAL COLLECTION
echo ===================================================
echo.

:: 01 - The Sims 2 (Base Game)
if exist "%ROOT_DIR%BaseGame\AutoRun.exe" (
    echo [01/18] Launching Base Game...
    cd /d "%ROOT_DIR%BaseGame"
    call "run_install.bat"
)

:: 02 - The Sims 2 University (EP1)
if exist "%ROOT_DIR%University\AutoRun.exe" (
    echo [03/18] Launching University...
    cd /d "%ROOT_DIR%University"
    call "run_install.bat"
)

:: 03 - The Sims 2 Nightlife (EP2)
if exist "%ROOT_DIR%Nightlife\AutoRun.exe" (
    echo [03/18] Launching Nightlife...
    cd /d "%ROOT_DIR%Nightlife"
    call "run_install.bat"
)

:: 04 - The Sims 2 Family Fun Stuff (SP1)
if exist "%ROOT_DIR%FamilyFun\AutoRun.exe" (
    echo [04/18] Launching Family Fun Stuff...
    cd /d "%ROOT_DIR%FamilyFun"
    call "run_install.bat"
)

:: 05 - The Sims 2 Open for Business (EP3)
if exist "%ROOT_DIR%BestOfBusiness\AutoRun.exe" (
    echo [05/18] Launching Open for Business...
    cd /d "%ROOT_DIR%BestOfBusiness"
    call "run_install.bat"
)

:: 06 - The Sims 2 Glamour Life Stuff (SP2)
if exist "%ROOT_DIR%GlamourLife\AutoRun.exe" (
    echo [06/18] Launching Glamour Life Stuff...
    cd /d "%ROOT_DIR%GlamourLife"
    call "run_install.bat"
)

:: 07 - The Sims 2 Festive Holiday / Christmas Stuff
if exist "%ROOT_DIR%FestiveHoliday\AutoRun.exe" (
    echo [07/18] Launching Festive Holiday Stuff...
    cd /d "%ROOT_DIR%FestiveHoliday"
    call "run_install.bat"
) 

:: 08 - The Sims 2 Pets (EP4)
if exist "%ROOT_DIR%Pets\setup.exe" (
    echo [08/18] Launching Pets...
    cd /d "%ROOT_DIR%Pets"
    call "run_install.bat"
)

:: 09 - The Sims 2 Celebration Stuff (SP3)
if exist "%ROOT_DIR%Celebration\AutoRun.exe" (
    echo [09/18] Launching Celebration Stuff...
    cd /d "%ROOT_DIR%Celebration"
    call "run_install.bat"
)

:: 10 - The Sims 2 Seasons (EP5)
if exist "%ROOT_DIR%Seasons\AutoRun.exe" (
    echo [10/18] Launching Seasons...
    cd /d "%ROOT_DIR%Seasons"
    call "run_install.bat"
)

:: 11 - The Sims 2 H&M Fashion Stuff (SP4)
if exist "%ROOT_DIR%HMFashion\AutoRun.exe" (
    echo [11/18] Launching H^&M Fashion Stuff...
    cd /d "%ROOT_DIR%HMFashion"
    call "run_install.bat"
)

:: 12 - The Sims 2 Bon Voyage (EP6)
if exist "%ROOT_DIR%BonVoyage\AutoRun.exe" (
    echo [12/18] Launching Bon Voyage...
    cd /d "%ROOT_DIR%BonVoyage"
    call "run_install.bat"
)

:: 13 - The Sims 2 Teen Style Stuff (SP5)
if exist "%ROOT_DIR%TeenStyle\AutoRun.exe" (
    echo [13/18] Launching Teen Style Stuff...
    cd /d "%ROOT_DIR%TeenStyle"
    call "run_install.bat"
)

:: 14 - The Sims 2 Kitchen & Bath Interior Design Stuff (SP6)
if exist "%ROOT_DIR%KitchenBath\AutoRun.exe" (
    echo [14/18] Launching Kitchen ^& Bath Stuff...
    cd /d "%ROOT_DIR%KitchenBath"
    call "run_install.bat"
)

:: 15 - The Sims 2 FreeTime (EP7)
if exist "%ROOT_DIR%FreeTime\AutoRun.exe" (
    echo [15/18] Launching FreeTime...
    cd /d "%ROOT_DIR%FreeTime"
    call "run_install.bat"
)

:: 16 - The Sims 2 IKEA Home Stuff (SP7)
if exist "%ROOT_DIR%IkeaHome\AutoRun.exe" (
    echo [16/18] Launching IKEA Home Stuff...
    cd /d "%ROOT_DIR%IkeaHome"
    call "run_install.bat"
)

:: 17 - The Sims 2 Apartment Life (EP8)
if exist "%ROOT_DIR%ApartmentLife\AutoRun.exe" (
    echo [17/18] Launching Apartment Life...
    cd /d "%ROOT_DIR%ApartmentLife"
    call "run_install.bat"
)

:: 18 - The Sims 2 Mansion & Garden Stuff (SP9)
if exist "%ROOT_DIR%MansionGarden\AutoRun.exe" (
    echo [18/18] Launching Mansion ^& Garden Stuff...
    cd /d "%ROOT_DIR%MansionGarden"
    call "run_install.bat"
)

echo.
echo ===================================================
echo   COPYING BONUS CONTENT
echo ===================================================
echo.

:: Bonus Content (Copied from root)
cd /d "%ROOT_DIR%"
if exist "Content\EA Games" (
    echo Copying bonus content to Documents folder...
    robocopy "Content\EA Games" "%USERPROFILE%\Documents\EA Games" /E /IS /R:1 /W:1
)

echo.
echo ===================================================
echo   APPLYING FIXES AND GRAPHICS MODIFICATIONS
echo ===================================================
echo.

set "TARGET_DIR="

REM 1. Søger via App Paths (den mest pålidelige metode til selve exe-filen)
for /f "tokens=2*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Sims2EP9.exe" /v "Path" 2^>nul') do (
    set "TARGET_DIR=%%B"
)

REM 2. Hvis ikke fundet, søger den efter Mansion & Garden Stuff
if not defined TARGET_DIR (
    for /f "tokens=2*" %%A in ('reg query "HKLM\SOFTWARE\EA GAMES\The Sims 2 Mansion and Garden Stuff" /v "Install Dir" 2^>nul') do (
        set "TARGET_DIR=%%B"
    )
)

REM 3. Hvis ikke fundet, søger den efter Fun with Pets
if not defined TARGET_DIR (
    for /f "tokens=2*" %%A in ('reg query "HKLM\SOFTWARE\EA GAMES\The Sims 2 Fun with Pets" /v "Install Dir" 2^>nul') do (
        set "TARGET_DIR=%%B\SP9"
    )
)

REM 4. Fjerner eventuelle dobbelte skråstreger til sidst i stien
if defined TARGET_DIR (
    if "%TARGET_DIR:~-1%"=="\" set "TARGET_DIR=%TARGET_DIR:~0,-1%"
)

REM 5. Viser status og overfører filer UDEN >nul så man kan se eventuelle fejl
if defined TARGET_DIR (
    echo Fund folder: "%TARGET_DIR%"
    
    if exist "%~dp0fix\Sims2EP9.exe" (
        echo Copying Sims2EP9.exe...
        xcopy "%~dp0fix\Sims2EP9.exe" "%TARGET_DIR%\TSBin\" /Y /I /R
    ) else (
        echo ERROR: Did not find "%~dp0fix\Sims2EP9.exe"
    )

    if exist "%~dp0fix\Graphics Rules.sgr" (
        echo Copying Graphics Rules.sgr...
        xcopy "%~dp0fix\Graphics Rules.sgr" "%TARGET_DIR%\TSData\Res\Config\" /Y /I /R
        if exist "%TARGET_DIR%\TSData\Res\CSConfig\" (
            xcopy "%~dp0fix\Graphics Rules.sgr" "%TARGET_DIR%\TSData\Res\CSConfig\" /Y /I /R
        )
    ) else (
        echo ERROR: Did not find "%~dp0fix\Graphics Rules.sgr"
    )
) else (
    echo WARNING: Could not find The Sims 2 in the registry database.
)
pause

echo.
echo ===================================================
echo   INSTALLATION IS COMPLETELY FINISHED!
echo ===================================================
pause