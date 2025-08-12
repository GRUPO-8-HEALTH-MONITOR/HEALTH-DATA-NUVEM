variable "subscription_id" {
  description = "ID da assinatura do Azure"
  type        = string
  default = "f790fdf6-7eb3-4024-b412-4b3549f9de87"
}

variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
  default     = "iot-hub-rg-health-data-G8"
}

variable "location" {
  description = "Localização do Resource Group"
  type        = string
  default     = "East US"
}

variable "iot_hub_name" {
  description = "Nome do IoT Hub"
  type        = string
  default     = "iot-hub-health-data-G8"
}

variable "consumer_group_name" {
  description = "Nome do Consumer Group do IoT Hub"
  type        = string
  default     = "stream-consumer-health-data-G8"
}

variable "iot_device_name" {
  description = "Name of the IoT Hub device."
  type        = string
  default     = "device001"
}


variable "stream_analytics_job_name" {
  description = "Nome do Stream Analytics Job"
  type        = string
  default     = "stream-cold-job-health-data-G8"
}

variable "streaming_units" {
  description = "Número de unidades de streaming"
  type        = number
  default     = 1
}

variable "iot_hub_policy_name" {
  description = "Nome da política do IoT Hub"
  type        = string
  default     = "iothubowner"
}

variable "iot_hub_policy_key" {
  description = "Chave da política do IoT Hub"
  type        = string
}

variable "servicebus_namespace_name" {
  description = "Nome do Service Bus Namespace"
  type        = string
  default     = "service-bus-health-data-G8"
}

variable "sb_policy_name" {
  description = "Nome da política do Service Bus"
  type        = string
  default     = "RootManageSharedAccessKey"
}

variable "sb_policy_key" {
  description = "Chave da política do Service Bus"
  type        = string
}

variable "sb_queue_name" {
  description = "Nome da fila do Service Bus"
  type        = string
  default     = "fila-health-data-G8"
}

variable "tags" {
  description = "Tags padrão para os recursos"
  type        = map(string)
  default = {
    environment = "dev"
  }
}

//HOT PATH -------------------------------------------------------------------------

// STREAM ANALYTICS HOT PATH

variable "stream_analytics_hot_job_name" {
  description = "Nome do Stream Analytics Job para o caminho quente"
  type        = string
  default     = "stream-hot-job-health-data-g8"
}

// ACCOUNT STORAGE COLD PATH

variable "storage_account_name" {
  description = "Storage Account for hoy path output"
  type        = string
  default     = "storageaccountg8"
}

variable "container_name" {
  description = "Blob container name for hot data"
  type        = string
  default     = "hot-data"
}

variable "aws_api_gateway_url" {
  description = "The AWS API Gateway endpoint to send data to"
  type        = string
}
