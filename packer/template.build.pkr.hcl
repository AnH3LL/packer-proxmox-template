build {
  name = "pre-provisioning"

  sources = ["source.null.ansible-pre-provisioning"]

  provisioner "ansible" {
    playbook_file = "./packer/ansible/playbooks/pre_provisioning.yaml"
    extra_arguments = [
      "--extra-vars",
      "os_dist='${var.vm_os_dist}' os_version='${var.vm_os_version}' user='packer' password='packer' ssh_folder='../output/ssh_keys' ssh_key_name='ssh_key_${var.vm_os_dist}${var.vm_os_version}_packer'"
    ]
  }
}

build {
  name = "${var.vm_os_dist}${var.vm_os_version}"

  sources = ["source.proxmox-iso.template"]

  // provisioner "shell" {
  //   inline = [ "sleep 600" ]
  // }

  provisioner "ansible" {
    playbook_file           = "./packer/ansible/playbooks/post_provisioning.yaml"
    use_proxy               = false
    user                    = "packer"
    // ssh_host_key_file = "./packer/ansible/output/ssh_keys/ssh_key_${var.vm_os_dist}${var.vm_os_version}_packer"
    // ssh_authorized_key_file = "./packer/ansible/output/ssh_keys/ssh_key_${var.vm_os_dist}${var.vm_os_version}_packer.pub"
    extra_arguments = [
      // "-vvvvv",
      "--extra-vars",
      "ansible_ssh_private_key_file='./packer/ansible/output/ssh_keys/ssh_key_${var.vm_os_dist}${var.vm_os_version}_packer'"
    ]
    // ansible_ssh_extra_args = ["-o IdentitiesOnly=yes", "-o IdentityFile='./packer/ansible/output/ssh_keys/ssh_key_${var.vm_os_dist}${var.vm_os_version}_packer'"]
    // ansible_env_vars = ["PRIVATE_KEY_FILE='./packer/ansible/output/ssh_keys/ssh_key_${var.vm_os_dist}${var.vm_os_version}_packer'"]
  }
}
