output "name" {
    description = "The name of the GKE cluster"
    value = google_container_cluster.gke_cluster.name
}

output "endpoint" {
    description = "The endpoint address of the GKE cluster"
    value = google_container_cluster.gke_cluster.endpoint
}