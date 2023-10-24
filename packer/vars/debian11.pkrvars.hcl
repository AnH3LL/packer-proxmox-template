vm_os_dist              = "debian"
vm_os_version           = "11"
vm_id                   = "999000011"
vm_name                 = "tmpl-debian11"
vm_template_description = "Debian 11 Bullseye Packer Template"

vm_cpu_type = "host"
vm_sockets  = "1"
vm_cores    = "2"
vm_memory   = "2048"

iso_file         = "nfs-backup-rbx:iso/debian-11.8.0-amd64-netinst.iso"
iso_url          = "https://cdimage.debian.org/cdimage/archive/11.8.0/amd64/iso-cd/debian-11.8.0-amd64-netinst.iso"
iso_checksum     = "sha512:da7e7867ed043b784f5ae7e4adaaf4f023b5235f0fa2ead1279dc93f74bc17801ed906d330e3cd68ee8d3e96b697d21d23cfe2b755f5a9eb555bd5390a8c4dac"
iso_storage_pool = "nfs-backup-rbx"
iso_unmount_iso  = true

cloud_init_boot_wait    = "5s"
cloud_init_boot_command = [ "<esc><wait>auto url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<enter>" ]
