# Caso Studio | System Infrastructure Reporter

## 🎯 Scenario
Tool di diagnostica rapida per l'inventario hardware e software. In un contesto aziendale, questo script è la base per generare report di conformità o per velocizzare l'apertura di ticket di supporto fornendo al tecnico tutte le info necessarie in un colpo solo.

## 🛠️ Implementazione
- **CIM/WMI Interfacing**: Utilizzo di `Get-CimInstance` per interrogare il database di gestione del sistema operativo.
- **Data Sanitization**: Uso di `.Trim()` sui nomi delle CPU per rimuovere spazi bianchi inutili e `[math]::Round` per normalizzare la RAM in GB leggibili.
- **Performance Optimization**: Ho evitato `Get-ComputerInfo` (che è lentissimo poiché carica migliaia di proprietà inutili) in favore di chiamate mirate a classi specifiche (CIM_ComputerSystem, Win32_OperatingSystem).

## 💡 Best Practices per un SysAdmin
1. **Performance over Convenience**: Evita `Get-ComputerInfo` se ti servono solo 2-3 dati. È come usare un bulldozer per spostare un vaso di fiori. Le chiamate mirate (`Get-CimInstance ClassName`) sono infinitamente più veloci.
2. **Standardization**: Restituire un `PSCustomObject` permette di convogliare questo report in file JSON, CSV o database SQL senza alcuna modifica al codice.
3. **OS Abstraction**: Utilizzare `Win32_OperatingSystem` è preferibile rispetto a proprietà di registro, poiché è l'interfaccia standard Microsoft garantita per il futuro.

## 🚀 Esecuzione
```powershell
# Mostra il report a video
Get-SystemSummary

# Esporta l'inventario in JSON per l'integrazione con sistemi di monitoraggio
Get-SystemSummary | ConvertTo-Json | Out-File "inventory.json"