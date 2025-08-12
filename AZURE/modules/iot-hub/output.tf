output "iot_hub_hostname" {
  value = azurerm_iothub.iot_hub.hostname
}

output "iot_hub_eventhub_endpoint" {
  value = azurerm_iothub.iot_hub.event_hub_events_endpoint
}

output "iot_hub_name" {
  value = azurerm_iothub.iot_hub.name
}
