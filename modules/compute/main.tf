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

resource "azurerm_kubernetes_cluster" "kubernetes" {
  name                = "kubernetes"
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = "kubernetes"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}


