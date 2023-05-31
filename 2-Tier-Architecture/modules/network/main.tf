# -- CHILD NETWORK MODULE 🔑 --

#-- PUBLIC 🟩 🌍 --#

# Create VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.environment}-${var.vpc_name}"
  }
}

# Create Internet Gateway for Public Subnets
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-internet-gateway"
  }
}

# Availability Zones data source (data)
data "aws_availability_zones" "az" {
  state = "available"
}

# Create Public Subnets (Web Tier)
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidr)
  vpc_id                  = aws_vpc.main.id
  availability_zone       = data.aws_availability_zones.az.names[count.index]
  cidr_block              = element(var.public_subnet_cidr, count.index)
  map_public_ip_on_launch = true
  #   availability_zone       = element(var.azs, count.index)

  tags = {
    Name = "Public Subnet #${count.index + 1}"
  }
}

# Create Route Table for Public Subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "(${var.environment}): public-route-table"
  }
}

# Associate Route Table with Public Subnets 
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Create an EIP Address (EIP)
resource "aws_eip" "nat_gateway" {
  vpc = true
}

# Create a Nat Gateway for Public Subnet #2 
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public[1].id
}

#-- PRIVATE 🟦 🔐 --#

# Create Private Subnets for Application Tier
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  count             = length(var.private_subnet_cidr)
  availability_zone = data.aws_availability_zones.az.names[count.index]
  cidr_block        = element(var.private_subnet_cidr, count.index)
  tags = {
    Name = "Private Subnet #${count.index + 1}"
  }
}

# Create Route Table for Private Subnets
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
  tags = {
    Name = "(${var.environment}): private-route-table"
  }
}

# Associate Route Table with Private Subnets
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}


