resource "google_container_node_pool" "primary_nodes" {
  name       = "ndp-${local.prefix_name}-pool"
  location   = var.region
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = var.min_nodes
    max_node_count = var.max_nodes
  }

  timeouts {
    create = "20m"
    update = "20m"
  }

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  labels = local.common_tags
}