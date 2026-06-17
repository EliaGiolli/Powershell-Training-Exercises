# Esercizio originale

Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    Level   = 1,2
} -MaxEvents 20 |
    Select-Object TimeCreated, Id, Message | 
    Format-List 


    ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)