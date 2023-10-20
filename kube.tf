data "google_container_engine_versions" "gke_versions" {
  location = var.gcp_zone 
}

resource "google_container_cluster" "primary" {
    name = "${var.gcp_cluster_name}"
    location = var.gcp_zone

    network = google_compute_network.kube-network.self_link
    subnetwork = google_compute_subnetwork.kube-subnet.self_link

    enable_autopilot = true

}

resource "google_dns_record_set" "k8s-cluster" {
  name    = "${var.gcp_cluster_name}.${var.gcp_subdomain}"
  type    = "A"
  ttl     = 300
  managed_zone = var.gcp_dns_zone
  rrdatas = [google_container_cluster.primary.endpoint]
}
