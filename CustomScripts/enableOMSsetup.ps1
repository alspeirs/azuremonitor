<# Custom Script for Windows #>
param(
$WorkspaceID,
$resourceGroupOutput
)

if ($workspace.Name -ne $workspaceName)
{
    Write-Error "Unable to find OMS Workspace $workspaceName."
}

$workspaceId = $workspace.CustomerId
$workspaceKey = (Get-AzureRmOperationalInsightsWorkspaceSharedKeys -ResourceGroupName $workspace.ResourceGroupName -Name $workspace.Name).PrimarySharedKey
#get all vms within the resource group
$vms = Get-AzureRmVM -ResourceGroupName $resourcegroup 

foreach ($vm in $vms)
{
    $location = $vm.Location
    $vm = $vm.Name  
    # For Windows VM uncomment the following line
    Set-AzureRmVMExtension -ResourceGroupName $resourcegroup -VMName $vm -Name 'MicrosoftMonitoringAgent' -Publisher 'Microsoft.EnterpriseCloud.Monitoring' -ExtensionType 'MicrosoftMonitoringAgent' -TypeHandlerVersion '1.0' -Location $location -SettingString "{'workspaceId': '$workspaceId'}" -ProtectedSettingString "{'workspaceKey': '$workspaceKey'}"
}