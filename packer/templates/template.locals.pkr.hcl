locals {
  common_config     = yamldecode(file("../config/common.yaml"))
  template_config   = yamldecode(file("../config/${var.os_dist}${var.os_version}.yaml"))
  cloud-init_config = yamldecode(file("../config/${var.os_dist}${var.os_version}_cloud-init.yaml"))
  config            = merge(local.common_config, local.template_config, local.cloud-init_config)
}
