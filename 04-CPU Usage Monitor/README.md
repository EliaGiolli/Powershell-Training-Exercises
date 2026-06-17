# Caso Studio | Process Resource Monitor

## 🎯 Scenario
Monitoraggio in tempo reale dei processi che eccedono una soglia critica di utilizzo CPU. Indispensabile per identificare processi "zombie" o leak di risorse che impattano sulle performance del sistema.

## 🛠️ Implementazione
Questo script esegue:
1. **Filtering**: `Where-Object` isola i processi che superano il valore di soglia (in secondi di tempo CPU).
2. **Projection**: `Select-Object` con *Calculated Properties* per rinominare le proprietà standard e selezionare solo le metriche di interesse.
3. **Sorting**: `Sort-Object` applica un ordinamento discendente per mettere in evidenza il processo più energivoro.

## 💡 Best Practices per un SysAdmin
- **Performance tuning**: L'utilizzo di `[math]::Round` non è solo estetico: serve a rendere il report finale più leggibile quando i dati vengono esportati in file CSV per analisi storiche.
- **Parametrizzazione**: L'uso del parametro `$Threshold` permette di adattare il tool a diverse policy aziendali (es. 2 secondi per server di produzione, 10 secondi per workstation di sviluppo).

## 🚀 Esempio d'uso
```powershell
# Monitora processi con oltre 5 secondi di CPU
.\solution.ps1 -Threshold 5