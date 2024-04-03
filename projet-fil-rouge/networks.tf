# Create VPC
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
}

# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
}

# Create Public Subnets
resource "aws_subnet" "public_subnet_1" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-east-1c"
}

resource "aws_subnet" "public_subnet_2" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.2.0/24"
    availability_zone       = "us-east-1b"
}

# Create Private Subnets
resource "aws_subnet" "private_subnet_1" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.3.0/24"
    availability_zone       = "us-east-1c"
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.4.0/24"
    availability_zone       = "us-east-1b"
}

# Create a route table for public subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

# Associate the route table with public_subnet_1
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

# Associate the route table with public_subnet_2
resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}