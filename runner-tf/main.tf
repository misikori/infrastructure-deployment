module "runner" {
  source             = "./modules/compute"
  vm_name            = var.vm_name
  ssh_pub_key_path   = var.ssh_pub_key_path
  ssh_user           = var.ssh_user
  service_account_id = var.service_account_id
  network_name       = var.network_name
  subnetwork_name    = module.vpc.subnets_names[0]
}

module "vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 10.0"
  project_id   = var.project_id
  network_name = var.network_name
  subnets      = var.subnets
}

module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 6.0"
  name    = var.router_name
  project = var.project_id
  network = module.vpc.network_name
  region  = var.region

  nats = [{
    name                               = var.nat_name
    source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES"
    nat_ip_allocate_option             = "AUTO_ONLY"
  }]
}

module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  version      = "~> 10.0"
  project_id   = var.project_id
  network_name = module.vpc.network_name
  egress_rules = [{
    name               = "allow-egress-nat"
    priority           = 1000
    destination_ranges = ["0.0.0.0/0"]
    allow = [{
      protocol = "tcp"
      ports    = ["22", "80", "443"]
      },
      {
        protocol = "udp"
    }]
  }]

  ingress_rules = [{
    name = "allow-ssh-ingress"
    source_ranges = ["35.235.240.0/20"]
    allow = [{
      protocol = "tcp"
      ports = ["22"]
    }]
  }]
}