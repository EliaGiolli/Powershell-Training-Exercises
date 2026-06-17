# Caso Studio | System Security & Audit Toolkit

## 🎯 Scenario
Strumenti fondamentali per la gestione della sicurezza:
1. **Privilege Validation**: Verifica che l'utente corrente abbia i diritti necessari prima di eseguire operazioni critiche.
2. **Event Log Auditing**: Monitoraggio proattivo degli errori critici (Level 1, 2) nel registro di sistema.

## 🛠️ Implementazione
- **.NET Interop**: Utilizzo delle classi `Security.Principal` per un controllo granulare dell'identità dell'utente.
- **Event Log Filtering**: Uso della `FilterHashtable` per eseguire query lato server sul registro eventi di Windows (molto più veloce rispetto al filtraggio post-estrazione).

## 💡 Best Practices per un SysAdmin
- **Fail Fast**: La verifica dei permessi (`Test-IsAdministrator`) deve essere sempre il primo blocco di ogni script critico. Evita che lo script inizi a eseguire operazioni parziali per poi crashare a metà a causa di "Accesso Negato".
- **Structured Error Handling**: L'uso di `Write-Warning` invece di una semplice stringa permette di integrare lo script in sistemi di monitoraggio che leggono i flussi di output standard.

## 🚀 Esecuzione
```powershell
.\solution.ps1