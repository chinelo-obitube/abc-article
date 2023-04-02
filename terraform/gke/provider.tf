provider "google" {
  project = "my-bitnami-hosting"
  region  = "europe-west2"
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}