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

variable "node_count" {
    description = "The number of nodes in the AKS cluster"
    type        = number
}

variable "cluster" {
  
}