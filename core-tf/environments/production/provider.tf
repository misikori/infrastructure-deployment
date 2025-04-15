terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.27.0"
    }
  }
  backend "gcs" {
    bucket = "obrenovicm-capstone-bucket"
    prefix = "production/tf"
    kms_encryption_key = ""
  }
}

provider "google" {
  project = var.project_id
  region  = "europe-west1"
  zone = "europe-west1-b"
}