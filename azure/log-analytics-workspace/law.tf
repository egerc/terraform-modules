resource "azurerm_log_analytics_workspace" "main" {
  name                = lower(var.name)
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  sku                 = "PerGB2018"
}