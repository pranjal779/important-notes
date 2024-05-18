variable "vpn_ip" {
  default = "102.20.30.50/32"
}

variable "app_port" {
  default = "8080"
}

variable "ssh_port" {
  default = "22"
}

variable "ftp_port" {
  default     = "21"
  description = "The port number used by the FTP server for communication. Default is set to 21, which is the standard port for FTP."
}
