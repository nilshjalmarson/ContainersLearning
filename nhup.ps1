$sub = Get-AzSubscription -SubscriptionName 'Forefront Labs'
Select-AzSubscription $sub

$rg = New-AzResourceGroup -Name 'nils-hjalmarsson-173-containers' -Location 'westeurope' -Force
New-AzResourceGroupDeployment `
    -TemplateFile './infrastructure/main.bicep' `
    -ResourceGroupName $rg.ResourceGroupName `
    -Name '1.0.0' `
    -Force `
    -systemName 'nh173'

Write-Output "Registry created"

Connect-AzContainerRegistry -Name nh173 