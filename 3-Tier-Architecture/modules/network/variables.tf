#generic variables ✅
variable "environment" {}

#aws_vpc variables ✅
variable "vpc_name" {}
variable "vpc_cidr" {}

#availability zone variable ✅
variable "azs" {}

#aws_subnet public & private variables ✅
variable "cidr_public_subnet" {}
variable "cidr_private_subnet" {}

#aws_subnet database subnet variables ✅
variable "cidr_db_subnet" {}
variable "db_subnet_group" {}
