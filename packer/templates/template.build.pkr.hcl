build {
  name = "${local.config.template.os.dist}${local.config.template.os.version}"

  sources = ["source.proxmox-iso.template"]

  provisioner "ansible" {
    playbook_file   = "../ansible/playbooks/post_provisioning.yaml"
    use_proxy       = false
    user            = "${local.config.common.ssh.username}"
    extra_arguments  = [
      "--extra-vars", "ansible_password=${local.config.common.ssh.password}",
      "--extra-vars", "os_dist=${local.config.template.os.dist}",
      "--extra-vars", "os_version=${local.config.template.os.version}"
    ]
  }

  // provisioner "file" {
  //   source      = "../ansible/output/scripts/${local.config.template.os.dist}${local.config.template.os.version}_bootstrap.sh"
  //   destination = "/tmp/${local.config.template.os.dist}${local.config.template.os.version}_bootstrap.sh"
  // }

  // provisioner "shell" {
  //   inline = [
  //     "sudo chmod +x '/tmp/${local.config.template.os.dist}${local.config.template.os.version}_bootstrap.sh'",
  //     "sudo bash '/tmp/${local.config.template.os.dist}${local.config.template.os.version}_bootstrap.sh'"
  //   ]
  // }

  // provisioner "file" {
  //   source      = "../ansible/output/cloud-init/99-pve.cfg"
  //   destination = "/tmp/99-pve.cfg"
  // }

  // provisioner "shell" {
  //   inline = ["sudo cp /tmp/99-pve.cfg /etc/cloud/cloud.cfg.d/99-pve.cfg"]
  // }
}
