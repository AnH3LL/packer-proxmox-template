build {
  name = "pre-provisioning"

  sources = ["source.null.ansible-pre-provisioning"]

  provisioner "ansible" {
    playbook_file = "./packer/ansible/playbooks/pre_provisioning.yaml"
    extra_arguments = [
      "--extra-vars",
      "os_dist='${var.vm_os_dist}' os_version='${var.vm_os_version}' user='${var.ssh_username}' password='${var.ssh_password}' ssh_folder='../output/ssh_keys' ssh_key_name='ssh_key_${var.vm_os_dist}${var.vm_os_version}_${var.ssh_username}'"
    ]
  }
}

build {
  name = "${var.vm_os_dist}${var.vm_os_version}"

  sources = ["source.proxmox-iso.template"]

  // provisioner "ansible" {
  //   playbook_file           = "./packer/ansible/playbooks/post_provisioning.yaml"
  //   use_proxy               = false
  //   user                    = "packer"
  //   extra_arguments = [
  //     "--extra-vars",
  //     "ansible_ssh_private_key_file='./packer/ansible/output/ssh_keys/ssh_key_${var.vm_os_dist}${var.vm_os_version}_packer'"
  //   ]
  //   ansible_env_vars = [ "ANSIBLE_HOST_KEY_CHECKING=False" ]
  // }

  provisioner "file" {
    source      = "./packer/scripts/${var.vm_os_dist}${var.vm_os_version}_bootstrap.sh"
    destination = "/tmp/${var.vm_os_dist}${var.vm_os_version}_bootstrap.sh"
  }

  provisioner "shell" {
    inline = [
      "sudo chmod +x '/tmp/${var.vm_os_dist}${var.vm_os_version}_bootstrap.sh'",
      "sudo bash '/tmp/${var.vm_os_dist}${var.vm_os_version}_bootstrap.sh'"
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
