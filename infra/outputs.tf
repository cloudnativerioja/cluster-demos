output "clustername" {
  value       = civo_kubernetes_cluster.demo-cluster.name
  sensitive   = false
  description = "Nombre del cluster"
}

output "civo_node_size" {
  value       = civo_kubernetes_cluster.demo-cluster.pools[0].size
  sensitive   = false
  description = "Nodos del cluster"
}

output "applications_installed" {
  value       = civo_kubernetes_cluster.demo-cluster.applications
  sensitive   = false
  description = "Aplicaciones instaladas en el cluster"
}