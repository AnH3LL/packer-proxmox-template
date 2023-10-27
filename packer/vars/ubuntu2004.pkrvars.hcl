// vm_os_dist              = "ubuntu"
// vm_os_version           = "2004"
// vm_id                   = "999002004"
// vm_name                 = "tmpl-ubuntu2004"
// vm_template_description = "Ubuntu 20.04 Focal Packer Template"

// vm_cpu_type = "host"
// vm_sockets  = "1"
// vm_cores    = "2"
// vm_memory   = "2048"

// iso_file         = "nfs-backup-rbx:iso/ubuntu-20.04.6-live-server-amd64.iso"
// iso_url          = "https://releases.ubuntu.com/20.04.6/ubuntu-20.04.6-live-server-amd64.iso"
// iso_checksum     = "sha512:1b35a52bd32f5257b3454787c87688fdbe3fdd018a47ed2cf9a7cca71630f54230ceefd544cd984adf7593974b0087a9da2e51eaf9fea8a105ce86ef4be5fc76"
// iso_storage_pool = "nfs-backup-rbx"
// iso_unmount_iso  = true

// cloud_init_boot_wait = "5s"
// cloud_init_boot_command = [
//   "<esc><wait><esc><wait><f6><wait><esc><wait>",
//   "<bs><bs><bs><bs><bs>",
//   "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ",
//   "--- <enter>"
// ]
