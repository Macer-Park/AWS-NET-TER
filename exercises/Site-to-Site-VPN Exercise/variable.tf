variable "key_pair" {
  description = "Name of an existing EC2 KeyPair to enable SSH access to the instances."
  type        = string
}

variable "latest_ami_id" {
  description = "Latest Amazon Linux 2 AMI ID."
  type        = string
  default     = "ami-0ee82191e264e07cc"
}

variable "preshared_key" {
  description = "Pre-shared key for the VPN tunnel. AWS requires 8-64 characters (letters, numbers, period, underscore), not starting with 0. Pass it at apply time (TF_VAR_preshared_key) and enter the same value when the CGW script asks."
  type        = string
  sensitive   = true

  validation {
    condition     = can(regex("^[A-Za-z1-9._][A-Za-z0-9._]{7,63}$", var.preshared_key))
    error_message = "8-64 characters: letters, numbers, period or underscore, not starting with 0."
  }
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
