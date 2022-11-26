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

docker push nh173.azurecr.io/api:1.0.0 
# az containerapp up --name nh173-api --image nh173.azurecr.io/api:1.0.0 --resource-group nils-hjalmarsson-173-containers --environment nh173-managedEnvironment --ingress external --target-port 80