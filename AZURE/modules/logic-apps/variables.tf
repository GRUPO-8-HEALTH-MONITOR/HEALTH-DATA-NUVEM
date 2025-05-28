variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "The Azure region for the Logic App"
  type        = string
}

variable "logic_app_name" {
  description = "The name of the Logic App"
  type        = string
}
