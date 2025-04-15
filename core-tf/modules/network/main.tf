resource "google_compute_network" "vpc" {
  name = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks

}

resource "google_compute_subnetwork" "subnetwork" {
  for_each = { for subnet in var.subnetworks : subnet.subnet_name => subnet}

  name = each.value.subnet_name
  network = google_compute_network.vpc.name
  region = each.value.region
  ip_cidr_range = each.value.ip_cidr_range
  
  secondary_ip_range {
    range_name = each.value.pods_range_name
    ip_cidr_range = each.value.pods_range_cidr
  }

  secondary_ip_range {
    range_name = each.value.services_range_name
    ip_cidr_range = each.value.services_range_cidr
  }
  
}