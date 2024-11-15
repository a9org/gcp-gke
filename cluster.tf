resource "google_container_cluster" "gke_cluster" {
  name     = "gke-${local.prefix_name}-clt"
  location = var.region

  enable_shielded_nodes    = "true"
  remove_default_node_pool = true
  initial_node_count       = 1
  
  network    = var.network
  subnetwork = var.subnetwork
  
  release_channel {
    channel = "STABLE"
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }
  }

  networking_mode = "VPC_NATIVE"
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/16"
    services_ipv4_cidr_block = "/22"
  }

  timeouts {
    create = "20m"
    update = "20m"
  }

  resource_labels = merge(local.common_tags, {
    "cluster" = "gke-${local.prefix_name}-clt"
  })

  tags = ["gke-cluster"]

  lifecycle {
    ignore_changes = [node_pool]
  }

}