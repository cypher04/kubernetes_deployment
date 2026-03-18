resource "azurerm_resource_group" "kubernetes" {
  name     = "kubernetes"
  location = "eastus"
  
}



resource "azurerm_container_registry" "aks_acr" {
  name                = "kubedeployacr"
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = "Premium"


  identity {
    type = "SystemAssigned"
  }
}



resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_container_registry.aks_acr.id
  role_definition_name = "AcrPull"
  principal_id         = var.kube_principal_id
  
}

resource "azurerm_role_assignment" "acr_push" {
  scope                = azurerm_container_registry.aks_acr.id
  role_definition_name = "AcrPush"
  principal_id         = var.kube_principal_id
}

