<#
.SYNOPSIS
    Genera un report sullo stato dei dischi e lo esporta in CSV.
#>
param(
    [string]$ExportPath = "C:\Users\elia_\Desktop\DiskReport.csv"
)

# Funzione per convertire Bytes in GB
function Convert-BytesToGB {
    param([long]$Bytes)
    return [math]::Round($Bytes / 1GB, 2)
}

$report = Get-PSDrive -PSProvider FileSystem | ForEach-Object {
    $total = $_.Free + $_.Used
    [PSCustomObject]@{
        Drive        = $_.Name
        FreeGB       = Convert-BytesToGB($_.Free)
        UsedGB       = Convert-BytesToGB($_.Used)
        TotalGB      = Convert-BytesToGB($total)
        PercentFree  = [math]::Round(($_.Free / $total) * 100, 2)
    }
}

# Output a console
$report | Sort-Object PercentFree | Format-Table -AutoSize

# Esportazione
$report | Export-Csv -Path $ExportPath -NoTypeInformation
Write-Host "[+] Report esportato in: $ExportPath" -ForegroundColor Green