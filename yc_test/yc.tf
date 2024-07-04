variable "zone" {
  description = "Availability zone"
  type        = string
  default     = "ru-central1-a"
}

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.122.0"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = file("~/terraform/yc_auth_key.json")
  cloud_id                 = "b1gnjf7teqrkobji6460"
  folder_id                = "b1gsranh24ob6clsohk3"
  zone                     = var.zone
}

data "yandex_compute_image" "image" {
  family = "lemp"
}

resource "yandex_vpc_network" "net1" {}

resource "yandex_vpc_subnet" "subnet1" {
  v4_cidr_blocks = ["10.1.0.0/16"]
  zone           = var.zone
  network_id     = yandex_vpc_network.net1.id
}

resource "yandex_compute_instance" "lemp-server" {
  name        = "lemp-server"
  platform_id = "standard-v3"
  zone        = var.zone

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      type     = "network-hdd"
      image_id = data.yandex_compute_image.image.id
      size     = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet1.id
    nat       = true
  }

  metadata = {
    # user-data = "${file("meta.txt")}"
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }

}

output "internal_ip4" {
  value = yandex_compute_instance.lemp-server.network_interface.0.ip_address
}

output "external_ip4" {
  value = yandex_compute_instance.lemp-server.network_interface.0.nat_ip_address
}
