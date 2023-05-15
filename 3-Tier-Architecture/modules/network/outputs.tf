
output "vpc_id" {
  value = aws_vpc.main.id
}

output "internet_gateway" {
  value = aws_internet_gateway.main
}

output "nat_gateway" {
  value = aws_nat_gateway.main
}
output "public_subnet_id" {
  value = aws_subnet.public.*.id
}

output "private_subnet_id" {
  value = aws_subnet.private.*.id
}

output "private_subnet_database_id" {
  value = aws_subnet.db.*.id
}

output "rds_subnet_group_id" {
  value = aws_db_subnet_group.rds.*.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.rds.*.name
}
