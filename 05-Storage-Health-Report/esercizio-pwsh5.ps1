# Esercizio originale
$report = Get-PSDrive -PSProvider FileSystem | ForEach-Object {
        [PSCustomObject]@{
            Name = $_.Name
            Free = $_.Free
            Used = $_.Used
            Total = $_.Free + $_.Used
            PercentFree = ($_.Free / ($_.Free + $_.Used)) * 100
        }
    } 
#Salva il report in formato tabella
$report | Format-Table
#Esporta il report in formato csv
$report | Export-Csv "C:\Users\elia_\OneDrive\Desktop\report.csv" -NoTypeInformation
# Importa il CSV se vuoi rileggerlo
$importedReport = Import-Csv "C:\Users\elia_\OneDrive\Desktop\report.csv"
$importedReport | Format-Table