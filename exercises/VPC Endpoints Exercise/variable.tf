variable "ami" {
  type        = string
  description = "Amazon Linux 2 Latest IMG"
  sensitive   = true
}

variable "keypair" {
  type        = string
  description = "Remote Access Key Pair"
  sensitive   = true
}

variable "availability_zone" {
  type        = list(string)
  description = "ap-northeast-2a & 2c region"
  default     = ["ap-northeast-2a"]
}

variable "ssh_ingress_cidr" {
  type        = string
  description = "Your own public IP in CIDR form (for example 203.0.113.10/32). SSH and ICMP are allowed only from here and from the lab's private 10.0.0.0/8 ranges."

  validation {
    condition     = can(cidrhost(var.ssh_ingress_cidr, 0)) && var.ssh_ingress_cidr != "0.0.0.0/0"
    error_message = "Use a specific CIDR such as your.ip.address/32, not 0.0.0.0/0."
  }
}

variable "lab_root_password" {
  type        = string
  sensitive   = true
  description = "Root password set on the private lab instances so you can hop to them over SSH from inside the lab. Password login is accepted only from 10.0.0.0/8. Pass it at apply time (TF_VAR_lab_root_password); never commit it."

  validation {
    condition     = length(var.lab_root_password) >= 12 && !can(regex("['\\\\]", var.lab_root_password))
    error_message = "Use at least 12 characters, without single quotes or backslashes."
  }
}
