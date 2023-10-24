os_dist              = "debian"
os_version           = "12"
vm_id                = "999000012"
vm_name              = "tmpl-debian12"
template_description = "Debian 12 Bookworm Packer Template with Docker Engine"

cpu_type = "host"
cores    = "2"
memory   = "2048"

disk_type         = "scsi"
disk_format       = "raw"
disk_size         = "10G"
disk_storage_pool = "zfs-ssd"

iso_url          = "https://get.debian.org/images/release/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso"
iso_checksum     = "sha512:11d733d626d1c7d3b20cfcccc516caff2cbc57c81769d56434aab958d4d9b3af59106bc0796252aeefede8353e2582378e08c65e35a36769d5cf673c5444f80e"
iso_storage_pool = "nfs-backup-rbx"
