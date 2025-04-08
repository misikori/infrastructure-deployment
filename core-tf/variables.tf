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
  }))
}