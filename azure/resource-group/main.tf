module "providers" {
  source = "../provider"
}

provider "azurerm" {
  features {} # need to have this here too even though provider and version is imported from a module
}

resource "azurerm_resource_group" "main" {
  name     = var.name
  location = var.location
  tags     = var.resource_tags
}

resource "random_id" "main" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.main.name
  }

  byte_length = 8
}

resource "azurerm_management_lock" "main_delete" {
  count      = var.is_no_delete ? 1 : 0
  name       = "managed-by-terraform-delete-lock"
  scope      = azurerm_resource_group.main.id
  lock_level = "CanNotDelete"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_management_lock" "main_ro" {
  count      = var.is_read_only ? 1 : 0
  name       = "managed-by-terraform-readonly-lock"
  scope      = azurerm_resource_group.main.id
  lock_level = "ReadOnly"

  lifecycle {
    prevent_destroy = true
  }
}
