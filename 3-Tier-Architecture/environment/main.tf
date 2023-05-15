
module "vpc" {
  source = "../modules/network"
  # -- <Input variables> = <Variable References> -- 
  #[Generic]
  environment = var.environment
  #[VPC]
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  #[Azs]
  azs = var.azs
  #[Public Web Tier]
  cidr_public_subnet = var.cidr_public_subnet
  #[Private App Tier]
  cidr_private_subnet = var.cidr_private_subnet
  #[Database Tier]
  cidr_db_subnet = var.cidr_db_subnet
  db_subnet_group = true
}

#[Retrieve VPC ID of Child Module]
output "vpc_id" {
  value = module.vpc.vpc_id
}
