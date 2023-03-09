terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.56.0"
    }
  }
}

provider "google" {
  project = local.project_id
  region  = "us-central1"
  zone    = "us-central1-a"
}