@echo off
set "MNT=%~dp0..\PortableWinCDEmu-4.0.exe"
set "DISC1=%~dp0Disc1.iso"
set "DISC2=%~dp0Disc2.iso"
set "DRIVE=Z:"

:: 1. Mount Disc 1 to Z: and start the installer
echo Mounting Disc 1...
"%MNT%" "%DISC1%" %DRIVE% /wait

:: Give Windows XP a couple of seconds to register the drive
ping -n 3 127.0.0.1 >nul

:: Launch setup (do NOT use /wait here if the installer stays open while asking for Disc 2)
start "" "%DRIVE%\run_install.bat"

:: 2. Pause the script until the installer asks for Disc 2
echo.
echo Run the installation. When prompted for Disc 2, press any key here to swap discs...
pause >nul

:: 3. Unmount Disc 1 and mount Disc 2 to the exact same drive letter (Z:)
echo Swapping to Disc 2...
"%MNT%" /unmount %DRIVE% /wait
ping -n 2 127.0.0.1 >nul
"%MNT%" "%DISC2%" %DRIVE% /wait

:: 4. Pause the script until the installer asks for Disc 1
echo.
echo Disc 2 mounted to %DRIVE%. When prompted for Disc 1, press any key here to swap discs...
pause >nul

:: 5. Unmount Disc 2 and mount Disc 1 to the exact same drive letter (Z:)
echo Swapping to Disc 1...
"%MNT%" /unmount %DRIVE% /wait
ping -n 2 127.0.0.1 >nul
"%MNT%" "%DISC1%" %DRIVE% /wait

:: 6. Wait until the installation completely finishes before cleaning up
echo.
echo Disc 1 mounted to %DRIVE%. Complete the installation, then press any key to unmount...
pause >nul

"%MNT%" /unmountall
