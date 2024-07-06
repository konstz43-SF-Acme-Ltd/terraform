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
