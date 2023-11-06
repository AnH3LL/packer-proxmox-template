## Dummy source that enables us to run the ansible pre-provisioning
source "null" "ansible-pre-provisioning" {
  communicator = "none"
}

## Define Proxmox VM template
source "proxmox-iso" "template" {
  proxmox_url              = local.common_config.proxmox.url
  username                 = var.proxmox_api_token_id
  token                    = var.proxmox_api_token_secret
  insecure_skip_tls_verify = local.common_config.proxmox.insecure_skip_tls_verify
  node                     = local.common_config.proxmox.node

  vm_id                   = local.template_config.vm.id
  vm_name                 = local.template_config.vm.name
  template_description    = "${local.template_config.vm.template_description} -- Created: ${formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())}"
  cpu_type                = local.template_config.vm.cpu_type
  sockets                 = local.template_config.vm.sockets
  cores                   = local.template_config.vm.cores
  memory                  = local.template_config.vm.memory
  os                      = local.common_config.vm.os_type
  machine                 = local.common_config.vm.machine_type
  bios                    = local.common_config.vm.bios
  scsi_controller         = local.common_config.vm.scsi_controller
  qemu_agent              = local.common_config.vm.qemu_agent
  cloud_init              = local.common_config.vm.cloud_init

  network_adapters {
    model    = local.common_config.network.model
    bridge   = local.common_config.network.bridge
    vlan_tag = local.common_config.network.vlan_tag
    firewall = local.common_config.network.firewall
  }

  disks {
    type         = local.common_config.disk.type
    format       = local.common_config.disk.format
    disk_size    = local.common_config.disk.size
    storage_pool = local.common_config.disk.storage_pool
  }

  // iso_file         = local.template_config.iso.file
  iso_url          = local.template_config.iso.url
  iso_checksum     = local.template_config.iso.checksum
  iso_download_pve = local.template_config.iso.download_pve
  iso_storage_pool = local.template_config.iso.storage_pool
  unmount_iso      = local.template_config.iso.unmount_iso

  http_directory = "${local.common_config.cloud_init.http_directory}/${local.template_config.vm.os_dist}/${local.template_config.vm.os_version}"
  http_port_min  = local.common_config.cloud_init.http_port_min
  http_port_max  = local.common_config.cloud_init.http_port_max
  boot_wait      = local.template_config.cloud_init.boot_wait
  boot_command   = local.template_config.cloud_init.boot_command

  ssh_username = local.common_config.ssh.username
  ssh_password = local.common_config.ssh.password
  ssh_timeout  = local.common_config.ssh.timeout
}
