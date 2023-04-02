terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.59.0"
    }
  }
}


provider "google" {
  project     = "my-bitnami-hosting"
  region      = "europe-west2"
}

