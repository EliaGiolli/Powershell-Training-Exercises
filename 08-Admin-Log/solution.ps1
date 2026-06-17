<#
.SYNOPSIS
    Script di audit sicurezza: verifica permessi e log critici.
#>

# 1. Funzione di validazione permessi (Identity Check)
function Test-IsAdministrator {
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# 2. Funzione di estrazione log (Event Audit)
function Get-CriticalEvents {
    param([int]$MaxEvents = 20)
    return Get-WinEvent -FilterHashtable @{LogName = 'System'; Level = 1, 2} -MaxEvents $MaxEvents -ErrorAction SilentlyContinue
}

# Logica principale
if (Test-IsAdministrator) {
    Write-Host "[+] Privilegi di Amministratore confermati." -ForegroundColor Green
    $events = Get-CriticalEvents
    $events | Select-Object TimeCreated, Id, Message | Format-List
} else {
    Write-Warning "[-] Attenzione: Eseguire lo script come Amministratore per accedere ai log di sistema."
}