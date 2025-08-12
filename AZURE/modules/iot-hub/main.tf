resource "azurerm_iothub" "iot_hub" {
  name                = var.iot_hub_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = var.sku_name
    capacity = var.sku_capacity
  }

  tags = var.tags
}

resource "azurerm_iothub_consumer_group" "iot_consumer_group" {
  name                   = var.consumer_group_name
  iothub_name            = azurerm_iothub.iot_hub.name
  resource_group_name    = var.resource_group_name
  eventhub_endpoint_name = "events"
}
