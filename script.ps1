# Login to Azure if not already logged in
if (-not (Get-AzContext)) {
    Connect-AzAccount
}

# Install necessary modules if not already installed
if (-not (Get-Module -ListAvailable -Name Az.Network)) {
    Install-Module -Name Az.Network -Force
}

# Define the output CSV file path
$outputCsvPath = "zones_nameservers.csv"

# Initialize an empty array to store the result
$zonesData = @()

# Get all DNS zones in the current subscription
$dnsZones = Get-AzDnsZone

foreach ($zone in $dnsZones) {
    $zoneName = $zone.Name
    $nameServers = $zone.NameServers

    # Create a custom object with zone name and name servers
    $zoneInfo = [PSCustomObject]@{
        ZoneName    = $zoneName
        NameServers = $nameServers -join ","
    }

    # Add the custom object to the array
    $zonesData += $zoneInfo
}

# Export the array to CSV
$zonesData | Export-Csv -Path $outputCsvPath -NoTypeInformation

Write-Output "CSV file created at: $outputCsvPath"
