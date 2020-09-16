resource "azurerm_key_vault" "keyvault" {
  name                = var.name
  location            = data.azurerm_resource_group.kv.location
  resource_group_name = data.azurerm_resource_group.kv.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name = var.keyvault_sku

  # This block configures VNET integration if a subnet whitelist is specified
  dynamic "network_acls" {
    for_each = length(concat(var.resource_ip_whitelist, var.subnet_id_whitelist)) == 0 ? [] : [""]
    content {
      bypass                     = "None"
      default_action             = "Deny"
      virtual_network_subnet_ids = var.subnet_id_whitelist
      ip_rules                   = var.resource_ip_whitelist
    }
  }

  # This block assigns a default access policy to the creating principal
  access_policy {
    tenant_id               = data.azurerm_client_config.current.tenant_id
    object_id               = data.azurerm_client_config.current.object_id
    key_permissions         = var.keyvault_key_permissions
    secret_permissions      = var.keyvault_secret_permissions
    certificate_permissions = var.keyvault_certificate_permissions
  }

  tags = var.resource_tags
}