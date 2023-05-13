# Output for VPC id✅
output "vpc_id" {
  value = aws_vpc.main.id
}

# Outputs for Public Subnets ✅
output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2_id" {
  value = aws_subnet.public_subnet_az2
}

# Output for Internet Gateway ✅
output "internet_gateway" {
  value = aws_internet_gateway.main
}

# Outputs for Private Subnets ✅
output "private_subnet_az1_id" {
  value = aws_subnet.private_subnet_az1.id
}

output "private_subnet_az2_id" {
  value = aws_subnet.private_subnet_az2.id
}

# Outputs for Database Subnets ✅
output "database_subnet_az1_id" {
  value = aws_subnet.db_az1.id
}

output "database_subnet_az2_id" {
  value = aws_subnet.db_az2.id
}
