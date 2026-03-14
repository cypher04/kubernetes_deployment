// create private endpoint for kubernetes cluster


resource "azurerm_private_dns_zone" "aks_pdz" {
  name                = "privatelink.aks.azmk8s.io"
  resource_group_name = var.resource_group
}

resource "azurerm_private_endpoint" "aks" {
  name                = "aks-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group
  subnet_id           = var.subnet_ids["kube_01"]

  private_service_connection {
    name                           = "aks-psc"
    is_manual_connection            = false
    private_connection_resource_id   = var.aks_id
    subresource_names               = ["management"]
  }
  
}
resource "azurerm_private_dns_zone_virtual_network_link" "aks_pdz_link" {
  name                  = "aks-pdz-link"
  resource_group_name   = var.resource_group
  private_dns_zone_name = azurerm_private_dns_zone.aks_pdz.name
  virtual_network_id    = var.vnet_id
}


// create private endpoint for azure container registry
resource "azurerm_private_endpoint" "acr" {
  name                = "acr-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group
  subnet_id           = var.subnet_ids["kube_02"]

  private_service_connection {
    name                           = "acr-psc"
    is_manual_connection            = false
    private_connection_resource_id   = var.acr_id
    subresource_names               = ["registry"]
  }
}

resource "azurerm_private_dns_zone" "acr_pdz" {
  name                = "privatelink.azurecr.io"
  resource_group_name = var.resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "acr_pdz_link" {
  name                  = "acr-pdz-link"
  resource_group_name   = var.resource_group
  private_dns_zone_name = azurerm_private_dns_zone.acr_pdz.name
  virtual_network_id    = var.vnet_id
}