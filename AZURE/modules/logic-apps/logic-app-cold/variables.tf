variable "resource_group_name" {
  description = "Nome do Resource Group onde o Logic App será criado."
  type        = string
}

variable "location" {
  description = "Localização do resource group e do Logic App."
  type        = string
  default     = "East US"
}

variable "logic_app_name" {
  description = "Nome do Logic App."
  type        = string
}

variable "sb_queue_name" {
  description = "Nome da fila do Service Bus que irá disparar o Logic App."
  type        = string
}

variable "servicebus_namespace_name" {
  description = "Nome do namespace do Service Bus."
  type        = string
}

