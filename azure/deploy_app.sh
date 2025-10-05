set -euox

ressource_group="testItalieNorth"
location="Italy North"
app_service_plan_name="myAppPlan"
app_name="demoAppOmiOmi"
sku="F1"
runtime='PYTHON:3.9'
az group create --name "$ressource_group" --location "$location"
az appservice plan create --name "$app_service_plan_name" --resource-group "$ressource_group" --sku $sku --is-linux --location "$location"
az webapp create --name "$app_name" --resource-group "$ressource_group" --plan "$app_service_plan_name" --runtime "$runtime"
export APPNAME=$(az webapp list --query [0].name --output tsv)
export APPRG=$(az webapp list --query [0].resourceGroup --output tsv)
export APPPLAN=$(az appservice plan list --query [0].name --output tsv)
export APPSKU=$(az appservice plan list --query [0].sku.name --output tsv)
export APPLOCATION=$(az appservice plan list --query [0].location --output tsv)
az webapp up --name $APPNAME --resource-group $APPRG --plan $APPPLAN --sku $APPSKU --location "$APPLOCATION"