variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "location" {
  description = "Localização do Resource Group"
  type        = string
  default     = "East US"
}

variable "servicebus_namespace_name" {
  description = "Nome do Service Bus Namespace"
  type        = string
}

variable "sb_queue_name" {
  description = "Nome da fila do Service Bus"
  type        = string
}
