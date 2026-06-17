# Esercizio originale

function FuncGetSystemSummary {
    $cpu = (Get-CimInstance CIM_Processor).Name
    $ram = (Get-CimInstance CIM_ComputerSystem).TotalPhysicalMemory / 1GB
    $pc  = $env:COMPUTERNAME
    $win = (Get-ComputerInfo -Property "WindowsProductName","WindowsVersion")

    [PSCustomObject]@{
        ComputerName = $pc
        CPU          = $cpu
        RAM_GB       = [math]::Round($ram, 2)
        WindowsName  = $win.WindowsProductName
        WindowsVer   = $win.WindowsVersion
    }  
}

FuncGetSystemSummary