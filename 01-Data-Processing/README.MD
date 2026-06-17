#🎯Data Processing | Descrizione dell'esercizio
L'obiettivo iniziale era la numerazione sequenziale di un array di stringhe. L'approccio imperativo (`foreach` con contatore esterno `$count++`) è procedurale e difficile da integrare in pipeline più complesse.

## 💡 Professional Refactoring
Ho trasformato il codice seguendo le best practice di PowerShell:

- **Pipeline Processing**: Invece di usare un ciclo esplicito, ho utilizzato la pipeline (|), che è il cuore dell'automazione in Windows.

- **Calculated Properties**: Ho utilizzato `Select-Object` con una proprietà calcolata (Expression). Questo approccio è stateless (o quasi) rispetto a un contatore esterno, rendendo lo script più resiliente.

- **Data Structuring**: Il risultato non è più un semplice testo stampato a video (`Write-Host`), ma un oggetto. Questo permette di passare l'output a comandi come Export-Csv, Sort-Object o `Where-Object` senza dover modificare lo script.

## 🛠️ Key Learnings
- Non bisogna usare `Write-Host` per i dati dati statici: `Write-Host` è solo per output visivo. Se devi processare dati, genera sempre oggetti.

- **Separation of concerns**: Lo script ora separa la generazione del dato (l'oggetto) dalla visualizzazione (Format-Table). Questo è un concetto fondamentale in ogni linguaggio di scripting professionale.