provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "iot_rg" {
  name     = var.resource_group_name
  location = var.location
}

module "iot_hub" {
  source              = "./modules/iot-hub"
  resource_group_name = azurerm_resource_group.iot_rg.name
  location            = var.location
  iot_hub_name        = var.iot_hub_name
  consumer_group_name = var.consumer_group_name
  tags                = var.tags
  iot_device_name     = var.iot_device_name
}

module "stream_analytics_cold" {
  source              = "./modules/stream-analytics-cold"
  job_name            = var.stream_analytics_job_name
  location            = var.location
  resource_group_name = azurerm_resource_group.iot_rg.name
  streaming_units     = var.streaming_units

  iot_hub_namespace   = module.iot_hub.iot_hub_name
  iot_hub_policy_name = var.iot_hub_policy_name
  iot_hub_policy_key  = var.iot_hub_policy_key
  consumer_group_name = var.consumer_group_name

  servicebus_namespace = var.servicebus_namespace_name
  sb_policy_name       = var.sb_policy_name
  sb_policy_key        = var.sb_policy_key
  sb_queue_name        = var.sb_queue_name

  tags = var.tags
  iot_device_name     = var.iot_device_name
}

module "servicebus" {
  source                    = "./modules/service-bus"
  resource_group_name       = azurerm_resource_group.iot_rg.name
  location                  = var.location
  servicebus_namespace_name = var.servicebus_namespace_name
  sb_queue_name             = var.sb_queue_name
}

module "logic_app" {
  source                    = "./modules/logic-apps/logic-app-cold"
  resource_group_name       = azurerm_resource_group.iot_rg.name
  location                  = var.location
  logic_app_name            = "logic-app-cold"
  sb_queue_name             = var.sb_queue_name
  servicebus_namespace_name = var.servicebus_namespace_name
}



//HOT PATH -------------------------------------------------------------------------


module "stream_analytics_hot" {
  source              = "./modules/stream-analytics-hot"
  job_name            = var.stream_analytics_hot_job_name
  location            = var.location
  resource_group_name = azurerm_resource_group.iot_rg.name
  streaming_units     = var.streaming_units

  iot_hub_namespace     = module.iot_hub.iot_hub_name
  iot_hub_policy_name   = var.iot_hub_policy_name
  iot_hub_policy_key    = var.iot_hub_policy_key
  consumer_group_name   = var.consumer_group_name

  servicebus_namespace  = var.servicebus_namespace_name
  sb_policy_name        = var.sb_policy_name
  sb_policy_key         = var.sb_policy_key
  sb_queue_name         = var.sb_queue_name
  iot_device_name       = var.iot_device_name

  tags = var.tags
}



module "storage_account" {
  source                = "./modules/storage-account"
  storage_account_name  = var.storage_account_name
  container_name        = var.container_name
  resource_group_name   = azurerm_resource_group.iot_rg.name
  location              = var.location
  tags                  = var.tags
}

module "logic_app_hot" {
  source              = "./modules/logic-apps/logic-app-hot"
  logic_app_name      = "logic-app-hot"
  location            = var.location
  resource_group_name = azurerm_resource_group.iot_rg.name
  tags                = var.tags

  logic_app_definition = local.logic_app_cold_definition
}