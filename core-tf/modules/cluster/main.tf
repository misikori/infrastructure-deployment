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

