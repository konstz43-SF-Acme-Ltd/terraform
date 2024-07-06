data "terraform_remote_state" "yc-bucket" {
  backend = "local"
  config = {
    path = "${path.module}/../yc_bucket/terraform.tfstate"
  }
}

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.122.0"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "kost3727-tf-state-bucket"
    region = "ru-central1"
    key    = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  service_account_key_file = file("~/terraform/yc_auth_key.json")
  cloud_id                 = "b1gnjf7teqrkobji6460"
  folder_id                = "b1gsranh24ob6clsohk3"
  zone                     = var.zone-a
}

resource "yandex_vpc_network" "net1" {}

resource "yandex_vpc_subnet" "subnet1" {
  v4_cidr_blocks = ["10.1.0.0/16"]
  zone           = var.zone-a
  network_id     = yandex_vpc_network.net1.id
}

resource "yandex_vpc_subnet" "subnet2" {
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = var.zone-b
  network_id     = yandex_vpc_network.net1.id
}

module "lemp-server" {
  source = "../yc_lamp_lemp"

  instance-type = "lemp"
  subnet = yandex_vpc_subnet.subnet1
}

module "lamp-server" {
  source = "../yc_lamp_lemp"

  instance-type = "lamp"
  subnet = yandex_vpc_subnet.subnet2
}
