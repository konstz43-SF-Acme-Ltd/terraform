output "external_ip4_ubuntu1" {
  description = "The 1st VM's external IP address"
  value       = module.ubuntu1.external_ip4
}

output "external_ip4_ubuntu2" {
  description = "The 2nd VM's external IP address"
  value       = module.ubuntu2.external_ip4
}
