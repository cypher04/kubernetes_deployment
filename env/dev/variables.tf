variable "location" {
  description = "The Azure region in which resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to create"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, staging, prod)"
  type        = string
}

variable "address_space" {
    description = "The address space for the virtual network"
    type        = string
}

variable "subnet_prefixes" {
    description = "A map of subnet names to their respective CIDR prefixes"
    type        = map(string)
}

variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
}

variable "node_size" {
  description = "The size of the nodes in the AKS cluster"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the AKS cluster"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the AKS cluster"
  type        = string
  sensitive   = true
}

