# Module for VM's description
terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.122.0"
    }
  }

  required_version = ">= 0.13"
}

data "yandex_compute_image" "image" {
  family = var.instance-type
}

data "yandex_vpc_subnet" "subnet" {
  name = var.subnet
}

resource "yandex_compute_instance" "vm" {
  name        = "vm-${var.instance-number}"
  platform_id = "standard-v2" # Intel Cascade Lake
  zone        = data.yandex_vpc_subnet.subnet.zone

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      type     = "network-hdd"
      image_id = data.yandex_compute_image.image.id
      size     = 15
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.subnet.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }

  scheduling_policy {
    preemptible = true # Interrupted VM
  }
}
