data "google_container_engine_versions" "gke_versions" {
  location = var.gcp_zone 
}

resource "google_container_cluster" "primary" {
    name = "${var.gcp_cluster_name}"
    location = var.gcp_region

    network = google_compute_network.kube-network.self_link
    subnetwork = google_compute_subnetwork.kube-subnet.self_link

    enable_autopilot = true

    deletion_protection = false
}