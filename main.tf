locals {
  available-zones = length(data.google_compute_zones.available.names)
}

data "google_compute_zones" "available" {
}


module "compute_gcp_cp" {
  source = "github.com/mentoriaiac/iac-modulo-compute-gcp.git"

  count = var.node_pools.cp-node.count == 0 ? 0 : var.node_pools.cp-node.count

  project = var.project
  network = var.network

  instance_image = lookup(var.node_pools.cp-node, "instance_image")
  machine_type   = lookup(var.node_pools.cp-node, "machine_type")

  zone          = data.google_compute_zones.available.names[count.index % local.available-zones]
  instance_name = "${lookup(var.node_pools.cp-node, "name")}-${count.index + 1}"

  # TODO: criar essa input no modulo compute
  # metadata_startup_script = metadata_startup_script

  # TODO: como receber labels no hash de node_pools
  labels = {
    value = "key"
  }
}

module "compute_gcp_worker" {
  source = "github.com/mentoriaiac/iac-modulo-compute-gcp.git"

  count = var.node_pools.worker-node.count == 0 ? 0 : var.node_pools.worker-node.count

  project = var.project
  network = var.network

  instance_image = lookup(var.node_pools.worker-node, "instance_image")
  machine_type   = lookup(var.node_pools.worker-node, "machine_type")

  zone          = data.google_compute_zones.available.names[count.index % local.available-zones]
  instance_name = "${lookup(var.node_pools.worker-node, "name")}-${count.index + 1}"

  # TODO: criar essa input no modulo compute
  # metadata_startup_script = metadata_startup_script

  # TODO: como receber labels no hash de node_pools
  labels = {
    value = "key"
  }
}
