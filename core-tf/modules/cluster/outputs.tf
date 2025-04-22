output "dns_endpoint" {
  value = google_container_cluster.primary.control_plane_endpoints_config[0].dns_endpoint_config[0].endpoint
}