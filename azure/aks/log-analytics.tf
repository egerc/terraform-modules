
resource "azurerm_log_analytics_solution" "main" {
  count               = var.oms_agent_enabled ? 1 : 0
  solution_name       = "ContainerInsights"
  resource_group_name = data.azurerm_resource_group.law.name
  location            = data.azurerm_resource_group.law.location

  workspace_resource_id = data.azurerm_log_analytics_workspace.law.id
  workspace_name        = var.log_analytics_workspace_name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}