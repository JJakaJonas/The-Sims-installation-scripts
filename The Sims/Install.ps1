# Ensure the script runs from the directory it is located in
$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
Set-Location $PSScriptRoot

# Sørg for at scriptet kører som Administrator
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "[Info] Genstarter scriptet med Administrator-rettigheder..." -ForegroundColor Yellow
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

$TxtFil = Join-Path $PSScriptRoot "Serials.txt"

Write-Host "=== Starting The Sims 1 Universal Installation Sequence ===" -ForegroundColor Green

# ------------------------------------------------------------------------------
# DETECT OS VERSION & ARCHITECTURE (XP to Win 11 Safe)
# ------------------------------------------------------------------------------
$OSVersion = [Environment]::OSVersion.Version
$IsWindowsXP = $OSVersion.Major -eq 5  # Windows XP is version 5.x

# Check if 64-bit (Safe approach for older .NET versions on XP)
$Is64Bit = $false
if ($env:PROCESSOR_ARCHITECTURE -eq "AMD64" -or $env:PROCESSOR_ARCHITEW6432 -eq "AMD64") {
    $Is64Bit = $true
}

if ($IsWindowsXP) {
    Write-Host "[Info] System detected as: Windows XP (Legacy Mode Active)" -ForegroundColor Yellow
    $RegBaseSti = "HKLM:\SOFTWARE\Electronic Arts\Maxis\"
    $UseRunAs = $false
} elseif ($Is64Bit) {
    Write-Host "[Info] System detected as: 64-bit modern Windows" -ForegroundColor Gray
    $RegBaseSti = "HKLM:\SOFTWARE\Wow6432Node\Electronic Arts\Maxis\"
    $UseRunAs = $true
} else {
    Write-Host "[Info] System detected as: 32-bit modern Windows" -ForegroundColor Gray
    $RegBaseSti = "HKLM:\SOFTWARE\Electronic Arts\Maxis\"
    $UseRunAs = $true
}

# ------------------------------------------------------------------------------
# 1. LOAD SERIAL NUMBERS FROM EXTERNAL FILE
# ------------------------------------------------------------------------------
if (-not (Test-Path $TxtFil)) {
    Write-Host "[-] ERROR: Could not find '$TxtFil'. Please create the file first." -ForegroundColor Red
    Exit
}

Write-Host "1. Loading registration keys from $TxtFil..." -ForegroundColor Yellow
$Koder = @{}
Get-Content $TxtFil | ForEach-Object {
    if ($_ -match '^([^=]+)=(.*)$') {
        $Key = $Matches[1].Trim()
        $Val = $Matches[2].Trim()
        $Koder[$Key] = $Val
    }
}

# Function to write keys to the registry based on architecture (XP compatible)
function Set-SimsSerial ($UnderSti, $Serial) {
    if (-not $Serial) { return }
    
    $RegSti = "$RegBaseSti$UnderSti"
    
    if (-not (Test-Path $RegSti)) {
        New-Item -Path $RegSti -Force | Out-Null
    }
    $RenSerial = $Serial -replace '-', ''
    New-ItemProperty -Path $RegSti -Name "ERGc" -Value $RenSerial -PropertyType "String" -Force | Out-Null
    New-ItemProperty -Path $RegSti -Name "Serial" -Value $RenSerial -PropertyType "String" -Force | Out-Null
}

try {
    Set-SimsSerial "The Sims\1.00.000" -Serial $Koder["BaseGame"]
    Set-SimsSerial "The Sims Livin' Large\1.00.000" -Serial $Koder["LivinLarge"]
    Set-SimsSerial "The Sims House Party\1.00.000" -Serial $Koder["HouseParty"]
    Set-SimsSerial "The Sims Hot Date\1.00.000" -Serial $Koder["HotDate"]
    Set-SimsSerial "The Sims Vacation\1.00.000" -Serial $Koder["Vacation"]
    Set-SimsSerial "The Sims Unleashed\1.00.000" -Serial $Koder["Unleashed"]
    Set-SimsSerial "The Sims Superstar\1.00.000" -Serial $Koder["Superstar"]
    Set-SimsSerial "The Sims Makin' Magic\1.00.000" -Serial $Koder["MakinMagic"]
    Write-Host "[+] Registration keys successfully injected into the registry!" -ForegroundColor Green
} catch {
    Write-Host "[-] Error writing to the registry: $_" -ForegroundColor Red
}

