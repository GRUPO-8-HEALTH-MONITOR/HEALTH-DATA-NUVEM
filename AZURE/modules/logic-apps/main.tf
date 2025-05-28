resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_resource_group_template_deployment" "logic_app" {
  name                = "logicapp-deployment"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"

  template_content = file("${path.module}/logicapp-template.json")

  parameters_content = jsonencode({
    logicAppName = var.logic_app_name
    location     = var.location
  })
}
