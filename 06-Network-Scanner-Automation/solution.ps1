<#
.SYNOPSIS
    Esegue un ping sweep su una lista di indirizzi IP.
#>
param(
    [string[]]$IpList = @("192.168.2.1", "10.0.0.1")
)

Write-Host "[*] Inizio scansione rete..." -ForegroundColor Cyan

$report = $IpList | ForEach-Object {
    $ip = $_
    # Utilizziamo Test-Connection con un timeout breve (1 secondo)
    $isUp = Test-Connection -ComputerName $ip -Count 1 -Quiet -ErrorAction SilentlyContinue
    
    [PSCustomObject]@{
        Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        IP        = $ip
        Reachable = if ($isUp) { "UP" } else { "DOWN" }
    }
}

$report | Format-Table -AutoSize
# Esporta il report per analisi post-mortem
$report | Export-Csv -Path ".\NetworkScan_$(Get-Date -Format 'yyyyMMdd').csv" -NoTypeInformation