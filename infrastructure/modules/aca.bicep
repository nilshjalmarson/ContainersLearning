param location string = resourceGroup().location
param systemName string
param logAnalytics string

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' existing = {
  name: logAnalytics
}

resource symbolicname 'Microsoft.App/managedEnvironments@2022-06-01-preview' = {
  name: '${systemName}-managedEnvironment'
  location: location 
  sku: {
    name: 'Consumption'
  }
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: logAnalyticsWorkspace.properties.customerId
        sharedKey: logAnalyticsWorkspace.listKeys().primarySharedKey
      }
    }
  }
}
