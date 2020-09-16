output "storage_account_name" {
  value = azurerm_storage_account.remote_state_sa.name
}

output "container_name" {
  value = azurerm_storage_container.terraform_remote_state_container.name
}

output "storage_account_id" {
  value = azurerm_storage_account.remote_state_sa.id
}
