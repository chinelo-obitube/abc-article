resource "google_compute_router_nat" "nat" {
  name   = "nat"
  router = google_compute_router.router.name
  region = "europe-west2"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "AUTO_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.private.id
    source_ip_ranges_to_nat = ["10.0.0.0/24"]
}
}

resource "google_compute_address" "nat" {
  name         = "nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"

  depends_on = [google_project_service.compute]
}