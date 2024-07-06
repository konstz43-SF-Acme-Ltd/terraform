output "internal_ip4_lemp" {
  value = module.lemp-server.internal_ip4
}

output "external_ip4_lemp" {
  value = module.lemp-server.external_ip4
}

output "internal_ip4_lamp" {
  value = module.lamp-server.internal_ip4
}

output "external_ip4_lamp" {
  value = module.lamp-server.external_ip4
}
