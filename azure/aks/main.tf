module "providers" {
  source = "../provider"
}

provider "azurerm" {
  features {} # need to have this here too even though provider and version is imported from a module
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

data "azurerm_subscription" "current" {}

data "azurerm_resource_group" "law" {
  name = var.log_analytics_workspace_resource_group_name
}

data "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.log_analytics_workspace_resource_group_name
}

resource "random_id" "main" {
  keepers = {
    resource_group_name = data.azurerm_resource_group.main.name
  }

  byte_length = 8
}
