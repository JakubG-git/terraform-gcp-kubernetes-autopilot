output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "Cluster Host"
}

output "kubernetes_cluster_uri" {
  value = google_dns_record_set.kube-dns-record.name
  description = "Cluster URI"
  
}

output "region" {
  value       = var.gcp_region
  description = "Region"
}