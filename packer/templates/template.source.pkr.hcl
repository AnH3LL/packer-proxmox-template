## Define Proxmox VM template
source "proxmox-iso" "template" {
  proxmox_url              = local.config.common.proxmox.url
  username                 = var.proxmox_api_token_id
  token                    = var.proxmox_api_token_secret
  insecure_skip_tls_verify = local.config.common.proxmox.insecure_skip_tls_verify
  node                     = local.config.common.proxmox.node

  vm_id                   = local.config.template.vm.id
  vm_name                 = local.config.template.vm.name
  template_description    = "${local.config.template.vm.template_description} -- Created: ${formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())}"
  cpu_type                = local.config.template.vm.cpu_type
  sockets                 = local.config.template.vm.sockets
  cores                   = local.config.template.vm.cores
  memory                  = local.config.template.vm.memory
  os                      = local.config.common.vm.os_type
  machine                 = local.config.common.vm.machine_type
  bios                    = local.config.common.vm.bios
  scsi_controller         = local.config.common.vm.scsi_controller
  qemu_agent              = local.config.common.vm.qemu_agent
  cloud_init              = local.config.common.vm.cloud_init

  network_adapters {
    model    = local.config.common.network.model
    bridge   = local.config.common.network.bridge
    vlan_tag = local.config.common.network.vlan_tag
    firewall = local.config.common.network.firewall
  }

  disks {
    type         = local.config.common.disk.type
    format       = local.config.common.disk.format
    disk_size    = local.config.common.disk.size
    storage_pool = local.config.common.disk.storage_pool
  }

  // iso_file         = local.config.template.iso.file
  iso_url          = local.config.template.iso.url
  iso_checksum     = local.config.template.iso.checksum
  iso_download_pve = local.config.template.iso.download_pve
  iso_storage_pool = local.config.template.iso.storage_pool
  unmount_iso      = local.config.template.iso.unmount_iso

  http_directory = "${local.config.cloud_init.http_directory}/${local.config.template.os.dist}/${local.config.template.os.version}"
  http_port_min  = local.config.cloud_init.http_port_min
  http_port_max  = local.config.cloud_init.http_port_max
  boot_wait      = local.config.cloud_init.boot_wait
  boot_command   = local.config.cloud_init.boot_command

  ssh_username = local.config.common.ssh.username
  ssh_password = local.config.common.ssh.password
  ssh_timeout  = local.config.common.ssh.timeout
}
