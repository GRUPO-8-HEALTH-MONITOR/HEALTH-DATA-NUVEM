variable "storage_account_name" {
  description = "The name of the Storage Account"
  type        = string
}

variable "container_name" {
  description = "The name of the Blob container"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
