output "logic_app_id" {
  value = module.logic_app.logic_app_id
}

output "stream_analytics_jobs" {
  value = {
    cold = module.stream_analytics_sb.stream_analytics_job_name
    hot  = module.stream_analytics.job_name_2
  }
}

data "azurerm_key_vault_secret" "iot_hub_key" {
  name         = "iot-hub-key"
  key_vault_id = azurerm_key_vault.example.id
}

output "iot_hub_key" {
  value     = data.azurerm_key_vault_secret.iot_hub_key.value
  sensitive = true
}


output "stream_analytics_service_bus_job_name" {
  value = module.stream_analytics_sb.job_name
}

output "stream_analytics_storage_job_name" {
  value = module.stream_analytics_storage.job_name
}
