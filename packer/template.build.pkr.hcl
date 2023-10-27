build {
  name = "pre-provisioning"

  sources = ["source.null.ansible-pre-provisioning"]

  provisioner "ansible" {
    playbook_file = "./packer/ansible/playbooks/pre_provisioning.yaml"
    extra_arguments = [
      "--extra-vars",
      "os_dist='${local.template_config.vm.os_dist}' os_version='${local.template_config.vm.os_version}' user='${local.common_config.ssh.username}' password='${local.common_config.ssh.password}' ssh_folder='../output/ssh_keys' ssh_key_name='ssh_key_${local.template_config.vm.os_dist}${local.template_config.vm.os_version}_${local.common_config.ssh.username}'"
    ]
  }
}

build {
  name = "${local.template_config.vm.os_dist}${local.template_config.vm.os_version}"

  sources = ["source.proxmox-iso.template"]

  // provisioner "ansible" {
  //   playbook_file           = "./packer/ansible/playbooks/post_provisioning.yaml"
  //   use_proxy               = false
  //   user                    = "packer"
  //   extra_arguments = [
  //     "--extra-vars",
  //     "ansible_ssh_private_key_file='./packer/ansible/output/ssh_keys/ssh_key_${local.template_config.vm.os_dist}${local.template_config.vm.os_version}_${local.common_config.ssh.username}'"
  //   ]
  //   ansible_env_vars = [ "ANSIBLE_HOST_KEY_CHECKING=False" ]
  // }

  provisioner "file" {
    source      = "./packer/scripts/${local.template_config.vm.os_dist}${local.template_config.vm.os_version}_bootstrap.sh"
    destination = "/tmp/${local.template_config.vm.os_dist}${local.template_config.vm.os_version}_bootstrap.sh"
  }

  provisioner "shell" {
    inline = [
      "sudo chmod +x '/tmp/${local.template_config.vm.os_dist}${local.template_config.vm.os_version}_bootstrap.sh'",
      "sudo bash '/tmp/${local.template_config.vm.os_dist}${local.template_config.vm.os_version}_bootstrap.sh'"
    ]
  }

  provisioner "file" {
    source      = "./packer/ansible/output/cloud-init/99-pve.cfg"
    destination = "/tmp/99-pve.cfg"
  }

  provisioner "shell" {
    inline = ["sudo cp /tmp/99-pve.cfg /etc/cloud/cloud.cfg.d/99-pve.cfg"]
  }
}
