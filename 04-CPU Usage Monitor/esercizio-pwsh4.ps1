# Esercizio originale
Get-Process | Where-Object { $_.CPU -gt 2} | Select-Object @{
    Name = "ProcessName"
    Expression = { $_.Name }
},
@{
    Name = "ProcessId"
    Expression = { $_.Id }
},
@{
    Name = "CpuUsage"
    Expression = { $_.CPU }
}