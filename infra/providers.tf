provider "civo" {
  token  = var.civo_token
  region = local.cluster.region
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    exec {
      api_version = "client.authentication.k8s.io/v1"
      command     = "civo"
      args = [
        "kubernetes",
        "config",
        civo_kubernetes_cluster.demo-cluster.name,
        "--save",
        "--override",
      ]
    }
  }
}