provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "logic_app" {
  source              = "./modules/logic-apps"
  logic_app_name      = var.logic_app_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "iot_hub" {
  source              = "./modules/iot-hub"
  iot_hub_name        = var.iot_hub_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = var.iot_hub_sku
}

module "stream_analytics_cold" {
  source = "./modules/stream-analytics-cold"

  job_name              = "iot-cold-job"
  resource_group_name   = module.resource_group.name
  location              = var.location

  iot_hub_namespace     = module.iot_hub.hostname
  iot_hub_key           = var.iot_hub_key
  consumer_group        = module.iot_hub.consumer_groups[1]

  storage_account_name  = module.storage.account_name
  storage_account_key   = var.storage_account_key
  container_name        = module.storage.container_name
}


module "stream_analytics_storage" {
  source = "./modules/stream-analytics-to-storage"

  job_name              = var.stream_analytics_job_name[1]
  resource_group_name   = module.resource_group.name
  location              = var.location

  iot_hub_namespace     = module.iot_hub.hostname
  iot_hub_key           = var.iot_hub_key
  consumer_group        = module.iot_hub.consumer_groups[1]

  storage_account_name  = module.storage.account_name
  storage_account_key   = var.storage_account_key
  container_name        = module.storage.container_name
}
