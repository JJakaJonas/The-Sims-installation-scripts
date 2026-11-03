@echo off
title The Sims 2 - Architecture Check

:: ========================================================
:: AUTOMATISK ADMINISTRATOR-TJEK OG AUTOMATISK GENSTART
:: ========================================================
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Administrative privileges not detected.
    echo Requesting elevation...
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

:: Ensure script keeps focusing on its actual folder location after elevation
pushd "%CD%"  
cd /d "%~dp0"
:: ========================================================

set __COMPAT_LAYER=RunAsInvoker
echo Checking system architecture...

:: Check if the operating system is 64-bit
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64bit
if "%PROCESSOR_ARCHITEW6432%"=="AMD64" goto 64bit

:32bit
echo This is a 32-bit system.
echo Launching 32-bit installation script...
call "installer_32bit.bat"
goto end

:64bit
echo This is a 64-bit system.
echo Launching 64-bit installation script...
call "installer_64bit.bat"
goto end

:end
exit
