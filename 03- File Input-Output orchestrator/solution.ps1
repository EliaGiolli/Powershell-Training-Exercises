<#
.SYNOPSIS
    Gestione robusta di file di testo.
#>
param(
    [string]$FilePath = "C:\temp\text.txt",
    [string]$Content = "Contenuto iniziale"
)

# 1. Verifica esistenza cartella genitore
$parentDir = Split-Path $FilePath
if (!(Test-Path $parentDir)) {
    Write-Host "[!] Cartella $parentDir non trovata. Creazione in corso..." -ForegroundColor Yellow
    New-Item -Path $parentDir -ItemType Directory | Out-Null
}

# 2. Creazione/Sovrascrittura sicura
Set-Content -Path $FilePath -Value $Content
Write-Host "[+] File creato/resettato con successo." -ForegroundColor Green

# 3. Append (aggiunta)
Add-Content -Path $FilePath -Value "--- Aggiunta in append: $(Get-Date) ---"

# 4. Lettura e validazione
Write-Host "[+] Contenuto attuale del file:" -ForegroundColor Cyan
Get-Content -Path $FilePath