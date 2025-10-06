data "azurerm_user_assigned_identity" "myuser" {
  name                = var.identity_username
  resource_group_name = data.azurerm_resource_group.mygroup.name
}

data "azurerm_resource_group" "mygroup" {
 name = var.identity_ressource_group
}