# -- CHILD NETWORK MODULE 🔑 --

# Create VPC ✅
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.environment}-${var.vpc_name}"
  }
}

# Create Public Subnets for Web Tier ✅
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  availability_zone       = element(var.azs, count.index)
  cidr_block              = element(var.cidr_public_subnet, count.index)
  count                   = length(var.cidr_public_subnet)
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet #${count.index + 1}"
  }
}

# Create Internet Gateway for Public Subnets ✅
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-igw"
  }
}

# Create Route Table for Public Subnets ✅
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "Route Table for Public Subnets"
  }
}


# Associate Route Table with Public Subnets ✅
resource "aws_route_table_association" "public" {
  count          = length(var.cidr_public_subnet)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

# Create an EIP Address for NAT Gateway in order to have a fixed public IP address ✅
resource "aws_eip" "nat_gateway" {
  vpc = true
}

# Create a Nat Gateway for private subnets ✅
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public[1].id
}

# Create Private Subnets for Application Tier ✅
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  count             = length(var.cidr_public_subnet)
  cidr_block        = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Private Subnet #${count.index + 1}"
  }
}

# Create Route Table for Private Subnets ✅
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
  tags = {
    Name = "Route Table for Private Subnets"
  }
}

# Associate Route Table with Private Subnets ✅
resource "aws_route_table_association" "private" {
  count          = length(var.cidr_public_subnet)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}

# Create Private Subnet for Database Tier ✅
resource "aws_subnet" "db" {
  vpc_id                  = aws_vpc.main.id
  count                   = length(var.cidr_db_subnet)
  cidr_block              = element(var.cidr_db_subnet, count.index)
  map_public_ip_on_launch = false
  availability_zone       = element(var.azs, count.index)
  tags = {
    Name = "Database Subnet #${count.index + 1}"
  }
}

# Create Database Subnet Group ✅
resource "aws_db_subnet_group" "rds" {
  count      = var.db_subnet_group == true ? 1 : 0
  name       = "main_rds_subnet_group"
  subnet_ids = aws_subnet.db[*].id
}



