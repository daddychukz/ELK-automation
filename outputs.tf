output "instance_ips" {
  value = module.elk_nodes.ip_addresses
}

output "kibana" {
  value = module.elk_nodes.kibana
}

output "ssh_key_path" {
  value = module.elk_nodes.ssh_key_path
}