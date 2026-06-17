<#
.SYNOPSIS
    Genera un riepilogo hardware e software del sistema.
#>
function Get-SystemSummary {
    [CmdletBinding()]
    param()

    process {
        # Usiamo variabili locali per evitare chiamate CIM multiple che rallentano lo script
        $sysInfo = Get-CimInstance CIM_ComputerSystem
        $cpuInfo = Get-CimInstance CIM_Processor | Select-Object -First 1 # Prende solo il primo core
        $osInfo  = Get-CimInstance Win32_OperatingSystem

        [PSCustomObject]@{
            Timestamp    = Get-Date -Format "yyyy-MM-dd HH:mm"
            ComputerName = $sysInfo.Name
            CPU          = $cpuInfo.Name.Trim()
            RAM_GB       = [math]::Round($sysInfo.TotalPhysicalMemory / 1GB, 2)
            OS           = $osInfo.Caption
            OS_Version   = $osInfo.Version
        }
    }
}

Get-SystemSummary | Format-List