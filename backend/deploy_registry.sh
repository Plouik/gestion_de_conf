set -eu

ressource_group="configuration-demo"
identity="myID"
location="France Central"
registry_name="omiomidemoomi"

# #user assign identity
az group create --name "$ressource_group" --location "$location"
az identity create --name "$identity" --resource-group "$ressource_group"

#creatre a container registry
az acr create --name "$registry_name" --resource-group "$ressource_group" --sku Basic --admin-enabled true
az acr credential show --resource-group "$ressource_group" --name "$registry_name"

principalId=$(az identity show --resource-group "$ressource_group" --name "$identity" --query principalId --output tsv)
registryId=$(az acr show --resource-group "$ressource_group" --name "$registry_name" --query id --output tsv)
az role assignment create --assignee $principalId --scope $registryId --role "AcrPull"