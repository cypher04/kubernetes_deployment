# output "client_certificate" {
#     value = azurerm_kubernetes_cluster.kubernetes.kube_config.0.client_certificate
#     sensitive = true
# }

output "kube_config" {
    value = azurerm_kubernetes_cluster.kubernetes.kube_config_raw
    sensitive = true
}

output "aks_id" {
    value = azurerm_kubernetes_cluster.kubernetes.id
}

output "kube_principal_id" {
    value = azurerm_kubernetes_cluster.kubernetes.identity[0].principal_id
}

output "aks_cluster_name" {
    value = azurerm_kubernetes_cluster.kubernetes.name
}

output "host" {
    value     = azurerm_kubernetes_cluster.kubernetes.kube_config.0.host
    sensitive = true
}

output "client_certificate" {
    value     = azurerm_kubernetes_cluster.kubernetes.kube_config.0.client_certificate
    sensitive = true
}

output "client_key" {
    value     = azurerm_kubernetes_cluster.kubernetes.kube_config.0.client_key
    sensitive = true
}

output "cluster_ca_certificate" {
    value     = azurerm_kubernetes_cluster.kubernetes.kube_config.0.cluster_ca_certificate
    sensitive = true
}