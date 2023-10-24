variable "proxmox_url" {
  type    = string
  default = ""
}

variable "proxmox_api_user" {
  type    = string
  default = ""
}

variable "proxmox_api_password" {
  type      = string
  sensitive = true
  default   = ""
}

variable "proxmox_insecure_skip_tls_verify" {
  type    = bool
  default = false
}

variable "proxmox_node" {
  type    = string
  default = ""
}

variable "vm_os_type" {
  type    = string
  default = ""
}

variable "vm_machine_type" {
  type    = string
  default = ""
}

variable "vm_os_dist" {
  type    = string
  default = ""
}

variable "vm_os_version" {
  type    = string
  default = ""
}

variable "vm_id" {
  type    = string
  default = ""
}

variable "vm_name" {
  type    = string
  default = ""
}

variable "vm_template_description" {
  type    = string
  default = ""
}

variable "vm_bios" {
  type    = string
  default = "seabios"
}

variable "vm_cpu_type" {
  type    = string
  default = "kvm64"
}

variable "vm_sockets" {
  type    = string
  default = "1"
}

variable "vm_cores" {
  type    = string
  default = "2"
}

variable "vm_memory" {
  type    = string
  default = "2048"
}

variable "vm_scsi_controller" {
  type    = string
  default = "virtio-scsi-pci"
}

variable "vm_cloud_init" {
  type    = bool
  default = true
}

variable "vm_qemu_agent" {
  type    = bool
  default = true
}

variable "network_model" {
  type    = string
  default = "virtio"
}

variable "iso_url" {
  type    = string
  default = ""
}

variable "iso_file" {
  type    = string
  default = ""
}

variable "iso_storage_pool" {
  type    = string
  default = ""
}

variable "iso_checksum" {
  type    = string
  default = ""
}

variable "iso_unmount_iso" {
  type    = bool
  default = true
}

variable "network_bridge" {
  type    = string
  default = "vmbr1"
}

variable "network_vlan_tag" {
  type    = string
  default = "1001"
}

variable "network_firewall" {
  type    = bool
  default = false
}

variable "disk_type" {
  type    = string
  default = "scsi"
}

variable "disk_format" {
  type    = string
  default = "raw"
}

variable "disk_size" {
  type    = string
  default = "10G"
}

variable "disk_storage_pool" {
  type    = string
  default = ""
}

variable "cloud_init_http_directory" {
  type    = string
  default = ""
}

variable "cloud_init_http_port_min" {
  type    = number
  default = null
}

variable "cloud_init_http_port_max" {
  type    = number
  default = null
}

variable "cloud_init_boot_command" {
  type    = list(string)
  default = []
}

variable "cloud_init_boot_wait" {
  type    = string
  default = "5s"
}

variable "ssh_username" {
  type    = string
  default = "provisioner"
}

variable "ssh_password" {
  type    = string
  default = ""
}

variable "ssh_timeout" {
  type    = string
  default = "20m"
}
