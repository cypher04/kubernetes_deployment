resource "azurerm_resource_group" "kubernetes" {
  name     = "kubernetes"
  location = "eastus"
  
}


module "compute" {
  source              = "../../modules/compute"
  location            = var.location
  resource_group      = azurerm_resource_group.kubernetes.name
  kube_principal_id = module.aks.kube_principal_id


  # depends_on = [module.database]
}


module "networking" {
  source              = "../../modules/networking"
  location            = var.location
  subnet_prefixes     = var.subnet_prefixes
  address_space       = [var.address_space]
  resource_group      = azurerm_resource_group.kubernetes.name
}



module "aks" {
  source              = "../../modules/aks"
  subnet_prefixes = var.subnet_prefixes
  location        = var.location
  resource_group   = azurerm_resource_group.kubernetes.name
  node_count       = var.node_count
  cluster = {
    name              = var.cluster_name
    node_size         = var.node_size
    admin_username    = var.admin_username
    admin_password    = var.admin_password
  }
}


module "private_endpoint" {
  source              = "../../modules/private_endpoint"
  resource_group = azurerm_resource_group.kubernetes.name
  location       = var.location
  subnet_prefixes = var.subnet_prefixes
  vnet_id = module.networking.vnet_id
  subnet_ids = module.networking.subnet_ids
  aks_id = module.aks.aks_id
  acr_id = module.compute.acr_id
}


