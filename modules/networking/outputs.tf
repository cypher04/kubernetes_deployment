output "vnet_id" {
    value = azurerm_virtual_network.kube_vnet.id
}

output "subnet_ids" {
    value = {
        kube_01 = azurerm_subnet.kube_subnet_01.id
        kube_02 = azurerm_subnet.kube_subnet_02.id
        web     = azurerm_subnet.subnet_web.id
    }
}