terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.122.0"
    }
  }
}

data "yandex_compute_image" "image" {
  family = var.instance-type
}

resource "yandex_compute_instance" "web-server" {
  name        = "${var.instance-type}-server"
  platform_id = "standard-v3"
  zone        = var.subnet.zone

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
    subnet_id = var.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }

}