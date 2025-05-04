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

    google-beta = {
      source  = "hashicorp/google-beta"
      version = "6.32.0"
    }
  }

    backend "gcs" {
    bucket             = "obrenovicm-capstone-bucket"
    prefix             = "dev/tf"
    kms_encryption_key = ""
  }
}

provider "google" {
  project = var.project_id
  region  = "europe-west1"
  zone    = "europe-west1-b"
}

provider "google-beta" {
  project = var.project_id
  region  = "europe-west1"
  zone    = "europe-west1-b"
}