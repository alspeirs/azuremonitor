Param(
    [Parameter(Mandatory=$True)]
    [String] $ResourceGroupName
)
Write-Output "Restarting WebApp"

# Ensures you do not inherit an AzureRMContext in your runbook
# Disable-AzureRmContextAutosave –Scope Process

$connection = Get-AutomationConnection -Name AzureRunAsCOnnection
Login-AzureRmAccount -ServicePrincipal -Tenant $connection.TenantID -ApplicationId $connection.ApplicationID -CertificateThumbprint $connection.CertificateThumbprint

Write-Output "Checking VM Status"
$Vms = @()
$Vms += $WebApp1Status = Get-azureRmVm -Name "WebApp1" -ResourceGroupName $ResourceGroupName -Status
$Vms += $WebApp2Status = Get-azureRmVm -Name "WebApp2" -ResourceGroupName $ResourceGroupName -Status
foreach($Vm in $Vms)
{
    If ($vm.Statuses[1].DisplayStatus -eq "VM Running"){

        $Message = $vm.name + ' Running'
        Write-Output $Message

    } Else{
        $Message = $vm.name + ' Not Running'
        Write-Output $Message
        Write-Output "Vm will be restarted"
        Start-AzureRmVM -Name $vm.name -ResourceGroupName $ResourceGroupName
    }
}
