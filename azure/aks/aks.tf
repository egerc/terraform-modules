resource "azurerm_kubernetes_cluster" "main" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  tags = var.resource_tags

  dns_prefix         = var.dns_prefix
  kubernetes_version = var.kubernetes_version

  linux_profile {
    admin_username = var.admin_user

    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  default_node_pool {
    name            = "default"
    node_count      = var.agent_vm_count
    vm_size         = var.agent_vm_size
    os_disk_size_gb = var.agent_vm_os_disk_size
    vnet_subnet_id  = var.vnet_subnet_id
    max_pods        = var.max_pods
    # cluster autoscaling
    enable_auto_scaling = var.enable_auto_scaling
    max_count           = var.max_node_count
    min_count           = var.min_node_count
  }

  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_policy
    # service_cidr       = var.service_cidr
    # dns_service_ip     = var.dns_ip
    # docker_bridge_cidr = var.docker_cidr
  }

  role_based_access_control {
    enabled = true
  }

  dynamic "service_principal" {
    for_each = ! var.msi_enabled && var.service_principal_id != "" ? [{
      client_id     = var.service_principal_id
      client_secret = var.service_principal_secret
    }] : []
    content {
      client_id     = service_principal.value.client_id
      client_secret = service_principal.value.client_secret
    }
  }

  # This dynamic block enables managed service identity for the cluster
  # in the case that the following holds true:
  #   1: the msi_enabled input variable is set to true
  dynamic "identity" {
    for_each = var.msi_enabled ? [local.msi_identity_type] : []
    content {
      type = identity.value
    }
  }

  addon_profile {
    oms_agent {
      enabled                    = var.oms_agent_enabled
      log_analytics_workspace_id = data.azurerm_log_analytics_workspace.law.id
    }

    # adding this as a patch to disable azurerm provider from redeploying due to unset
    # internal "optional value".  To be removed when azurerm provider is fixed.
    kube_dashboard {
      enabled = var.enable_kube_dashboard
    }
  }
}
