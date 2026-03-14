resource "azurerm_resource_group" "kubernetes" {
  name     = "kubernetes"
  location = "eastus"
  
}


module "compute" {
  source              = "../../modules/compute"
  location            = var.location
  resource_group      = azurerm_resource_group.kubernetes.name
  

  # depends_on = [module.database]
}


module "networking" {
  source              = "../../modules/networking"
  location            = var.location
  subnet_prefixes     = var.subnet_prefixes
  address_space       = [var.address_space]
  resource_group      = azurerm_resource_group.kubernetes.name
}