# Network Troubleshooting Automator

## 🎯 Scenario
Tool di diagnostica per identificare il punto di rottura della comunicazione tra due host. Distingue tra problemi di Layer 3 (ICMP negato/Firewall) e problemi di Layer 2 (mancata risoluzione ARP).

## 🛠️ Logic
1. **ICMP Test**: Verifica la raggiungibilità a livello IP.
2. **ARP Verification**: Analizza la cache locale tramite `arp -a` per determinare se il Layer 2 è stato stabilito.

## 💡 Best Practices
- **Layered Approach**: Non saltare mai alla conclusione che "la rete è rotta". Verifica prima se il problema è la risoluzione dell'indirizzo fisico (ARP) o il traffico di alto livello (ICMP).