resource "azurerm_resource_group" "kubernetes" {
  name     = "kubernetes"
  location = "eastus"
  
}



resource "azurerm_container_registry" "kubernetes" {
  name                = "kubernetes"
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = "Basic"


  identity {
    type = "SystemAssigned"
  }
}


resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_container_registry.kubernetes.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.kubernetes.identity[0].principal_id
  
}

resource "azurerm_role_assignment" "acr_push" {
  scope                = azurerm_container_registry.kubernetes.id
  role_definition_name = "AcrPush"
  principal_id         = azurerm_kubernetes_cluster.kubernetes.identity[0].principal_id
}
