resource "azurerm_stream_analytics_job" "cold_path_job" {
  name                = var.job_name
  location            = var.location
  resource_group_name = var.resource_group_name

  streaming_units            = var.streaming_units
  compatibility_level        = "1.2"
  data_locale                = "en-US"
  events_out_of_order_policy = "Adjust"
  output_error_policy        = "Drop"

  tags = var.tags

    transformation_query = <<QUERY
    SELECT *
    INTO [sb-output]
    FROM [iot-input]
  QUERY

}

resource "azurerm_stream_analytics_stream_input_iothub" "input" {
  name                         = "iot-input"
  stream_analytics_job_name    = azurerm_stream_analytics_job.cold_path_job.name
  resource_group_name          = var.resource_group_name

  endpoint                     = "messages/events"
  eventhub_consumer_group_name = var.consumer_group_name

  iothub_namespace             = var.iot_hub_namespace
  shared_access_policy_name    = var.iot_hub_policy_name
  shared_access_policy_key     = var.iot_hub_policy_key

  serialization {
    type     = "Json"
    encoding = "UTF8"
  }
}


resource "azurerm_stream_analytics_output_servicebus_queue" "output" {
  name                      = "sb-output"
  stream_analytics_job_name = azurerm_stream_analytics_job.cold_path_job.name
  resource_group_name       = var.resource_group_name
  servicebus_namespace      = var.servicebus_namespace
  shared_access_policy_name = var.sb_policy_name
  shared_access_policy_key  = var.sb_policy_key
  queue_name                = var.sb_queue_name

  serialization {
    type     = "Json"
    format   = "LineSeparated"
    encoding = "UTF8"
  }
}