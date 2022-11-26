param location string = resourceGroup().location
param systemName string

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' = {
  name: systemName
  location: location
  properties: {
    sku: {
      name: 'pergb2018'
    }
  }
}

output workspaceName string = logAnalyticsWorkspace.name
