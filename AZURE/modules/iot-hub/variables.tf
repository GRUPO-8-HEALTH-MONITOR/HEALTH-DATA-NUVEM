variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "iot_hub_name" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "S1"
}

variable "sku_capacity" {
  type    = number
  default = 1
}

variable "consumer_group_name" {
  type    = string
  default = "my-stream-consumer"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "iot_device_name" {
  description = "Name of the IoT Hub device."
  type        = string
}