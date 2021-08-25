module "iac-modulo-compute-cluster-gcp" {
  source = "../"

  project = "hardening-322021"
  network = "default"

  node_pools = {
    # vai virar o name do cluster + instance_name + count
    "cp-node" = {
      # exemplo: "mentoria-cluster-cp-node-1"
      name           = "cp-node"
      machine_type   = "e2-medium"
      node_locations = "us-central1-b,us-central1-c" # no loop vai virar 1 zone por node ou instancia
      count          = 1                             # quantidade de nós
      instance_image = "debian-cloud/debian-9"       # é a imagem da maquina
      # metadata_startup_script = "startup-cp.sh"               # tem que ser implementado no modulo iac-modulo-compute-gcp
    },
    # vai virar o name do cluster + instance_name + count
    "worker-node" = {
      # exemplo: "mentoria-cluster-worker-node-1"
      name           = "worker-node"
      machine_type   = "e2-medium"
      node_locations = "us-central1-b,us-central1-c" # no loop vai virar 1 zone por node ou instancia
      count          = 3                             # quantidade de nós
      instance_image = "debian-cloud/debian-9"       # é a imagem da maquina
      # metadata_startup_script = "startup-worker.sh"
    },
  }
}
