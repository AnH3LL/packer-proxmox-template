## Dummy source that enables us to run the ansible pre-provisioning.
source "null" "ansible-pre-provisioning" {
  communicator = "none"
}

## Define Proxmox VM template
source "proxmox-iso" "template" {
  proxmox_url              = var.proxmox_url
  username                 = var.proxmox_api_user
  password                 = var.proxmox_api_password
  insecure_skip_tls_verify = var.proxmox_insecure_skip_tls_verify
  node                     = var.proxmox_node

  vm_id                   = var.vm_id
  vm_name                 = var.vm_name
  template_description    = "${var.vm_template_description} -- Created: ${formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())}"
  os                      = var.vm_os_type
  machine                 = var.vm_machine_type
  cpu_type                = var.vm_cpu_type
  sockets                 = var.vm_sockets
  cores                   = var.vm_cores
  memory                  = var.vm_memory
  bios                    = var.vm_bios
  scsi_controller         = var.vm_scsi_controller
  qemu_agent              = var.vm_qemu_agent
  cloud_init              = var.vm_cloud_init
  cloud_init_storage_pool = var.disk_storage_pool

  network_adapters {
    model    = var.network_model
    bridge   = var.network_bridge
    vlan_tag = var.network_vlan_tag
    firewall = var.network_firewall
  }

  disks {
    type         = var.disk_type
    format       = var.disk_format
    disk_size    = var.disk_size
    storage_pool = var.disk_storage_pool
  }

  iso_file         = var.iso_file
  // iso_url          = var.iso_url
  iso_checksum     = var.iso_checksum
  iso_storage_pool = var.iso_storage_pool
  unmount_iso      = var.iso_unmount_iso

  http_directory = var.cloud_init_http_directory
  http_port_min  = var.cloud_init_http_port_min
  http_port_max  = var.cloud_init_http_port_max
  boot_wait      = var.cloud_init_boot_wait
  boot_command   = var.cloud_init_boot_command

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  ssh_timeout  = var.ssh_timeout
}
