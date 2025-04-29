variable "project_id" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnets" {
  type = list(object({
    subnet_name         = string
    ip_cidr_range       = string
    region              = string
    pods_range_name     = string
    pods_range_cidr     = string
    services_range_name = string
    services_range_cidr = string
  }))
}

variable "np_name" {
  type        = string
  description = "Name for the created node pool"
}

variable "location" {
  type        = string
  description = "Location where cluster will be created"
}

variable "cluster_name" {
  type        = string
  description = "name for the created cluster"
}

variable "service_account" {
  type        = string
  description = "service account id"
}

variable "hpa_name" {
  type    = string
  default = "custom-hpa"
}

variable "max_replicas" {
  type = number
}

variable "target_name" {
  type = string
}

variable "api_version" {
  type = string
}

variable "compute_address_name" {
  type    = string
  default = "private-ip-address"
}

variable "db_instance_name" {
  type    = string
  default = "mobrenovic-private-instance"
}

variable "database_name" {
  type    = string
  default = "mobrenovic-petclinic"
}

variable "db_password" {
  type = string
}

variable "repository_id" {
  type = string
}