data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_container_registry" "acr" {
  count               = var.create_acr ? 1 : 0
  name                = var.name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  sku                 = "Basic"

  tags = var.resource_tags
}

