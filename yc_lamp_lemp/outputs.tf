output "internal_ip4" {
  value = yandex_compute_instance.web-server.network_interface.0.ip_address
}

output "external_ip4" {
  value = yandex_compute_instance.web-server.network_interface.0.nat_ip_address
}
