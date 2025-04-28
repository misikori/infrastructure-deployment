variable "network_name" {
  type        = string
  description = "The name of the VPC network"
}

variable "auto_create_subnetworks" {
  type    = bool
  default = false
}

variable "subnetworks" {
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