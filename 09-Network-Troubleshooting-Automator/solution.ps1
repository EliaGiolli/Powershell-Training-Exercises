param([string]$TargetIP = "192.168.1.50")

Write-Host "[*] Auditing reachability for: $TargetIP" -ForegroundColor Cyan

# Verifica Layer 3
if (Test-Connection -ComputerName $TargetIP -Count 1 -Quiet) {
    Write-Host "[+] L3 Success: Host is responding to ICMP." -ForegroundColor Green
} else {
    Write-Warning "[-] L3 Failure: Host not responding."
    
    # Verifica Layer 2 / ARP
    $arpTable = arp -a | Select-String $TargetIP
    if ($arpTable) {
        Write-Host "[!] ARP Entry exists for $TargetIP. Issue might be firewall." -ForegroundColor Yellow
    } else {
        Write-Error "[!] No ARP entry found. Issue is likely Layer 2 or Server down."
    }
}