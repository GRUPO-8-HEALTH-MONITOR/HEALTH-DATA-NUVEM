output "storage_account_name" {
  value = azurerm_resource_group.iot_rg.name
}

output "container_name" {
  value = azurerm_resource_group.iot_rg.name
}
