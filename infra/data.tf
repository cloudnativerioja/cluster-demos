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

# Query small instance size
data "civo_size" "small" {
  filter {
    key    = "name"
    values = [local.extra-nodepool.node_type]
  }

  sort {
    key       = "ram"
    direction = "asc"
  }
}