resource "google_compute_global_address" "private_ip_address" {
  name          = var.compute_address_name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = var.addr_prefix_length
  network       = var.network_id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.network_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
  deletion_policy         = "ABANDON"
  provider                = google-beta
}

resource "google_sql_database_instance" "db_instance" {
  name             = var.db_instance_name
  database_version = "MYSQL_8_0"


  settings {
    tier = var.db_instance_tier
    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = var.network_self_link
      enable_private_path_for_google_cloud_services = true
      
      # private service connect to runner.
      psc_config {
        psc_enabled = true
        allowed_consumer_projects = [ var.project_id ]
        psc_auto_connections {
          consumer_network = "projects/${var.project_id}/global/networks/${psc_network}"
        }
      }
    }
  }

  depends_on          = [google_service_networking_connection.private_vpc_connection]
  deletion_protection = true
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.db_instance.name
  deletion_policy = "ABANDON"
}

resource "google_sql_user" "user" {
  name        = var.db_user
  instance    = google_sql_database_instance.db_instance.name
  password_wo = var.db_password
  host = "%"
}


resource "google_compute_address" "default" {
  name         = "psc-compute-address-${google_sql_database_instance.db_instance.name}"
  region       = var.region
  address_type = "INTERNAL"
  subnetwork   = var.psc_subnetwork
}


resource "google_compute_forwarding_rule" "default" {
  name = "psc-forwarding-rule-${google_sql_database_instance.db_instance.name}"
  region = var.region
  network = var.psc_network
  ip_address = google_compute_address.default.self_link
  load_balancing_scheme = ""
  target = google_sql_database_instance.db_instance.psc_service_attachment_link
}