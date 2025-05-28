variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
  default     = "logicapp-rg"
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "logic_app_name" {
  description = "Name of the Logic App"
  type        = string
  default     = "scheduled-http-sender"
}

variable "iot_hub_name" {
  description = "Name of the IoT Hub"
  type        = string
  default     = "my-iot-hub"
}

variable "iot_hub_sku" {
  description = "SKU for the IoT Hub (F1, B1, S1, etc.)"
  type        = string
  default     = "F1"
}

variable "stream_analytics_job_name" {
  description = "Name of the Stream Analytics Job"
  type        = list(string)
  default     = ["stream-analytics-job-1", "stream-analytics-job-2"]
}

variable "iot_hub_key" {
  description = "Access key for the IoT Hub (used in both stream analytics modules)"
  type        = string
  sensitive   = true
}

variable "service_bus_key" {
  description = "Access key for the Service Bus"
  type        = string
  sensitive   = true
}

variable "storage_account_key" {
  description = "Access key for the Storage Account"
  type        = string
  sensitive   = true
}