module "providers" {
  source = "../provider"
}

provider "azurerm" {
  features {} # need to have this here too even though provider and version is imported from a module
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}
