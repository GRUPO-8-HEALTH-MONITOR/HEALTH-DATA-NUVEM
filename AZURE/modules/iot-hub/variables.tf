variable "iot_hub_name" {
  description = "The name of the IoT Hub"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the IoT Hub"
  type        = string
}

variable "sku_name" {
  description = "SKU name for the IoT Hub"
  type        = string
}
