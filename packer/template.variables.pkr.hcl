variable "proxmox_api_user" {
  type    = string
  default = ""
}

variable "proxmox_api_password" {
  type      = string
  sensitive = true
  default   = ""
}

variable "os_dist" {
  type    = string
  default = ""
}

variable "os_version" {
  type    = string
  default = ""
}
