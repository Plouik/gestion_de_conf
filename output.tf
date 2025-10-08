output "webapp_url" {
  value = "http://${azurerm_container_group.container.ip_address}:${var.port}"
}