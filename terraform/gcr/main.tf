resource "google_container_registry" "abc_registry" {
  project  = "my-bitnami-hosting"
  location = "EU"
}