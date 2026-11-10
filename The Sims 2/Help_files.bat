@echo off

:: Navnet på filen
set "FILENAME=PortableWinCDEmu-4.0.exe"

:: Direkte download-link fra den officielle GitHub
set "DOWNLOAD_URL=https://github.com/sysprogs/WinCDEmu/releases/download/v4.1/PortableWinCDEmu-4.0.exe"

:: Tjek om programmet findes, ellers download det
if not exist "%FILENAME%" (
    echo [FAILSAFE] %FILENAME% missing. Downloading now...
    curl -L -o "%FILENAME%" "%DOWNLOAD_URL%"
)

:: Start programmet
echo [INFO] Starting %FILENAME%...
start /min "" "%FILENAME%"

exit /b 0
