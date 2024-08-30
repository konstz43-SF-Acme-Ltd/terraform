variable "instance-number" {
  description = "Number or name of instance"
  type        = string
  default     = "1"
}

variable "instance-type" {
  description = "Type of instance: image family_id"
  type        = string
  default     = "ubuntu-2004-lts" # Ubuntu 20.04 LTS
}

variable "cores" {
  description = "Number of vCPU"
  type        = string
  default     = "2"
}

variable "memory" {
  description = "Memory size (GBytes)"
  type        = string
  default     = "2"
}

variable "hd_size" {
  description = "Hard disk size (GBytes)"
  type        = string
  default     = "15"
}

variable "subnet" {
  description = "Subnet name for instance"
  type        = string
}

variable "remote_user" {
  description = "User name for login on remote host"
  type        = string
  default = "ubuntu"
}

variable "interruptible" {
  description = "It's an interruptible machine"
  type        = bool
  default = true
}
