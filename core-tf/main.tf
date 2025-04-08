module "vpc" {
  source = "./modules/network"
  network_name = var.network_name
  subnetworks = var.subnets
}