# ------------------------------------------------------------------------------
# 2. RUN INSTALLERS (WITH FAIL-SAFE CHECKS)
# ------------------------------------------------------------------------------
Write-Host "`n2. Launching installation programs..." -ForegroundColor Yellow
Write-Host "Complete the on-screen dialogs. The script will automatically wait for each part." -ForegroundColor Gray
Write-Host "------------------------------------------------------------------"

$InstallationsRækkefølge = @(
    @{ Navn = "1. Base Game";        Mappe = "BaseGame";    Sti = "BaseGame\Setup.exe" },
    @{ Navn = "2. Livin' Large";     Mappe = "LivinLarge";    Sti = "LivinLarge\Start.exe" },
    @{ Navn = "3. House Party";      Mappe = "HouseParty";    Sti = "HouseParty\Start.exe" },
    @{ Navn = "4. Hot Date";         Mappe = "HotDate";       Sti = "HotDate\Start.exe" },
    @{ Navn = "5. Vacation";         Mappe = "Vacation";      Sti = "Vacation\Start.exe" },
    @{ Navn = "6. Unleashed";        Mappe = "Unleashed";     Sti = "Unleashed\Start.exe" },
    @{ Navn = "7. Superstar";        Mappe = "Superstar";     Sti = "Superstar\Start.exe" },
    @{ Navn = "8. Makin' Magic";     Mappe = "MakinMagic";    Sti = "MakinMagic\Start.exe" }
)

foreach ($Spil in $InstallationsRækkefølge) {
    $FuldMappeSti = Join-Path $PSScriptRoot $Spil.Mappe
    $FuldExeSti = Join-Path $PSScriptRoot $Spil.Sti
    
    if (-not (Test-Path $FuldMappeSti)) {
        Write-Host "[-] SKIPPED: $($Spil.Navn) (Folder '$($Spil.Mappe)' does not exist!)" -ForegroundColor Red
        Write-Host "--------------------------------------------------"
        continue
    }
    
    $FilTjek = Get-ChildItem -Path $FuldMappeSti -Recurse -File -ErrorAction SilentlyContinue
    if ($FilTjek.Count -lt 5) {
        Write-Host "[-] SKIPPED: $($Spil.Navn) (Folder is empty or missing installation files!)" -ForegroundColor Red
        Write-Host "--------------------------------------------------"
        continue
    }

    if (-not (Test-Path $FuldExeSti)) {
        Write-Host "[-] SKIPPED: $($Spil.Navn) ('$($Spil.Sti)' not found inside folder!)" -ForegroundColor Red
        Write-Host "--------------------------------------------------"
        continue
    }

    Write-Host "Now installing: $($Spil.Navn)..." -ForegroundColor Cyan
    
    if ($UseRunAs) {
        Start-Process -FilePath $FuldExeSti -Wait -Verb RunAs
    } else {
        Start-Process -FilePath $FuldExeSti -Wait
    }
    
    Write-Host "[+] Finished with: $($Spil.Navn)." -ForegroundColor Green
    Write-Host "--------------------------------------------------"
}

# ------------------------------------------------------------------------------
# 3. COPY NO-CD PATCH FROM FIX FOLDER
# ------------------------------------------------------------------------------
Write-Host "`n3. Handling Windows No-CD Patch..." -ForegroundColor Yellow

