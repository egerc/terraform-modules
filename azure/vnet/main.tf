data "azurerm_resource_group" "vnet" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "main" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.vnet.name
  location            = data.azurerm_resource_group.vnet.location
  address_space       = [var.address_space]
  dns_servers         = var.dns_servers
  tags                = var.resource_tags
}

resource "azurerm_subnet" "main" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  virtual_network_name = azurerm_virtual_network.main.name
  resource_group_name  = data.azurerm_resource_group.vnet.name
  address_prefixes     = [var.subnet_prefixes[count.index]]
}