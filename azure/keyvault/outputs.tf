output "key_vault_id" {
  description = "The id of the Keyvault"
  value       = azurerm_key_vault.keyvault.id
}

output "key_vault_uri" {
  description = "The uri of the keyvault"
  value       = azurerm_key_vault.keyvault.vault_uri
}

output "key_vault_name" {
  description = "The name of the Keyvault"
  value       = azurerm_key_vault.keyvault.name
}
