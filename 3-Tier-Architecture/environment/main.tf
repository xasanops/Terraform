
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
  #[Public Subnets]
  cidr_public_subnet_az1 = var.cidr_public_subnet_az1
  cidr_public_subnet_az2 = var.cidr_public_subnet_az2
  #[Private Subnets]
  cidr_private_subnet_az1 = var.cidr_private_subnet_az1
  cidr_private_subnet_az2 = var.cidr_private_subnet_az2
  #[Database Subnets]
  cidr_database_subnet_az1 = var.cidr_database_subnet_az1
  cidr_database_subnet_az2 = var.cidr_database_subnet_az2
}

#[Retrieve VPC ID of Child Module]
output "vpc_id" {
  value = module.vpc.vpc_id
}
