# Query medium instance size
data "civo_size" "medium" {
  filter {
    key    = "name"
    values = [local.cluster.node_type]
  }

  sort {
    key       = "ram"
    direction = "asc"
  }
}

data "helm_repository" "argo" {
  name = "argo"
  url  = "https://argoproj.github.io/argo-helm"
}