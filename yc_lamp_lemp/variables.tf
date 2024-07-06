variable "zone" {
  description = "Availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "instance-type" {
  description = "Type of instance: lamp (LAMP) or lemp (LEMP)"
  type        = string
  default     = "lemp"
}

variable "subnet" {
  description = "Subnet for instance"
}
