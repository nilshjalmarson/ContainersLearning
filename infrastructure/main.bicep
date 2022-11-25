param location string = resourceGroup().location

module containerRegistry './modules/acr.bicep' = {
  name: '${deployment()}-containerRegistry'
  params: {
    location: location
  }  
}
