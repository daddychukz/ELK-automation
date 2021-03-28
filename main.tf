module "vpc" {
  source = "./modules/vpc"

  vpc_cidr          = "10.0.0.0/16"
  availability_zone = "us-east-1a"
  environment       = var.environment
  subnet_cidr       = "10.0.0.0/24"
}

module "elk_nodes" {
  source = "./modules/linux-server"

  node_count         = length(local.nodes)
  subnet_id          = module.vpc.vpc_subnet_id
  node_name          = local.nodes
  instance_type      = var.instance_type
  security_group_ids = [module.vpc.security_group_id]
}