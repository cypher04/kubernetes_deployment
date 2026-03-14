variable "resource_group" {
    description = "The name of the resource group to create"
    type        = string
}

variable "location" {
    description = "The location of the resource group"
    type        = string
}

variable "subnet_prefixes" {
    description = "The subnet prefixes for the virtual network"
    type        = map(string)
}
variable "vnet_id" {
    description = "The ID of the virtual network"
    type        = string
}

variable "subnet_ids" {
    description = "The IDs of the subnets"
    type        = map(string)
}

variable "aks_id" {
    description = "The ID of the AKS cluster"
    type        = string
}

variable "acr_id" {
    description = "The ID of the Azure Container Registry"
    type        = string
}
