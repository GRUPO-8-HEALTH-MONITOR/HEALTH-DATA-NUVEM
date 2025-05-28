resource "azurerm_iothub" "this" {
  name                = var.iot_hub_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.sku_name
    capacity = 1
  }

  fallback_route {
    enabled        = true
    source         = "DeviceMessages"
    endpoint_names = ["events"]
  }
}

resource "azurerm_iothub_consumer_group" "streamanalytics1" {
  name                   = "stream-analytics-1"
  iothub_name            = azurerm_iothub.this.name
  resource_group_name    = var.resource_group_name
  eventhub_endpoint_name = "events"
}

resource "azurerm_iothub_consumer_group" "streamanalytics2" {
  name                   = "stream-analytics-2"
  iothub_name            = azurerm_iothub.this.name
  resource_group_name    = var.resource_group_name
  eventhub_endpoint_name = "events"
}
