output "ip_addresses" {
  value = aws_instance.elk_node.*.public_ip
}

output "ssh_key_path" {
  value = local_file.elk_key_file.filename
}