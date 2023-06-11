provider "civo" {
  token  = var.civo_token
  region = local.cluster.region
}