variable "key_pair_A" {
  type        = string
  sensitive   = true
  description = "Key Pair for Region 1"
}

variable "key_pair_B" {
  type        = string
  sensitive   = true
  description = "Key Pair for Region 2"
}

variable "key_pair_C" {
  type        = string
  sensitive   = true
  description = "Key Pair for Region 3"
}

variable "ssh_ingress_cidr" {
  type        = string
  description = "Your own public IP in CIDR form (for example 203.0.113.10/32). SSH and ICMP are allowed only from here and from the lab's private 10.0.0.0/8 ranges."

  validation {
    condition     = can(cidrhost(var.ssh_ingress_cidr, 0)) && var.ssh_ingress_cidr != "0.0.0.0/0"
    error_message = "Use a specific CIDR such as your.ip.address/32, not 0.0.0.0/0."
  }
}
