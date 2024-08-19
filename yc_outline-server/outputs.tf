output "external_ip4_shadowbox" {
  description = "The Shadowbox external IP address"
  value       = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}
