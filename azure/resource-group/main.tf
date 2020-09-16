module "providers" {
  source = "../provider"
}

provider "azurerm" {
  features {} # need to have this here too even though provider and version is imported from a module
}

resource "random_id" "main" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.main.name
  }

  byte_length = 8
}
