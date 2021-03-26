output "instance_ips" {
  value = module.elk_nodes.ip_addresses
}

output "ssh_key_path" {
  value = module.elk_nodes.ssh_key_path
}