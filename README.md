# Azure DNS Zone Name Servers Exporter

This PowerShell script exports the name servers for all DNS zones in an Azure subscription to a CSV file.

## Overview

The script performs the following steps:

1. Ensures an Azure login is present.
2. Checks if the Az.Network module is installed and installs it if necessary.
3. Defines the path for the output CSV file.
4. Initializes an empty array to store the results.
5. Retrieves all DNS zones in the current Azure subscription.
6. Iterates through each zone, extracts the zone names and name servers, and creates a custom object containing this information.
7. Adds the custom object to the array.
8. Exports the array to a CSV file.
9. Outputs the path to the created CSV file.

## Prerequisites

- Azure PowerShell Module (`Az` Modul)
- Access to an Azure subscription

## Execution

### In the Azure Cloud Shell

1. Open the [Azure Cloud Shell](https://shell.azure.com).
2. Ensure you are in PowerShell mode.
3. Copy the script into the Cloud Shell and execute it.

## Copyright
© 2024 [Indeno GmbH](https://indeno.at). All rights reserved.
