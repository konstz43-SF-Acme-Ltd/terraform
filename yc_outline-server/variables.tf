variable "subnet" {
  description = "Subnet name for instance"
  type        = string
  default     = "default-ru-central1-b"
}

variable "instance-type" {
  description = "Type of instance: image family_id"
  type        = string
  default     = "nodejslts" # Node.js 18 (LTS) on Ubuntu 22.04 LTS
}

variable "cores" {
  description = "Number of vCPU"
  type        = string
  default     = "2"
}

variable "memory" {
  description = "Memory size (GBytes)"
  type        = string
  default     = "1"
}

variable "hd_size" {
  description = "Hard disk size (GBytes)"
  type        = string
  default     = "10"
}
