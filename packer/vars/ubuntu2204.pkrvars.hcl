// vm_os_dist              = "ubuntu"
// vm_os_version           = "2204"
// vm_id                   = "999002204"
// vm_name                 = "tmpl-ubuntu2204"
// vm_template_description = "Ubuntu 22.04 Jammy Packer Template"

// vm_cpu_type = "host"
// vm_sockets  = "1"
// vm_cores    = "2"
// vm_memory   = "2048"

// iso_file         = "nfs-backup-rbx:iso/ubuntu-22.04.3-live-server-amd64.iso"
// iso_url          = "https://releases.ubuntu.com/jammy/ubuntu-22.04.3-live-server-amd64.iso"
// iso_checksum     = "sha512:8e91080603bbae8c92f5102d0c8ddfa05b957965a29e916242c818089734ddc84c24608b9820f895102d06fb5d8b118cc18bf8d60e2a9c20ccd07a8929bba868"
// iso_storage_pool = "nfs-backup-rbx"
// iso_unmount_iso  = true

// cloud_init_boot_wait = "5s"
// cloud_init_boot_command = [
//   "<esc><wait>",
//   "e<wait>",
//   "<down><down><down><end>",
//   "<bs><bs><bs><bs><wait>",
//   "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
//   "<f10><wait>"
// ]
