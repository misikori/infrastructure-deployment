terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.30.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.36.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "europe-west1"
  zone    = "europe-west1-b"
}