@echo off
title The Sims 2 - Chronological Master Installer Launcher (64-bit)

:: Save the root folder as a variable
set "ROOT_DIR=%~dp0"
cd /d "%ROOT_DIR%"

echo ===================================================
echo   INSTALLING THE SIMS 2 - CHRONOLOGICAL COLLECTION
echo ===================================================
echo.

:: 01 - The Sims 2 Base Game
if exist "%ROOT_DIR%BaseGame\run_install.bat" (
    echo [01/18] Launching Base Game...
    cd /d "%ROOT_DIR%BaseGame"
    call "run_install.bat"
)

:: 02 - The Sims 2 University (EP1)
if not exist "%ROOT_DIR%University\Disc1.iso" goto SkipUniversity
echo [02/18] Launching University...
cd /d "%ROOT_DIR%University"
call "disc_mount_changer.bat"
:: Windows XP pause på 5 sekunder
ping -n 6 127.0.0.1 >nul
:SkipUniversity

:: 03 - The Sims 2 Nightlife (EP2)
if not exist "%ROOT_DIR%Nightlife\Disc1.iso" goto SkipNightlife
echo [02/18] Launching Nightlife...
cd /d "%ROOT_DIR%Nightlife"
call "disc_mount_changer.bat"
:: Windows XP pause på 5 sekunder
ping -n 6 127.0.0.1 >nul
:SkipNightlife

:: 
if exist "%ROOT_DIR%Nightlife\run_install.bat" (
    echo [03/18] Launching Nightlife...
    cd /d "%ROOT_DIR%Nightlife"
    call "run_install.bat"
)

:: 04 - The Sims 2 Family Fun Stuff (SP1)
if exist "%ROOT_DIR%FamilyFun\run_install.bat" (
    echo [04/18] Launching Family Fun Stuff...
    cd /d "%ROOT_DIR%FamilyFun"
    call "run_install.bat"
)

:: 05 - The Sims 2 Open for Business (EP3)
if exist "%ROOT_DIR%BestOfBusiness\run_install.bat" (
    echo [05/18] Launching Open for Business...
    cd /d "%ROOT_DIR%BestOfBusiness"
    call "run_install.bat"
)

:: 06 - The Sims 2 Glamour Life Stuff (SP2)
if exist "%ROOT_DIR%GlamourLife\run_install.bat" (
    echo [06/18] Launching Glamour Life Stuff...
    cd /d "%ROOT_DIR%GlamourLife"
    call "run_install.bat"
)

:: 07 - The Sims 2 Festive Holiday
if exist "%ROOT_DIR%FestiveHoliday\run_install.bat" (
    echo [07/18] Launching Festive Holiday Stuff...
    cd /d "%ROOT_DIR%FestiveHoliday"
    call "run_install.bat"
)

:: 08 - The Sims 2 Pets (EP4)
if exist "%ROOT_DIR%Pets\run_install.bat" (
    echo [08/18] Launching Pets...
    cd /d "%ROOT_DIR%Pets"
    call "run_install.bat"
)

:: 09 - The Sims 2 Celebration Stuff (SP3)
if exist "%ROOT_DIR%Celebration\run_install.bat" (
    echo [09/18] Launching Celebration Stuff...
    cd /d "%ROOT_DIR%Celebration"
    call "run_install.bat"
)

:: 10 - The Sims 2 Seasons (EP5)
if exist "%ROOT_DIR%Seasons\run_install.bat" (
    echo [10/18] Launching Seasons...
    cd /d "%ROOT_DIR%Seasons"
    call "run_install.bat"
)

:: 11 - The Sims 2 H&M Fashion Stuff (SP4)
if exist "%ROOT_DIR%HMFashion\run_install.bat" (
    echo [11/18] Launching H^&M Fashion Stuff...
    cd /d "%ROOT_DIR%HMFashion"
    call "run_install.bat"
)

:: 12 - The Sims 2 Bon Voyage (EP6)
if exist "%ROOT_DIR%BonVoyage\run_install.bat" (
    echo [12/18] Launching Bon Voyage...
    cd /d "%ROOT_DIR%BonVoyage"
    call "run_install.bat"
)

:: 13 - The Sims 2 Teen Style Stuff (SP5)
if exist "%ROOT_DIR%TeenStyle\run_install.bat" (
    echo [13/18] Launching Teen Style Stuff...
    cd /d "%ROOT_DIR%TeenStyle"
    call "run_install.bat"
)

:: 14 - The Sims 2 Kitchen & Bath Interior Design Stuff (SP6)
if exist "%ROOT_DIR%KitchenBath\run_install.bat" (
    echo [14/18] Launching Kitchen ^& Bath Stuff...
    cd /d "%ROOT_DIR%KitchenBath"
    call "run_install.bat"
)

:: 15 - The Sims 2 FreeTime (EP7)
if exist "%ROOT_DIR%FreeTime\run_install.bat" (
    echo [15/18] Launching FreeTime...
    cd /d "%ROOT_DIR%FreeTime"
    call "run_install.bat"
)

:: 16 - The Sims 2 IKEA Home Stuff (SP7)
if exist "%ROOT_DIR%IkeaHome\run_install.bat" (
    echo [16/18] Launching IKEA Home Stuff...
    cd /d "%ROOT_DIR%IkeaHome"
    call "run_install.bat"
)

:: 17 - The Sims 2 Apartment Life (EP8)
if exist "%ROOT_DIR%ApartmentLife\run_install.bat" (
    echo [17/18] Launching Apartment Life...
    cd /d "%ROOT_DIR%ApartmentLife"
    call "run_install.bat"
)

:: 18 - The Sims 2 Mansion & Garden Stuff (SP9)
if exist "%ROOT_DIR%MansionGarden\run_install.bat" (
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

:: Detect install path in the 64-bit Program Files (x86) environment
set "TARGET_DIR=%ProgramFiles(x86)%\EA GAMES\The Sims 2 Mansion and Garden Stuff"
if not exist "%TARGET_DIR%\" (
    set "TARGET_DIR=%ProgramFiles(x86)%\EA GAMES\The Sims 2 Fun with Pets\SP9"
)

:: Jump to local Fix folder and copy files over
if exist "%ROOT_DIR%Fix" (
    cd /d "%ROOT_DIR%Fix"
    
    echo Applying No-CD executable to: %TARGET_DIR%
    if exist "Sims2EP9.exe" xcopy "Sims2EP9.exe" "%TARGET_DIR%\TSBin\" /Y /R

    echo Applying graphics fix ^(Graphics Rules^)...
    if exist "Graphics Rules.sgr" xcopy "Graphics Rules.sgr" "%TARGET_DIR%\TSData\Res\Config\" /Y /R
    if exist "Graphics Rules.sgr" xcopy "Graphics Rules.sgr" "%TARGET_DIR%\TSData\Res\CsConfig\" /Y /R
) else (
    echo [WARNING] Fix folder was not found in root. Skipping game patches.
)

echo.
echo ===================================================
echo   INSTALLATION IS COMPLETELY FINISHED!
echo ===================================================
pause
