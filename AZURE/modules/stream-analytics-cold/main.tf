resource "azurerm_stream_analytics_job" "this" {
  name                = var.job_name
  location            = var.location
  resource_group_name = var.resource_group_name

  streaming_units     = 1
  compatibility_level = "1.2"
  data_locale         = "en-US"

  events_out_of_order_policy = "Adjust"
  output_error_policy        = "Stop"

  transformation_query = "SELECT * INTO [cold_output] FROM [iot_input]"
}

resource "azurerm_stream_analytics_stream_input_iothub" "iot_input" {
  name                      = "iot_input"
  stream_analytics_job_name = azurerm_stream_analytics_job.this.name
  resource_group_name       = var.resource_group_name

  iothub_namespace             = var.iot_hub_namespace
  shared_access_policy_name    = "service"
  shared_access_policy_key     = var.iot_hub_key
  eventhub_consumer_group_name = var.consumer_group
  endpoint                     = var.iot_hub_endpoint

  serialization {
    type     = "Json"
    encoding = "UTF8"
  }
}

resource "azurerm_stream_analytics_output_blob" "blob_output" {
  name                      = "cold_output"
  stream_analytics_job_name = azurerm_stream_analytics_job.this.name
  resource_group_name       = var.resource_group_name

  storage_account_name   = var.storage_account_name
  storage_account_key    = var.storage_account_key
  storage_container_name = var.container_name

  date_format  = "yyyy/MM/dd"
  time_format  = "HH"
  path_pattern = "{date}/{time}"

  serialization {
    type     = "Json"
    encoding = "UTF8"
  }
}
