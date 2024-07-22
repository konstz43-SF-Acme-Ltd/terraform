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

variable "subnet" {
  description = "Subnet name for instance"
  type        = string
}
