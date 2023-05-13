# generic variables ✅
variable "environment" {
  description = "Testing environment"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}
#vpc variables
variable "vpc_cidr" {
  description = "name of my vpc"
  type        = string
}

variable "vpc_name" {
  description = "vpc cidr block"
  type        = string
}

#availability zone variable
variable "azs" {
  description = "availability zones for region"
  type        = list(string)
}

#public subnet variables 
variable "cidr_public_subnet_az1" {
  description = "public subnet CIDR values - az1"
  type        = string
}
variable "cidr_public_subnet_az2" {
  description = "public subnet CIDR values - az2"
  type        = string
}

#private subnet variables 
variable "cidr_private_subnet_az1" {
  description = "private subnet CIDR values - az1"
  type        = string
}
variable "cidr_private_subnet_az2" {
  description = "private subnet CIDR values - az2"
  type        = string
}

#database subnet variables
variable "cidr_database_subnet_az1" {
  description = "private database subnet CIDR values - az1"
  type        = string

}
variable "cidr_database_subnet_az2" {
  description = "private database subnet CIDR values - az2"
  type        = string
}
