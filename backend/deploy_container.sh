ressource_group="configuration-demo"
registry_name="omiomidemoomi"
registry_fqdn="$registry_name.azurecr.io"
image_to_deploy="configuration-backend:latest"

container_name="demo"
dns_label="omidemoiom"

#creatre a container registry
creds=$(az acr credential show --resource-group "$ressource_group" --name "$registry_name")
username=$( echo "$creds" | jq -r '.username' )
password=$( echo "$creds" | jq -r '.passwords[0].value' )

az container create --registry-username "$username" --registry-password "$password"  --resource-group "$ressource_group" --name "$container_name" --image "$registry_fqdn"/"$image_to_deploy" --dns-name-label "$dns_label" --ports 80 --os-type linux --memory 1.5 --cpu 1


az container show --resource-group "$ressource_group" --name "$container_name" --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" --out table
