# SysAdmin Toolkit & PowerShell Automation

## 🎯 Overview
Questa repository raccoglie una suite di strumenti di automazione e auditing sviluppati per l'amministrazione di sistemi Windows. Il progetto nasce per ottimizzare le operazioni di supporto IT, migrando da approcci manuali a procedure di **System Hardening** e **Data Management** basate su script PowerShell riutilizzabili.

## 🛠️ Cosa troverai in questa suite
Ogni cartella rappresenta un modulo indipendente, progettato seguendo le best practice di sviluppo PowerShell (pipeline, modularità e gestione errori).

* **01-firewall-audit**: Analisi della gerarchia delle regole firewall e isolamento dei processi.
* **02-array-to-object**: Trasformazione di dati imperativi in oggetti strutturati per analisi avanzate.
* **03-file-io-orchestrator**: Gestione robusta di file system con logica di "Self-Healing" per le directory.
* **04-storage-audit**: Monitoraggio proattivo dello spazio su disco con normalizzazione dei dati in GB.
* **05-process-monitor**: Identificazione automatica di processi energivori tramite filtraggio dinamico.
* **06-storage-reporter**: Generazione di report CSV per capacity planning e inventario.
* **07-network-scanner**: Tool di "Ping Sweep" per monitorare la raggiungibilità degli host in rete.
* **08-security-and-compliance**: Audit dei log di sistema e validazione dei privilegi di amministratore.

## 🚀 Filosofia del Progetto
Il focus non è solo "scrivere codice", ma risolvere problemi infrastrutturali:
- **Scalabilità**: Ogni script è parametrizzato per essere eseguito in ambienti diversi.
- **Manutenibilità**: Uso intensivo di `[PSCustomObject]` e pipeline per rendere i dati esportabili in JSON o CSV.
- **Robustezza**: Implementazione di controlli preventivi (`Test-Path`, gestione privilegi) per prevenire crash in runtime.

## 💡 Prerequisiti
Tutti gli script sono testati su **PowerShell 5.1** (Windows nativo) e **PowerShell 7** (Core). Molti moduli richiedono l'esecuzione in una shell con privilegi elevati (Run as Administrator).

## 📬 Contatti
Il progetto è in costante evoluzione. Per approfondimenti, suggerimenti o per discutere di opportunità in ambito **IT Support, NOC o System Administration**, puoi trovarmi su LinkedIn:
[Link al tuo profilo LinkedIn]

---
*Developed by Elia Giolli - Aspiring System Administrator*