$StandardStier = @()
if ($env:ProgramFiles) { $StandardStier += "$env:ProgramFiles\Maxis\The Sims" }
$ProgFilesX86 = ${env:ProgramFiles(x86)}
if ($ProgFilesX86) { $StandardStier += "$ProgFilesX86\Maxis\The Sims" }
$StandardStier += "C:\Program Files\Maxis\The Sims"
$StandardStier += "C:\Program Files (x86)\Maxis\The Sims"

$InstallationsMappe = $null
foreach ($Sti in $StandardStier) {
    if (Test-Path $Sti) { $InstallationsMappe = $Sti; break }
}

$LokalPatchFil = Join-Path $PSScriptRoot "fix\Sims.exe"

if ($InstallationsMappe -and (Test-Path $LokalPatchFil)) {
    $MålFil = Join-Path $InstallationsMappe "Sims.exe"
    $BackupFil = Join-Path $InstallationsMappe "Sims.old"
    
    try {
        if (Test-Path $MålFil) {
            Move-Item -Path $MålFil -Destination $BackupFil -Force -ErrorAction SilentlyContinue
            Write-Host "[+] Original Sims.exe renamed to Sims.old (Backup)" -ForegroundColor Gray
        }
        Copy-Item -Path $LokalPatchFil -Destination $MålFil -Force
        Write-Host "[+] Success! No-CD patch (Sims.exe) copied from \fix to: $InstallationsMappe" -ForegroundColor Green
    } catch {
        Write-Host "[-] Could not copy the No-CD patch: $_" -ForegroundColor Red
    }
} else {
    if (-not $InstallationsMappe) {
        Write-Host "[-] Error: Could not find the installation folder automatically." -ForegroundColor Red
    }
    if (-not (Test-Path $LokalPatchFil)) {
        Write-Host "[-] Error: Could not find 'Sims.exe' inside the '\fix' subfolder." -ForegroundColor Red
    }
}

# ------------------------------------------------------------------------------
# 4. AUTOMATIC WIDESCREEN TWEAK
# ------------------------------------------------------------------------------
if ($InstallationsMappe) {
    Write-Host "`n4. Applying Widescreen resolution registry tweaks (1920x1080)..." -ForegroundColor Yellow
    try {
        $SimsRegPath = "$RegBaseSti\The Sims"
        if (Test-Path $SimsRegPath) {
            New-ItemProperty -Path $SimsRegPath -Name "ScreenW" -Value 1920 -PropertyType "DWord" -Force | Out-Null
            New-ItemProperty -Path $SimsRegPath -Name "ScreenH" -Value 1080 -PropertyType "DWord" -Force | Out-Null
            Write-Host "[+] Resolution successfully forced to 1920x1080!" -ForegroundColor Green
        }
    } catch {
        Write-Host "[-] Could not write resolution values to registry: $_" -ForegroundColor Red
    }

    # ------------------------------------------------------------------------------
    # 5. AUTOMATIC DESKTOP SHORTCUT WITH OS CHECK
    # ------------------------------------------------------------------------------
    Write-Host "`n5. Creating shortcut on Desktop..." -ForegroundColor Yellow
    try {
        $WshShell = New-Object -ComObject WScript.Shell
        $Skrivebord = [System.IO.Path]::Combine([Environment]::GetFolderPath("Desktop"), "The Sims 1.lnk")
        
        $Genvej = $WshShell.CreateShortcut($Skrivebord)
        $Genvej.TargetPath = Join-Path $InstallationsMappe "Sims.exe"
        $Genvej.WorkingDirectory = $InstallationsMappe
        
        if ($IsWindowsXP) {
            Write-Host "[Info] Opsætter standard genvej til Windows XP..." -ForegroundColor Gray
        } else {
            Write-Host "[Info] Opsætter genvej til moderne Windows (10/11)..." -ForegroundColor Gray
        }

        $Genvej.Save()
        Write-Host "[+] Desktop shortcut successfully created!" -ForegroundColor Green
    } catch {
        Write-Host "[-] Could not create desktop shortcut: $_" -ForegroundColor Red
    }
}