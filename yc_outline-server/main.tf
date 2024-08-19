# Create an instance for outline-server (shadowbox) in default subnet

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.122.0"
    }
  }

  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = file("~/terraform/yc_auth_key.json")
  cloud_id                 = "b1gnjf7teqrkobji6460"
  folder_id                = "b1gsranh24ob6clsohk3"
  zone                     = "ru-central1-b"
}

data "yandex_compute_image" "image" {
  family = var.instance-type
}

data "yandex_vpc_subnet" "subnet" {
  name = var.subnet
}

resource "yandex_compute_instance" "vm" {
  name        = "shadowbox"
  platform_id = "standard-v2" # Intel Cascade Lake
  zone        = data.yandex_vpc_subnet.subnet.zone

  resources {
    cores         = var.cores
    memory        = var.memory
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      type     = "network-hdd"
      image_id = data.yandex_compute_image.image.id
      size     = var.hd_size
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
    preemptible = false # Not interrupted VM
  }
}
