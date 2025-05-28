output "iot_hub_id" {
  value = azurerm_iothub.this.id
}

output "iot_hub_hostname" {
  value = azurerm_iothub.this.hostname
}

output "consumer_groups" {
  value = [
    azurerm_iothub_consumer_group.streamanalytics1.name,
    azurerm_iothub_consumer_group.streamanalytics2.name
  ]
}
