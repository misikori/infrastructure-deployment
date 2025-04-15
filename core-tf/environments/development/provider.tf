terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.27.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "europe-west1"
  zone = "europe-west1-b"
}