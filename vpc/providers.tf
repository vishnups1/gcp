terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.73.1"
    }
  }
}

provider "google" {
  project = "hello-world-392911"
}