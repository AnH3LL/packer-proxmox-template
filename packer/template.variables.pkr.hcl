variable "proxmox_api_token_id" {
  type    = string
  default = ""
}

variable "proxmox_api_token_secret" {
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
