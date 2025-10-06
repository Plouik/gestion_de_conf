
resource "random_string" "container_name" {
  length  = 25
  lower   = true
  upper   = false
  special = false
}


resource "azurerm_container_group" "container" {
  name                = "${random_string.container_name.result}"
  location            = data.azurerm_resource_group.mygroup.location
  resource_group_name = data.azurerm_resource_group.mygroup.name
  ip_address_type     = "Public"
  os_type             = "Linux"
  restart_policy      = var.restart_policy
  
  image_registry_credential {
    server = var.registry
    user_assigned_identity_id = data.azurerm_user_assigned_identity.myuser.id
  }
  identity {
    type              = "UserAssigned"
    identity_ids      = [data.azurerm_user_assigned_identity.myuser.id]
  }

  container {
    name   = "${var.container_name_prefix}-${random_string.container_name.result}"
    image  = "${var.registry}/${var.image}"
    cpu    = var.cpu_cores
    memory = var.memory_in_gb

    ports {
      port     = var.port
      protocol = "TCP"
    }
  }
}