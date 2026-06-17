# Caso Studio | Storage Health Reporter

## 🎯 Scenario
Automazione del monitoraggio dello spazio su disco. Questo script permette a un IT Administrator di estrarre rapidamente una panoramica della capacità di archiviazione di tutti i drive collegati, facilitando la pianificazione del capacity planning.

## 🛠️ Implementazione
- **Data Transformation**: Conversione nativa da Bytes a GB tramite una funzione dedicata per migliorare la leggibilità umana.
- **Custom Object Creation**: Utilizzo di `[PSCustomObject]` per creare record strutturati pronti per l'analisi.
- **Data Persistence**: Esportazione in formato CSV per l'integrazione con Excel, PowerBI o sistemi di monitoraggio esterni.

## 💡 Best Practices per un SysAdmin
1. **Readable Reporting**: Mai esportare dati in Byte grezzi. Un report è utile solo se è immediatamente interpretabile.
2. **Standardization**: L'uso del CSV garantisce la portabilità del dato, permettendo di importare il report su qualsiasi altro sistema tramite `Import-Csv`.
3. **Abstraction**: Separando la logica di conversione (`Convert-BytesToGB`) dalla logica di raccolta, rendiamo il codice modulare e semplice da testare.

## 🚀 Esecuzione
```powershell
.\solution.ps1 -ExportPath "C:\Logs\StorageReport.csv"