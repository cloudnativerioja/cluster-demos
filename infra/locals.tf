locals {
  config_yaml = yamldecode(file("./../config.yaml"))
  vars        = local.config_yaml
  cluster     = local.vars.cluster
  firewall    = local.vars.firewall
}