param location string = resourceGroup().location
param sytemName string

resource symbolicname 'Microsoft.App/managedEnvironments@2022-06-01-preview' = {
  name: '${sytemName}-managedEnvironment'
  location: location 
  sku: {
    name: 'Consumption'
  }
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: 'string'
        sharedKey: 'string'
      }
    }
  }
}
