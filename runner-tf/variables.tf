variable "project_id" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "ssh_pub_key_path" {
  type = string
}

variable "ssh_user" {
  type = string
}

variable "service_account_id" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnets" {
  type = list(object({
    subnet_name   = string
    subnet_ip     = string
    subnet_region = string
  }))
}

variable "router_name" {
  type    = string
  default = "my-cloud-router"
}

variable "region" {
  type = string
}

variable "nat_name" {
  type    = string
  default = "my-nat-gateway"
}