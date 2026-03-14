resource "azurerm_virtual_network" "kube_vnet" {
    name                = "kube-vnet"
    address_space       = var.address_space
    location            = var.location
    resource_group_name = var.resource_group
}

resource "azurerm_subnet" "kube_subnet_01" {
    name                 = "kube-subnet-01"
    resource_group_name  = var.resource_group
    virtual_network_name = azurerm_virtual_network.kube_vnet.name
    address_prefixes     = [var.subnet_prefixes["kube_01"]]

}

resource "azurerm_subnet" "kube_subnet_02" {
    name                 = "kube-subnet-02"
    resource_group_name  = var.resource_group
    virtual_network_name = azurerm_virtual_network.kube_vnet.name
    address_prefixes     = [var.subnet_prefixes ["kube_02"]]

}

resource "azurerm_subnet" "subnet_web" {
    name                 = "spoke-subnet-web"
    resource_group_name  = var.resource_group
    virtual_network_name = azurerm_virtual_network.kube_vnet.name
    address_prefixes     = [var.subnet_prefixes["web"]]  
}
