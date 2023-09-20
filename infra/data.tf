# Query medium instance size
data "civo_size" "large" {
  filter {
    key    = "name"
    values = [local.cluster.node_type]
  }

  sort {
    key       = "ram"
    direction = "asc"
  }
}