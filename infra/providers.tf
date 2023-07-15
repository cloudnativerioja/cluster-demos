provider "civo" {
  token  = var.civo_token
  region = local.cluster.region
}

provider "helm" {
  kubernetes {
    host = civo_kubernetes_cluster.demo-cluster.api_endpoint
    insecure = true
  }
}