output "internal_ip4_lemp" {
  description = "The LEMP server's internal IP address"
  value = module.lemp-server.internal_ip4
}

output "external_ip4_lemp" {
  description = "The LEMP server's external IP address"
  value = module.lemp-server.external_ip4
}

output "internal_ip4_lamp" {
  description = "The LAMP server's internal IP address"
  value = module.lamp-server.internal_ip4
}

output "external_ip4_lamp" {
  description = "The LAMP server's external IP address"
  value = module.lamp-server.external_ip4
}

output "s3_bucket_name" {
  description = "The name of the bucket in which tfstate file is stored"
  value = data.terraform_remote_state.yc-bucket.outputs.bucket-name
}