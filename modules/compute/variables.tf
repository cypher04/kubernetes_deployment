variable "resource_group" {
    description = "The name of the resource group to create"
    type        = string
}

variable "location" {
    description = "The location of the resource group"
    type        = string
}

variable "kube_principal_id" {
    description = "The principal ID of the Kubernetes cluster's managed identity"
    type        = string
}