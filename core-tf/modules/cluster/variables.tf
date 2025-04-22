variable "cluster_name" {
  type = string
}

variable "cluster_location" {
  type = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "cluster_secondary_range_name" {
  type        = string
  description = "the name of the existing secondary range to use for pod addresses"
}

variable "services_secondary_range_name" {
  type = string
}

variable "np_name" {
  type        = string
  description = "Custom node pool name"
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "image_type" {
  type    = string
  default = "COS_CONTAINERD"
}

variable "service_account" {
  type = string
}

variable "total_min_node_count" {
  type        = number
  description = "Min number of nodes in the Node pool"
  default     = 3
}

variable "total_max_node_count" {
  type        = number
  description = "Max number of nodes in the Node pool"
  default     = 6
}

variable "max_pods_per_node" {
  type    = number
  default = 10
}

variable "project_id" {
  type = string
}

variable "enable_private_nodes" {
  type    = bool
  default = true
}

variable "enable_private_endpoint" {
  type    = bool
  default = true
}

# variable "whitelist" {
#   type = list(
#     object({
#       cidr_block = string
#       cidr_name  = string
#     })
#   )
# }

variable "dns_external_traffic" {
  type = bool
  default = false
}

variable "ip_endpoint_enabled" {
  type = bool
  default = false
}