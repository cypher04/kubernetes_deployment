terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 4.63.0"
        }
        kubernetes = {
            source  = "hashicorp/kubernetes"
            version = "3.0.1"
        }
    }
}

provider "azurerm" {
    features {}
}

provider "kubernetes" {
  # Configuration options
  config_path = "~/.kube/config"
  
}