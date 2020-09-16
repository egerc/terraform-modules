module "providers" {
  source = "../provider"
}

provider "azurerm" {
  features {} # need to have this here too even though provider and version is imported from a module
}

resource "random_id" "remotestate_account_name" {
  byte_length = 6

  keepers = {
    sa_account_ref = 1
  }
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}