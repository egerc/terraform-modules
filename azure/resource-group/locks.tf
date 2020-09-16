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
