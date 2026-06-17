<#
.SYNOPSIS
    Identifica processi ad alto consumo di CPU.
#>
param(
    [double]$Threshold = 2.0
)

# Utilizziamo Get-Process con la pipeline per formattare l'output
Get-Process | Where-Object { $_.CPU -gt $Threshold } | 
    Sort-Object CPU -Descending |
    Select-Object @{Name="ProcessName"; Expression={$_.Name}}, 
                  @{Name="PID"; Expression={$_.Id}}, 
                  @{Name="CpuUsageSec"; Expression={[math]::Round($_.CPU, 2)}} |
    Format-Table -AutoSize