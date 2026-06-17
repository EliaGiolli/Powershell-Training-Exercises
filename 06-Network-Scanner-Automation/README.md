# Caso Studio | Automated Network Reachability Scanner

## 🎯 Scenario
Strumento di diagnostica rapida per verificare lo stato di attività di un set di host in rete. Utilizzato per il monitoraggio di base (Up/Down) di server, gateway o dispositivi IoT.

## 🛠️ Implementazione
- **Ping Sweep Automation**: Sfrutta la cmdlet `Test-Connection` per interrogare gli host in parallelo o sequenza.
- **Robustness**: Implementa `-ErrorAction SilentlyContinue` per evitare che lo script si interrompa su host irraggiungibili o timeout, garantendo il completamento dell'intera lista.
- **Timestamping**: Aggiunta di un campo `Timestamp` per tracciare quando è avvenuta la scansione, essenziale per log di conformità.

## 💡 Best Practices per un SysAdmin
1. **Error Handling**: Non lasciare mai che lo script "esploda" se un IP non risponde. L'uso di `SilentlyContinue` è lo standard per evitare che lo script interrompa la pipeline.
2. **Naming Convention**: Il salvataggio del file CSV con la data (`NetworkScan_YYYYMMDD.csv`) è una pratica di *Versioned Logging* che evita sovrascritture accidentali.
3. **Reachable State**: Invece di un booleano (True/False), ho convertito l'output in "UP/DOWN" per renderlo leggibile immediatamente in report destinati a terze parti.

## 🚀 Esecuzione
```powershell
.\solution.ps1 -IpList "8.8.8.8", "192.168.1.1"