variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "job_name"            { type = string }

variable "iot_hub_namespace"   { type = string }
variable "iot_hub_key"         { type = string }
variable "consumer_group"      { type = string }

variable "storage_account_name" { type = string }
variable "storage_account_key"  { type = string }
variable "container_name"       { type = string }

variable "iot_hub_endpoint" {
  description = "The endpoint for the IoT Hub input."
  type        = string
}