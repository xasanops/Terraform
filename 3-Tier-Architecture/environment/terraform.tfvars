# Stage testing inputs
aws_region          = "eu-west-2"
environment         = "stage"
vpc_name            = "vpc"
vpc_cidr            = "10.0.0.0/16"
azs                 = ["eu-west-2a", "eu-west-2b"]
cidr_public_subnet  = ["10.0.0.0/24", "10.0.1.0/24"]
cidr_private_subnet = ["10.0.2.0/24", "10.0.3.0/24"]
cidr_db_subnet      = ["10.0.4.0/24", "10.0.5.0/24"]

