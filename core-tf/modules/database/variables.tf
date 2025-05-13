variable "compute_address_name" {
  type        = string
  description = "Name of the static address"
}

variable "addr_prefix_length" {
  type        = number
  default     = 16
  description = "Lenght of prefix for static address"
}

variable "network_id" {
  type        = string
  description = "ID of the VPC in which to reserve the IP range."
}

variable "db_instance_name" {
  type = string
}

variable "db_instance_tier" {
  type        = string
  default     = "db-f1-micro"
  description = "Tier to use for database instance"
}

variable "network_self_link" {
  type        = string
  description = "Self link of VPC from which the database instance is accessible for private IP."
}

variable "database_name" {
  type        = string
  description = "Name of the created database."
}

variable "db_user" {
  type    = string
  default = "user"
}

variable "db_password" {
  type = string
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "psc_network" {
  type = string
}

variable "psc_subnetwork" {
  type = string
}