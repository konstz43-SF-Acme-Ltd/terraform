variable "instance-type" {
  description = "Type of instance: lamp (LAMP) or lemp (LEMP)"
  type        = string
  default     = "lemp"
}

variable "subnet" {
  description = "Subnet for instance"
}
