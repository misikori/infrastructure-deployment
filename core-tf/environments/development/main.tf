module "vpc" {
  source = "../../modules/network"
  network_name = var.network_name
  subnetworks = var.subnets
}

module "cluster" {
  source = "../../modules/cluster"
  project_id = var.project_id
  network = module.vpc.network_id
  subnetwork = module.vpc.subnet_id[0]
  cluster_secondary_range_name = var.subnets.0.pods_range_name
  services_secondary_range_name = var.subnets.0.services_range_name
  np_name = var.np_name
  cluster_location = var.location
  cluster_name = var.cluster_name
  service_account = var.service_account
}