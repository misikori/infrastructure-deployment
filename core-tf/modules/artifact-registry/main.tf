resource "google_artifact_registry_repository" "my-repo" {
  repository_id = var.repository_id
  location = var.location
  description = "example artifact repository"
  format = "DOCKER"
  lifecycle {
    prevent_destroy = true
  }
}