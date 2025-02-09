# Same as '06 SQL Server and client, domain joined.ps1' but targeting Azure.
#
#This intro script is extending '12.1 Azure Single domain-joined server.ps1'. The script makes
#use of the $PSDefaultParameterValues feature introduced in PowerShell version 4.
#Settings that are the same for all machines can be summarized that way and still be overwritten when necessary.

$azureDefaultLocation = 'West Europe' #COMMENT OUT -DefaultLocationName BELOW TO USE THE FASTEST LOCATION

New-LabDefinition -Name AzureLab2 -DefaultVirtualizationEngine HyperV

Add-LabAzureSubscription -DefaultLocationName $azureDefaultLocation

#defining default parameter values, as these ones are the same for all the machines
$PSDefaultParameterValues = @{
    'Add-LabMachineDefinition:DomainName' = 'contoso.com'
    'Add-LabMachineDefinition:Memory' = 1GB
    'Add-LabMachineDefinition:OperatingSystem' = 'Windows Server 2016 Datacenter (Desktop Experience)'
}

Add-LabMachineDefinition -Name azDC1 -Roles RootDC

Add-LabMachineDefinition -Name azSQL1 -Roles SQLServer2016

Install-Lab

Show-LabDeploymentSummary
