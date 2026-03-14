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


