locals {
  folder_id = "b1gsranh24ob6clsohk3"
  zone      = "ru-central1-a"
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
  folder_id                = local.folder_id
  zone                     = local.zone
}

// Create SA
resource "yandex_iam_service_account" "storage-sa" {
  folder_id = local.folder_id
  name      = "tf-storage-sa"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = local.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.storage-sa.id}"
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.storage-sa.id
  description        = "static access key for object storage"
}

// Use keys to create bucket
resource "yandex_storage_bucket" "tf-state-storage" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "kost3727-tf-state-bucket"
#   acl        = "private"
#   versioning {
#     enabled = true
#   }
}

output "static-access-key" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.access_key
}

output "static-secret-key" {
  value     = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  sensitive = true
}

output "bucket-name" {
  value = yandex_storage_bucket.tf-state-storage.bucket
}
