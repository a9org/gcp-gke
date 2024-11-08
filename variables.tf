variable "region" {
  description = "The region where the resources will be created"
  type        = string
}

variable "owner" {
  description = "The owner of the infraestructure resources"
  type        = string
}

variable "project" {
  description = "The project name associated with the infraestructure resources"
  type        = string
}

variable "environment" {
  description = "The environment type (e.g., 'development', 'staging', 'production')"
  type        = string
}

variable "min_nodes" {
  description = "The minimum number of nodes in the cluster"
  type        = number
}

variable "max_nodes" {
  description = "The maximum number of nodes in the cluster"
  type        = number
}

variable "machine_type" {
  description = "The machine type of the nodes in the cluster"
  type        = string
}

variable "network" {
  description = "The name or self_link of the Google Compute Engine network to which the cluster is connected. For Shared VPC, set this to the self link of the shared network."
  type        = string
}

variable "subnetwork" {
  description = "The name or self_link of the Google Compute Engine subnetwork in which the cluster's instances are launched."
  type        = string
}