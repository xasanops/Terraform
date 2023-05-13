#generic variables
aws_region  = "eu-west-2"
environment = "stage"

# #vpc variables
vpc_cidr = "10.0.0.0/16"
vpc_name = "vpc"

#availability zone variables
azs = ["eu-west-2a", "eu-west-2b"]

#public variables 
cidr_public_subnet_az1 = "10.0.0.0/24"
cidr_public_subnet_az2 = "10.0.1.0/24"

#private subnet variables 
cidr_private_subnet_az1 = "10.0.2.0/24"
cidr_private_subnet_az2 = "10.0.3.0/24"

#data variables
cidr_database_subnet_az1 = "10.0.4.0/24"
cidr_database_subnet_az2 = "10.0.5.0/24"
