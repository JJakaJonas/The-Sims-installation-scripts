# ====================================================================
# SIMS 3 SEMI-AUTOMATISK INSTALLATION (WITH CD-KEY PROMPT)
# ====================================================================

\$SourceFolder = "$PSScriptRoot" #Source folder goes here
LogFile = "env:USERPROFILE\Desktop\Sims3_Installation_Log.txt"

Start-Transcript -Path \$LogFile

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "Starting installation. You will be asked for keys along the way." -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan

if (-not (Test-Path -Path \$SourceFolder)) {
    Write-Error "Error: Folder not found!"
    Stop-Transcript
    Exit
}

# finding the nummeradet files (01_..., 02_...)
Installers = Get-ChildItem -Path SourceFolder -Filter "*.exe" -Recurse | Sort-Object Name

foreach (Installer in Installers) {
    Write-Host "`nOpening: $($Installer.Name)... Waiting for you to typing." -ForegroundColor Yellow
    
    # /s running the installation in "silent" mode for basic stuff, but it allows the CD-key popup to activate
    $Arguments = "/s" 
    
    try {
        # The script is waiting (-Wait) til the current installation is done before it runs the next one.
        $Process = Start-Process -FilePath $Installer.FullName -ArgumentList $Arguments -Wait -NoNewWindow -PassThru
        
        if ($Process.ExitCode -eq 0) {
            Write-Host "Done! $($Installer.Name) is installed." -ForegroundColor Green
        } else {
            Write-Warning "WARNING: $($Installer.Name) closed with code: $($Process.ExitCode)"
        }
    }
    catch {
        Write-Error "Could not start $($Installer.Name). Error: $_"
    }
}

Write-Host "`n==================================================" -ForegroundColor Green
Write-Host "All installers have been runned!" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green

Stop-Transcript
