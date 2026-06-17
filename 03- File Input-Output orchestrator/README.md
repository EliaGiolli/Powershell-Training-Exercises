# Caso Studio | File I/O Orchestrator

## 🎯 Scenario
Gestione automatizzata di file di log o configurazione. Spesso gli script falliscono perché i percorsi di destinazione non sono pronti o perché si tenta di scrivere su file inesistenti.

## 🛠️ Implementazione
Questo script implementa una logica di **"Self-Healing"**:
- **Controllo preventivo**: Verifica tramite `Test-Path` se il percorso esiste, creando le directory necessarie se assenti.
- **Data Integrity**: Utilizza `Set-Content` per garantire uno stato noto (sovrascrittura) e `Add-Content` per mantenere lo storico (append).

## 💡 Best Practices per un SysAdmin
1. **Defensive Coding**: Non dare mai per scontato che il file system sia come te lo aspetti. Verifica sempre prima di scrivere.
2. **Logging timestamped**: Quando aggiungi contenuto (append), includi sempre un timestamp (`Get-Date`). È vitale quando dovrai fare troubleshooting sui log tra sei mesi.
3. **Out-Null**: Usiamo `| Out-Null` per evitare che comandi di sistema (come la creazione di una cartella) inquinino l'output pulito dello script.

## 🚀 Esecuzione
```powershell
.\solution.ps1 -FilePath "C:\Logs\app.log" -Content "Avvio processo"