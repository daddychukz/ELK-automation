output "public_dns" {
  value = aws_instance.elk_node.*.public_dns
}

output "ssh_key_path" {
  value = local_file.elk_key_file.filename
}