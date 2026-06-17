# Esercizio originale

$ips = "192.168.2.1","192.168.20.14","192.168.10.5","10.10.1.0","10.0.0.1" |
    # Trasforms each element in a new object    
    ForEach-Object { [PSCustomObject]@{ Address = $_ } }

$ips | Export-Csv "C:\Users\elia_\OneDrive\Desktop\ip.csv" -NoTypeInformation

$report = Import-Csv "C:\Users\elia_\OneDrive\Desktop\ip.csv" |
    ForEach-Object {
        [PSCustomObject]@{
            IP        = $_.Address
            Reachable = Test-Connection -ComputerName $_.Address -Count 1 -Quiet
        }
    }

$report