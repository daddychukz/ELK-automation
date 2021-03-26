resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = "elk-key"
  public_key = tls_private_key.rsa_key.public_key_openssh
}

resource "local_file" "elk_key_file" {
  content  = tls_private_key.rsa_key.private_key_pem
  filename = local.key_file

  provisioner "local-exec" {
    command = "chmod 400 ${local.key_file}"
  }
}

locals {
  key_file = pathexpand("~/.ssh/elk-key.pem")
}

data "aws_ssm_parameter" "linux_latest_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "elk_node" {
  count         = var.node_count
  ami           = data.aws_ssm_parameter.linux_latest_ami.value
  instance_type = var.instance_type
  key_name      = "elk-key"

  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = element(var.node_name, count.index)
  }
}
