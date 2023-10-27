// vm_os_dist              = "debian"
// vm_os_version           = "12"
// vm_id                   = "999000012"
// vm_name                 = "tmpl-debian12"
// vm_template_description = "Debian 12 Bookworm Packer Template"

// vm_cpu_type = "host"
// vm_sockets  = "1"
// vm_cores    = "2"
// vm_memory   = "2048"

// iso_file         = "nfs-backup-rbx:iso/debian-12.2.0-amd64-netinst.iso"
// iso_url          = "https://get.debian.org/images/release/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso"
// iso_checksum     = "sha512:11d733d626d1c7d3b20cfcccc516caff2cbc57c81769d56434aab958d4d9b3af59106bc0796252aeefede8353e2582378e08c65e35a36769d5cf673c5444f80e"
// iso_storage_pool = "nfs-backup-rbx"
// iso_unmount_iso  = true

// cloud_init_boot_wait    = "5s"
// cloud_init_boot_command = [ "<esc><wait>auto url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<enter>" ]
