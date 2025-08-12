resource "azurerm_servicebus_namespace" "sb" {
  name                = var.servicebus_namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "queue" {
  name                = var.sb_queue_name
  namespace_id        = azurerm_servicebus_namespace.sb.id
}