variable "project_id" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnets" {
  type = list(object({
    subnet_name   = string
    ip_cidr_range = string
    region        = string
    pods_range_name = string
    pods_range_cidr = string
    services_range_name = string
    services_range_cidr = string
  }))
}

variable "np_name" {
  type = string
  description = "Name for the created node pool"
}

variable "location" {
  type = string
  description = "Location where cluster will be created"
}

variable "cluster_name" {
  type = string
  description = "name for the created cluster"  
}

variable "service_account" {
  type = string
  description = "service account id"
}