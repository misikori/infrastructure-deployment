resource "google_container_cluster" "primary" {
  name                = var.cluster_name
  location            = var.cluster_location
  deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.network
  subnetwork               = var.subnetwork
  project                  = var.project_id
  ip_allocation_policy {
    cluster_secondary_range_name  = var.cluster_secondary_range_name
    services_secondary_range_name = var.services_secondary_range_name
  }

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  cluster_autoscaling {
    enabled = false
  }

  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint

  }

  control_plane_endpoints_config {
    dns_endpoint_config {
      allow_external_traffic = var.dns_external_traffic
    }

    ip_endpoints_config {
      enabled = var.ip_endpoint_enabled
    }
  }

  # master_authorized_networks_config {
  #   cidr_blocks {
  #     cidr_block   = var.whitelist[0].cidr_block
  #     display_name = var.whitelist[0].cidr_name
  #   }
  # }
}

resource "google_container_node_pool" "primary-np" {
  cluster           = google_container_cluster.primary.name
  name              = var.np_name
  location          = google_container_cluster.primary.location
  project           = google_container_cluster.primary.project
  max_pods_per_node = var.max_pods_per_node

  node_config {
    machine_type    = var.machine_type
    image_type      = var.image_type
    service_account = var.service_account
    oauth_scopes    = ["cloud-platform"]
  }

  autoscaling {
    total_min_node_count = var.total_min_node_count
    total_max_node_count = var.total_max_node_count
  }
}

