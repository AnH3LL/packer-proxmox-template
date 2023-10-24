vm_id                = "999002204"
vm_name              = "tmpl-ubuntu2204"
template_description = "Ubuntu 22.04 Jammy Packer Template"

cpu_type = "host"
cores    = "2"
memory   = "2048"

disk_type         = "scsi"
disk_format       = "raw"
disk_size         = "10G"
disk_storage_pool = "zfs-ssd"

iso_url          = "https://cdimage.debian.org/cdimage/archive/11.8.0/amd64/iso-cd/debian-11.8.0-amd64-netinst.iso"
iso_checksum     = "sha512:da7e7867ed043b784f5ae7e4adaaf4f023b5235f0fa2ead1279dc93f74bc17801ed906d330e3cd68ee8d3e96b697d21d23cfe2b755f5a9eb555bd5390a8c4dac"
iso_storage_pool = "nfs-backup-rbx"
