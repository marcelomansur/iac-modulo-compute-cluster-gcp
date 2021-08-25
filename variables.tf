variable "project" {
  type        = string
  description = "Project ID"
}

variable "network" {
  type        = string
  description = "Network to create the cluster"
}

variable "node_pools" {
  type        = map(map(any))
  description = "Map of objects describing the nodes"
}
