@echo off
REM  --> Check for permissions  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  

REM --> If error flag set, we do not have admin.  
if '%errorlevel%' NEQ '0' (  
    echo Requesting administrative privileges...  
    goto UACPrompt  
) else ( goto gotAdmin )  

:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B  

:gotAdmin  
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )   
    pushd "%CD%"  
    CD /D "%~dp0"  

@echo off
:: Importing all licens keys first
regedit /s "C:\Sims2Installer\keys_enkelte.reg"

echo ===================================================
echo   INSTALLING THE SIMS 2 COLLECTION
echo ===================================================
echo.

echo Installing 01 - The Sims 2 Base Game...
start /wait "" "BaseGame\setup.exe" /s /v"/qn"

echo Installing 02 - University...
start /wait "" "University\setup.exe" /s /v"/qn"
echo Patching University...
start /wait "" "Patches\sims2ep1_patch.exe" /s

echo Installing 03 - Nightlife...
start /wait "" "Nightlife\setup.exe" /s /v"/qn"
echo Patching Nightlife...
start /wait "" "Patches\sims2ep2_patch.exe" /s

echo Installing 04 - Christmas Stuff...
start /wait "" "ChristmasStuff\setup.exe" /s /v"/qn"

echo Installing 05 - Open for Business...
start /wait "" "OpenForBusiness\setup.exe" /s /v"/qn"
echo Patching Open for Business...
start /wait "" "Patches\sims2ep3_patch.exe" /s

echo Installing 06 - Family Fun Stuff...
start /wait "" "FamilyFun\setup.exe" /s /v"/qn"

echo Installing 07 - Glamour Life Stuff...
start /wait "" "GlamourLife\setup.exe" /s /v"/qn"

echo Installing 08 - Pets...
start /wait "" "Pets\setup.exe" /s /v"/qn"
echo Patching Pets...
start /wait "" "Patches\sims2ep4_patch.exe" /s

echo Installing 09 - Seasons...
start /wait "" "Seasons\setup.exe" /s /v"/qn"
echo Patching Seasons...
start /wait "" "Patches\sims2ep5_patch.exe" /s

echo Installing 10 - Celebration Stuff...
start /wait "" "Celebration\setup.exe" /s /v"/qn"

echo Installing 11 - H^&M Fashion Stuff...
start /wait "" "HM_Fashion\setup.exe" /s /v"/qn"

echo Installing 12 - Bon Voyage...
start /wait "" "BonVoyage\setup.exe" /s /v"/qn"
echo Patching Bon Voyage...
start /wait "" "Patches\sims2ep6_patch.exe" /s

echo Installing 13 - Teen Style Stuff...
start /wait "" "TeenStyle\setup.exe" /s /v"/qn"

echo Installing 14 - FreeTime...
start /wait "" "FreeTime\setup.exe" /s /v"/qn"
echo Patching FreeTime...
start /wait "" "Patches\sims2ep7_patch.exe" /s

echo Installing 15 - Kitchen ^& Bath Stuff...
start /wait "" "KitchenBath\setup.exe" /s /v"/qn"

echo Installing 16 - IKEA Home Stuff...
start /wait "" "IkeaHome\setup.exe" /s /v"/qn"

echo Installing 17 - Apartment Life...
start /wait "" "ApartmentLife\setup.exe" /s /v"/qn"
echo Patcher Apartment Life...
start /wait "" "Patches\sims2ep8_patch.exe" /s

echo Installing 18 - Mansion ^& Garden Stuff...
start /wait "" "MansionGarden\setup.exe" /s /v"/qn"
echo Patching Mansion ^& Garden...
start /wait "" "Patches\sims2sp9_patch.exe" /s

echo Copying extra content
robocopy "Content\EA Games" "%USERPROFILE%\Documents\EA Games" /E /IS /R:1 /W:1

echo.
echo ===================================================
echo   INSTALLATION IS DONE.. ENJOY PLAYING.
echo ===================================================
pause