// backend configuration for Terraform state
terraform {
  backend "azurerm" {
    resource_group_name  = "kubedeploydev-rg"
    storage_account_name = "kubedeploystatedev"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}