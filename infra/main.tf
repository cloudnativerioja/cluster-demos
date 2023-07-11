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
}


resource "local_file" "kubeconfig" {
  depends_on = [civo_kubernetes_cluster.demo-cluster]
  filename   = "./kubeconfig"
  content    = civo_kubernetes_cluster.demo-cluster.kubeconfig
}

# Create a DNS zone in Civo
resource "civo_dns_domain_name" "cluster_domain" {
  name = "cluster.cloudnativerioja.com"
}