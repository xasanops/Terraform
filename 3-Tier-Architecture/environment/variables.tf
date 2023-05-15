#generic variables ✅
variable "aws_region" {
  description = "AWS Region"
  type        = string
}
variable "environment" {
  description = "Testing environment"
  type        = string
}

#aws_vpc variables ✅
variable "vpc_name" {
  description = "name of my vpc"
  type        = string
  default     = "main_vpc"
}
variable "vpc_cidr" {
  description = "vpc cidr block"
  type        = string
}

#availability zone variable ✅
variable "azs" {
  description = "availability zones"
  type        = list(string)
}

#aws_subnet public & private variables ✅
variable "cidr_public_subnet" {
  description = "public subnet CIDR values"
  type        = list(string)
}
variable "cidr_private_subnet" {
  description = "private subnet CIDR values"
  type        = list(string)
}

#aws_subnet database subnet variables ✅
variable "cidr_db_subnet" {
  description = "private database subnet CIDR values"
  type        = list(string)
}

