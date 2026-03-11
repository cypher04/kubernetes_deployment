terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 4.63.0"
        }
    }
}

provider "azurerm" {
    features {}
}


terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "3.0.1"
    }
  }
}

provider "kubernetes" {
  # Configuration options
}