module "vpc" {
  source = "./modules/vpc"

  vpc_cidr    = "10.0.0.0/16"
  environment = var.environment
  subnet_cidr = "10.0.0.0/24"
}