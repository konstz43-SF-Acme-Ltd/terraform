# Create two instances in one subnet

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

module "ubuntu1" {
  source = "./mod_vm"

  #   instance-type =
  instance-number = "1"
  subnet = var.sub_net
}

module "ubuntu2" {
  source = "./mod_vm"

  instance-type   = "ubuntu-2204-lts" # Ubuntu 22.04 LTS
  instance-number = "2"
  subnet = var.sub_net
}
