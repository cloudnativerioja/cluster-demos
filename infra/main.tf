# Create a firewall
resource "civo_firewall" "firewall" {
  name                 = local.firewall.name
  create_default_rules = false
  ingress_rule {
    label      = "kubernetes-api-server"
    protocol   = "tcp"
    port_range = "6443"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }
}

# Create a cluster with k3s
resource "civo_kubernetes_cluster" "demo-cluster" {
  name         = local.cluster.name
  firewall_id  = civo_firewall.firewall.id
  cluster_type = local.cluster.type
  applications = try(local.cluster.applications, "")
  cni          = try(local.cluster.cni, "")
  pools {
    label      = local.cluster.label-nodes
    size       = element(data.civo_size.medium.sizes, 0).name
    node_count = local.cluster.nodes
  }
  lifecycle {
    ignore_changes = [pools]
  }
}

# Add a node pool
resource "civo_kubernetes_node_pool" "high-spec" {
  cluster_id = civo_kubernetes_cluster.demo-cluster.id
  label      = "high-spec"                                   // Optional
  node_count = local.extra-nodepool.nodes                  // Optional
  size       = element(data.civo_size.small.sizes, 0).name // Optional
  region     = "LON1"

  labels = {
    high-spec = "true"
  }

  taint {
    key    = "high-spec"
    value  = "true"
    effect = "NoSchedule"
  }
  lifecycle {
    ignore_changes = [node_count]
  }
}
