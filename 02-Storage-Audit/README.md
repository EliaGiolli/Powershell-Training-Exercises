# Caso di studio | Storage Audit: File System Filtering

## 🎯 Scenario
In un ambiente di amministrazione sistemi, è frequente la necessità di identificare file "di log" o documenti di testo eccessivamente grandi che potrebbero indicare anomalie, file di dump o cattiva gestione dello spazio su disco.

## 🛠️ Implementazione
Ho sviluppato uno script che automatizza la ricerca, il filtraggio e l'ordinamento dei file `.txt` all'interno di una directory specifica.

### Caratteristiche importanti:
- **Pipeline Processing**: Utilizzo della pipeline (`|`) per passare l'output di `Get-ChildItem` direttamente ai filtri.
- **Filtraggio dinamico**: Uso di `Where-Object` per isolare solo i file che superano una determinata soglia dimensionale.
- **Proprietà calcolate**: Conversione dei Byte in KB in fase di visualizzazione per migliorare la leggibilità dell'output.

## 💡 Perché è importante?
A differenza di un comando singolo digitato al volo, questo script:
1. **Promuove la riusabilità**: Grazie all'uso dei `param()`, può essere eseguito su qualsiasi percorso senza modificare il codice sorgente.
2. **Standardizza il reporting**: Formatta l'output in modo che sia facilmente leggibile o esportabile per un report periodico di manutenzione.

## 🚀 Come eseguirlo
```powershell
.\solution.ps1 -Path "C:\TuoiDocumenti" -MinSizeKB 50