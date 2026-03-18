resource "azurerm_kubernetes_cluster" "kubernetes" {
  name                = "kubernetes"
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = "kubernetes"
  private_cluster_enabled = false

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_a2_v2"

    # vnet_subnet_id = var.subnet_ids["kube_01"]

  }
  

  identity {
    type = "SystemAssigned"
  }

}

# network_profile {
#   network_plugin = "azure"

#   service_cidr = "10.0.0.0/16"
#   dns_service_ip = "10.0.0.10"


# data "azurerm_kubernetes_cluster" "kubernetes" {
#   name                = azurerm_kubernetes_cluster.kubernetes.name
#   resource_group_name = azurerm_kubernetes_cluster.kubernetes.resource_group_name

# }


# provider "kubernetes" {
#   host                   = data.azurerm_kubernetes_cluster.kubernetes.kube_config.0.host
#   client_certificate     = base64decode(data.azurerm_kubernetes_cluster.kubernetes.kube_config.0.client_certificate)
#   client_key             = base64decode(data.azurerm_kubernetes_cluster.kubernetes.kube_config.0.client_key)
#   cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.kubernetes.kube_config.0.cluster_ca_certificate)
# }

// create kubernetes template for deployment

resource "kubernetes_namespace_v1" "webapp" {
  metadata {
    name = "webapp"
  }
}

resource "kubernetes_deployment_v1" "kube_webapp" {
  metadata {
    name = "webapp"
    namespace = kubernetes_namespace_v1.webapp.metadata[0].name
    labels = {
      app = "app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "app"
      }
    }

    template {
      metadata {
        labels = {
          app = "app"
        }
      }

      spec {
        container {
          name  = "app"
          image = "mcr.microsoft.com/azuredocs/aks-helloworld:v1"

          port {
            container_port = 80
          }
        }
      }
    }
  }
  
}

resource "kubernetes_service_v1" "webapp" {
  metadata {
    name      = "webapp"
    namespace = kubernetes_namespace_v1.webapp.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment_v1.kube_webapp.metadata[0].labels.app
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
