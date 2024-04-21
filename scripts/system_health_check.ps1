<#
    ASH - System Health Check
    Author: ambr0sial
    Description: This script performs basic system health checks.
#>

# disk health information
function Get-DiskHealth {
    $disks = Get-PhysicalDisk

    foreach ($disk in $disks) {
        $diskName = $disk.DeviceID
        $diskStatus = $disk.HealthStatus

        Write-Output "Disk: $diskName | Status: $diskStatus"
    }
}

# cpu usage
function Get-CPUUsage {
    $cpuUsages = Get-WmiObject -Class Win32_PerfFormattedData_PerfOS_Processor | Select-Object -ExpandProperty PercentProcessorTime

    for ($i = 0; $i -lt $cpuUsages.Count; $i++) {
        $coreNumber = $i + 1
        $coreUsage = $cpuUsages[$i]
        Write-Output "CPU Core $coreNumber usage: $coreUsage%"
    }
}

# ram usage
function Get-RAMUsage {
    $ram = Get-WmiObject Win32_OperatingSystem
    $totalRAM = $ram.TotalVisibleMemorySize
    $freeRAM = $ram.FreePhysicalMemory
    $usedRAM = $totalRAM - $freeRAM
    $ramUsagePercent = ($usedRAM / $totalRAM) * 100

    Write-Output "RAM usage: $ramUsagePercent%"
}

Write-Host "ASH - Performing system health check.."
Get-DiskHealth
Get-CPUUsage
Get-RAMUsage