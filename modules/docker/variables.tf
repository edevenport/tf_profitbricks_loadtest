variable "server_count" {
  type    = "string"
  default = 0
}

variable "server_ips" {
  type    = "list"
  default = []
}

variable "private_ssh_key_path" {
  type = "string"
}

variable "registry_host" {
  type = "string"
}

variable "registry_host_username" {
  type = "string"
}

variable "registry_host_password" {
  type = "string"
}
