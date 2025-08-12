variable "logic_app_name" {
  description = "Name of the Logic App"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the Logic App"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "logic_app_definition" {
  description = "The Logic App workflow definition in JSON"
  type        = any
}
