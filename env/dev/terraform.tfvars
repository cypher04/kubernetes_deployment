resource_group_name = "rg-kube-001"
location            = "eastus"
project_name        = "kube-aks-001"
environment         = "dev"
cluster_name       = "aks-kube-001"
node_count         = 3
node_size          = "Standard_DS2_v2"
admin_username     = "azureuser"
admin_password     = "P@ssw0rd1234"
address_space       = "10.0.0.0/16"
subnet_prefixes = {
    web = "10.0.1.0/24",
    kube_01 = "10.0.2.0/24",
    kube_02 = "10.0.3.0/24",
    database = "10.0.4.0/24"
}