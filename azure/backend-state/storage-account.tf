resource "azurerm_storage_account" "remote_state_sa" {
  name                     = length(var.name) > 0 ? var.name : random_id.remotestate_account_name.hex
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  resource_group_name      = var.resource_group_name
  location                 = data.azurerm_resource_group.main.location
  account_replication_type = var.storage_account_replication_type
}
