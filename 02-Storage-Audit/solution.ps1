<#
.SYNOPSIS
    Filtra file di testo basati sulla dimensione.
#>
param(
    [string]$Path = "C:\Users\elia_\OneDrive\Documenti",
    [int]$MinSizeKB = 10
)

# Calcolo soglia in byte
$minSizeBytes = $MinSizeKB * 1KB

Get-ChildItem -Path $Path -Filter "*.txt" -File | 
    Where-Object { $_.Length -gt $minSizeBytes } | 
    Sort-Object -Property Length -Descending |
    Select-Object Name, @{Name="Size(KB)"; Expression={[math]::Round($_.Length / 1KB, 2)}}, LastWriteTime