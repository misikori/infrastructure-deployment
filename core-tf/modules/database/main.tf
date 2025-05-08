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
    }
  }

  depends_on          = [google_service_networking_connection.private_vpc_connection]
  deletion_protection = true
}

resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.db_instance.name
}

resource "google_sql_user" "user" {
  name        = var.db_user
  instance    = google_sql_database_instance.db_instance.name
  password_wo = var.db_password
  host = "%"
}