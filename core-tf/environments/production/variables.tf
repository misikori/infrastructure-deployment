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