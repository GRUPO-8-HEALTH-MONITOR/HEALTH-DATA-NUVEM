variable "job_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "streaming_units" {
  type    = number
  default = 1
}

variable "iot_hub_namespace" {
  type = string
}

variable "iot_hub_policy_name" {
  type = string
}

variable "iot_hub_policy_key" {
  type = string
}

variable "consumer_group_name" {
  type = string
}

variable "servicebus_namespace" {
  type = string
}

variable "sb_policy_name" {
  type = string
}

variable "sb_policy_key" {
  type = string
}

variable "sb_queue_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "iot_device_name" {
  description = "Name of the IoT Hub device."
  type        = string
}
