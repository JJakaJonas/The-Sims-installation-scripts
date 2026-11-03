@echo off
title The Sims 2 - Master Installer

:: Ensure script runs from its actual folder location
pushd "%CD%"  
cd /d "%~dp0"

:: Importing all license keys first (Added .reg extension check for 32-bit)
if exist "keys_single_discs_32_bit.reg" (
    regedit /s "keys_single_discs_32_bit.reg"
) else (
    echo [WARNING] License registry file not found. Skipping registry import.
)

:: Forces Windows to bypass the expired certificate block
set __COMPAT_LAYER=RunAsInvoker

echo ===================================================
echo   INSTALLING THE SIMS 2 COLLECTION
echo ===================================================
echo.

:: 01 - Base Game
if exist "BaseGame\AutoRun.exe" (
    echo Installing 01 - The Sims 2 Base Game...
    start /wait "" "BaseGame\AutoRun.exe" /s /v"/qn"
) else ( echo [MISSING] Base Game folder or setup.exe not found! )

:: 02 - University
if exist "University\AutoRun.exe" (
    echo Installing 02 - University...
    start /wait "" "University\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] University is not available. )

if exist "Patches\sims2ep1_patch.exe" (
    echo Patching University...
    start /wait "" "Patches\sims2ep1_patch.exe" /s
)

:: 03 - Nightlife
if exist "Nightlife\AutoRun.exe" (
    echo Installing 03 - Nightlife...
    start /wait "" "Nightlife\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] Nightlife is not available. )

if exist "Patches\sims2ep2_patch.exe" (
    echo Patching Nightlife...
    start /wait "" "Patches\sims2ep2_patch.exe" /s
)

:: 04 - Festive Holiday
if exist "FestiveHoliday\setup.exe" (
    echo Installing 04 - Festive Holiday...
    start /wait "" "FestiveHoliday\setup.exe" /s /v"/qn"
) else ( echo [SKIPPED] Festive Holiday is not available. )

:: 05 - Open for Business
if exist "OpenForBusiness\AutoRun.exe" (
    echo Installing 05 - Open for Business...
    start /wait "" "OpenForBusiness\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] Open for Business is not available. )

if exist "Patches\sims2ep3_patch.exe" (
    echo Patching Open for Business...
    start /wait "" "Patches\sims2ep3_patch.exe" /s
)

:: 06 - Family Fun Stuff
if exist "FamilyFun\AutoRun.exe" (
    echo Installing 06 - Family Fun Stuff...
    start /wait "" "FamilyFun\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] Family Fun Stuff is not available. )

:: 07 - Glamour Life Stuff
if exist "GlamourLife\AutoRun.exe" (
    echo Installing 07 - Glamour Life Stuff...
    start /wait "" "GlamourLife\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] Glamour Life Stuff is not available. )

:: 08 - Pets
if exist "Pets\AutoRun.exe" (
    echo Installing 08 - Pets...
    start /wait "" "Pets\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] Pets is not available. )

if exist "Patches\sims2ep4_patch.exe" (
    echo Patching Pets...
    start /wait "" "Patches\sims2ep4_patch.exe" /s
)

:: 09 - Seasons
if exist "Seasons\AutoRun.exe" (
    echo Installing 09 - Seasons...
    start /wait "" "Seasons\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] Seasons is not available. )

if exist "Patches\sims2ep5_patch.exe" (
    echo Patching Seasons...
    start /wait "" "Patches\sims2ep5_patch.exe" /s
)

:: 10 - Celebration Stuff
if exist "Celebration\AutoRun.exe" (
    echo Installing 10 - Celebration Stuff...
    start /wait "" "Celebration\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] Celebration Stuff is not available. )

:: 11 - H&M Fashion Stuff
if exist "HM_Fashion\AutoRun.exe" (
    echo Installing 11 - H^&M Fashion Stuff...
    start /wait "" "HM_Fashion\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] H^&M Fashion Stuff is not available. )

:: 12 - Bon Voyage
if exist "BonVoyage\AutoRun.exe" (
    echo Installing 12 - Bon Voyage...
    start /wait "" "BonVoyage\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] Bon Voyage is not available. )

if exist "Patches\sims2ep6_patch.exe" (
    echo Patching Bon Voyage...
    start /wait "" "Patches\sims2ep6_patch.exe" /s
)

:: 13 - Teen Style Stuff
if exist "TeenStyle\AutoRun.exe" (
    echo Installing 13 - Teen Style Stuff...
    start /wait "" "TeenStyle\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] Teen Style Stuff is not available. )

:: 14 - FreeTime
if exist "FreeTime\AutoRun.exe" (
    echo Installing 14 - FreeTime...
    start /wait "" "FreeTime\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] FreeTime is not available. )

if exist "Patches\sims2ep7_patch.exe" (
    echo Patching FreeTime...
    start /wait "" "Patches\sims2ep7_patch.exe" /s
)

:: 15 - Kitchen & Bath Stuff
if exist "KitchenBath\AutoRun.exe" (
    echo Installing 15 - Kitchen ^& Bath Stuff...
    start /wait "" "KitchenBath\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] Kitchen ^& Bath Stuff is not available. )

:: 16 - IKEA Home Stuff
if exist "IkeaHome\AutoRun.exe" (
    echo Installing 16 - IKEA Home Stuff...
    start /wait "" "IkeaHome\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] IKEA Home Stuff is not available. )

:: 17 - Apartment Life
if exist "ApartmentLife\AutoRun.exe" (
    echo Installing 17 - Apartment Life...
    start /wait "" "ApartmentLife\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] Apartment Life is not available. )

if exist "Patches\sims2ep8_patch.exe" (
    echo Patching Apartment Life...
    start /wait "" "Patches\sims2ep8_patch.exe" /s
)

:: 18 - Mansion & Garden Stuff
if exist "MansionGarden\AutoRun.exe" (
    echo Installing 18 - Mansion ^& Garden Stuff...
    start /wait "" "MansionGarden\AutoRun.exe" /s /v"/qn"
) else ( echo [SKIPPED] Mansion ^& Garden Stuff is not available. )

if exist "Patches\sims2sp9_patch.exe" (
    echo Patching Mansion ^& Garden...
    start /wait "" "Patches\sims2sp9_patch.exe" /s
)

:: Extra Content
if exist "Content\EA Games" (
    echo Copying extra content...
    robocopy "Content\EA Games" "%USERPROFILE%\Documents\EA Games" /E /IS /R:1 /W:1
)

echo.
echo ===================================================
echo   APPLYING FIXES ^& GRAPHICS MODIFICATIONS
echo ===================================================
echo.

:: Copy and overwrite fix file to Mansion & Garden Stuff
echo Applying No-CD executable...
if exist "Fix\Sims2EP9.exe" (
    xcopy "Fix\Sims2EP9.exe" "%ProgramFiles%\EA GAMES\The Sims 2 Mansion and Garden Stuff\TSBin\" /Y /R
) else (
    echo [WARNING] Fix file (Sims2EP9.exe) not found in script folder.
)

:: Copy and overwrite modern Graphics Rules fix
echo Applying modern graphics fix for Windows 11...
if exist "Fix\Graphics Rules.sgr" (
    xcopy "Fix\Graphics Rules.sgr" "%ProgramFiles%\EA GAMES\The Sims 2 Mansion and Garden Stuff\TSData\Res\Config\" /Y /R
    xcopy "Fix\Graphics Rules.sgr" "%ProgramFiles%\EA GAMES\The Sims 2 Mansion and Garden Stuff\TSData\Res\CsConfig\" /Y /R
)

echo.
echo ===================================================
echo   INSTALLATION IS DONE.. ENJOY PLAYING.
echo ===================================================
pause
