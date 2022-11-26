param location string = resourceGroup().location
param systemName string

module logAnalyticsWorkspace 'modules/log-workspace.bicep' = {
  name: '${deployment().name}-logAnalytics'
  params: {
    location: location
    systemName: systemName
  }    
}

module containerRegistry './modules/acr.bicep' = {
  name: '${deployment().name}-containerRegistry'
  params: {
    location: location
    systemName: systemName
  }    
}

module containerAppsEnvironment 'modules/aca.bicep' = {
  name: '${deployment().name}-containerAppsenvironment'
  params: {
    location: location
    systemName: systemName
    logAnalytics: logAnalyticsWorkspace.outputs.workspaceName
  }
}
