output "id" {
  value = azurerm_kubernetes_cluster.main.id
}

output "name" {
  value = azurerm_kubernetes_cluster.main.name
}

output "client_certificate" {
  sensitive = true
  value     = azurerm_kubernetes_cluster.main.kube_config.0.client_certificate
}

output "kube_config" {
  sensitive = true
  value     = azurerm_kubernetes_cluster.main.kube_config_raw
}

output "kube_config_block" {
  sensitive = true
  value     = azurerm_kubernetes_cluster.main.kube_config
}

output "principal_id" {
  value = azurerm_kubernetes_cluster.main.identity.0.principal_id
}

output "kubelet_identity_id" {
  value = azurerm_kubernetes_cluster.main.kubelet_identity.0.user_assigned_identity_id
}

output "kubelet_object_id" {
  value = azurerm_kubernetes_cluster.main.kubelet_identity.0.object_id
}

output "kubelet_client_id" {
  value = azurerm_kubernetes_cluster.main.kubelet_identity.0.client_id
}

output "node_resource_group" {
  value = azurerm_kubernetes_cluster.main.node_resource_group
}