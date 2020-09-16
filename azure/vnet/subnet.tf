resource "azurerm_subnet" "main" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  virtual_network_name = azurerm_virtual_network.main.name
  resource_group_name  = data.azurerm_resource_group.vnet.name
  address_prefixes     = [var.subnet_prefixes[count.index]]
}