variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "The address prefixes for the subnets"
  type        = map(string)
}

variable "resource_group" {
  description = "The name of the resource group to create"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}