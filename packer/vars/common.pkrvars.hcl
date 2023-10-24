proxmox_url                      = "https://pve-rbx.nubiqo.com:8006/api2/json"
proxmox_insecure_skip_tls_verify = false
proxmox_node                     = "pve-rbx"

vm_qemu_agent = true
vm_cloud_init = true

vm_os_type         = "l26"
vm_machine_type    = "q35"
vm_bios            = "seabios"
vm_scsi_controller = "virtio-scsi-pci"

network_model    = "virtio"
network_bridge   = "vmbr1"
network_vlan_tag = "1001"
network_firewall = false

disk_type         = "scsi"
disk_format       = "raw"
disk_size         = "10G"
disk_storage_pool = "zfs-ssd"

cloud_init_http_directory = "packer/ansible/output/cloud-init"
cloud_init_http_port_min  = 8100
cloud_init_http_port_max  = 8100

ssh_username = "packer"
ssh_password = "packer"
ssh_timeout  = "20m"
