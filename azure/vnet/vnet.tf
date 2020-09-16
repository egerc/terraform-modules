resource "azurerm_virtual_network" "main" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.vnet.name
  location            = data.azurerm_resource_group.vnet.location
  address_space       = [var.address_space]
  dns_servers         = var.dns_servers
  tags                = var.resource_tags
}