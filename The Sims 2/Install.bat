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
:: Importerer alle licensnøgler lydløst først
regedit /s "C:\Sims2Installer\keys_enkelte.reg"

echo ===================================================
echo   INSTALLERER THE SIMS 2 (SEPARATE DISKE)
echo ===================================================
echo.

echo Installerer 01 - The Sims 2 Grundspil...
start /wait "" "C:\Sims2Installer\01_BaseGame\setup.exe" /s /v"/qn"

echo Installerer 02 - University...
start /wait "" "C:\Sims2Installer\02_University\setup.exe" /s /v"/qn"
echo Patcher University...
start /wait "" "C:\Sims2Installer\Patches\sims2ep1_patch.exe" /s

echo Installerer 03 - Nightlife...
start /wait "" "C:\Sims2Installer\03_Nightlife\setup.exe" /s /v"/qn"
echo Patcher Nightlife...
start /wait "" "C:\Sims2Installer\Patches\sims2ep2_patch.exe" /s

echo Installerer 04 - Christmas Stuff...
start /wait "" "C:\Sims2Installer\04_ChristmasStuff\setup.exe" /s /v"/qn"

echo Installerer 05 - Open for Business...
start /wait "" "C:\Sims2Installer\05_OpenForBusiness\setup.exe" /s /v"/qn"
echo Patcher Open for Business...
start /wait "" "C:\Sims2Installer\Patches\sims2ep3_patch.exe" /s

echo Installerer 06 - Family Fun Stuff...
start /wait "" "C:\Sims2Installer\06_FamilyFun\setup.exe" /s /v"/qn"

echo Installerer 07 - Glamour Life Stuff...
start /wait "" "C:\Sims2Installer\07_GlamourLife\setup.exe" /s /v"/qn"

echo Installerer 08 - Pets...
start /wait "" "C:\Sims2Installer\08_Pets\setup.exe" /s /v"/qn"
echo Patcher Pets...
start /wait "" "C:\Sims2Installer\Patches\sims2ep4_patch.exe" /s

echo Installerer 09 - Seasons...
start /wait "" "C:\Sims2Installer\09_Seasons\setup.exe" /s /v"/qn"
echo Patcher Seasons...
start /wait "" "C:\Sims2Installer\Patches\sims2ep5_patch.exe" /s

echo Installerer 10 - Celebration Stuff...
start /wait "" "C:\Sims2Installer\10_Celebration\setup.exe" /s /v"/qn"

echo Installerer 11 - H^&M Fashion Stuff...
start /wait "" "C:\Sims2Installer\11_HM_Fashion\setup.exe" /s /v"/qn"

echo Installerer 12 - Bon Voyage...
start /wait "" "C:\Sims2Installer\12_BonVoyage\setup.exe" /s /v"/qn"
echo Patcher Bon Voyage...
start /wait "" "C:\Sims2Installer\Patches\sims2ep6_patch.exe" /s

echo Installerer 13 - Teen Style Stuff...
start /wait "" "C:\Sims2Installer\13_TeenStyle\setup.exe" /s /v"/qn"

echo Installerer 14 - FreeTime...
start /wait "" "C:\Sims2Installer\14_FreeTime\setup.exe" /s /v"/qn"
echo Patcher FreeTime...
start /wait "" "C:\Sims2Installer\Patches\sims2ep7_patch.exe" /s

echo Installerer 15 - Kitchen ^& Bath Stuff...
start /wait "" "C:\Sims2Installer\15_KitchenBath\setup.exe" /s /v"/qn"

echo Installerer 16 - IKEA Home Stuff...
start /wait "" "C:\Sims2Installer\16_IkeaHome\setup.exe" /s /v"/qn"

echo Installerer 17 - Apartment Life...
start /wait "" "C:\Sims2Installer\17_ApartmentLife\setup.exe" /s /v"/qn"
echo Patcher Apartment Life...
start /wait "" "C:\Sims2Installer\Patches\sims2ep8_patch.exe" /s

echo Installerer 18 - Mansion ^& Garden Stuff...
start /wait "" "C:\Sims2Installer\18_MansionGarden\setup.exe" /s /v"/qn"
echo Patcher Mansion ^& Garden...
start /wait "" "C:\Sims2Installer\Patches\sims2sp9_patch.exe" /s

echo.
echo ===================================================
echo   INSTALLATIONEN ER FÆRDIG!
echo ===================================================
pause