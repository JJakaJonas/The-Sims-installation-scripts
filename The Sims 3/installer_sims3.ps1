# ====================================================================
# SIMS 3 SEMI-AUTOMATISK INSTALLATION (MED CD-KEY PROMPT)
# ====================================================================

\$SourceFolder = "C:\Sti\Til\Din\Sims3\Mappe" # RET DENNE STI!
LogFile = "env:USERPROFILE\Desktop\Sims3_Installation_Log.txt"

Start-Transcript -Path \$LogFile

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "Starter installationen. Du vil blive bedt om koder undervejs." -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan

if (-not (Test-Path -Path \$SourceFolder)) {
    Write-Error "Fejl: Kildemappen blev ikke fundet!"
    Stop-Transcript
    Exit
}

# Finder dine nummererede filer (01_..., 02_...)
Installers = Get-ChildItem -Path SourceFolder -Filter "*.exe" -Recurse | Sort-Object Name

foreach (Installer in Installers) {
    Write-Host "`nÅbner nu: $($Installer.Name)... Venter på din indtastning." -ForegroundColor Yellow
    
    # /s kører InstallShield i "silent" mode for de basale ting, men tillader CD-key vinduet at poppe op
    $Arguments = "/s" 
    
    try {
        # Scriptet venter (-Wait) indtil den nuværende pakke er helt færdig, før den åbner den næste
        $Process = Start-Process -FilePath $Installer.FullName -ArgumentList $Arguments -Wait -NoNewWindow -PassThru
        
        if ($Process.ExitCode -eq 0) {
            Write-Host "Færdig! $($Installer.Name) er installeret." -ForegroundColor Green
        } else {
            Write-Warning "Advarsel: $($Installer.Name) lukkede med kode: $($Process.ExitCode)"
        }
    }
    catch {
        Write-Error "Kunne ikke starte $($Installer.Name). Fejl: $_"
    }
}

Write-Host "`n==================================================" -ForegroundColor Green
Write-Host "Alle installere har været kørt!" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green

Stop-Transcript
