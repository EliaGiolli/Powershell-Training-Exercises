$strings = @("Pandolfo", "Arnaldo", "Gandolfo", "Gandalf", "Giangiacomo")

# Ho trasformato l'array di stringhe in una collezione di oggetti enumerati
$processedData = $strings | Select-Object @{Name='ID'; Expression={$script:i = ($script:i + 1)}}, @{Name='Name'; Expression={$_}}

# Output strutturato (mostra come una tabella professionale)
$processedData | Format-Table -AutoSize

# Esportazione professionale (simuliamo un report)
# $processedData | Export-Csv -Path "report.csv" -NoTypeInformation