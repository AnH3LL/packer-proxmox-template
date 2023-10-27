locals {
  common_config   = yamldecode(file("./config/common.yaml"))
  template_config = yamldecode(file("./config/${var.os_dist}${var.os_version}.yaml"))
}
