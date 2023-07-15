provider "civo" {
  token  = var.civo_token
  region = local.cluster.region
}

provider "helm" {
  kubernetes {
    config_path = "./kubeconfig"
  }
}