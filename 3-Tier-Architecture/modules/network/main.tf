# -- CHILD NETWORK MODULE 🔑 --

# Create VPC ✅
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.environment}-${var.vpc_name}"
  }
}

# Create Public Subnet Az1 for Web Tier ✅
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr_public_subnet_az1
  availability_zone       = var.azs[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet - 1"
  }
}

# Create Public Subnet Az2 for Web Tier ✅
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.cidr_public_subnet_az2
  availability_zone       = var.azs[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet - 2"
  }
}

# Create Internet Gateway for Public Subnets ✅
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment}-vpc"
  }
}

# Create Internet Gateway for Public Subnets ✅
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
resource "aws_route_table_association" "public_az1" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_az2" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public.id
}

# Create Private Subnet Az1 for Application Tier ✅
resource "aws_subnet" "private_subnet_az1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr_private_subnet_az1
  availability_zone = var.azs[0]

  tags = {
    Name = "Private Subnet - 1"

  }
}
# Create Private Subnet Az2 for Application Tier ✅
resource "aws_subnet" "private_subnet_az2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr_private_subnet_az2
  availability_zone = var.azs[1]
  tags = {
    Name = "Private Subnet - 2"
  }
}

# Create Private Subnet Az1 for Database Tier ✅
resource "aws_subnet" "db_az1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr_database_subnet_az1
  availability_zone = var.azs[0]

  tags = {
    Name = "Database Subnet - 1"

  }
}

# Create Private Subnet Az2 for Database Tier ✅
resource "aws_subnet" "db_az2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr_database_subnet_az2
  availability_zone = var.azs[1]
  tags = {
    Name = "Database Subnet - 2"
  }
}
