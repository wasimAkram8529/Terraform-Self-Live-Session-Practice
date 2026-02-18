data "aws_availability_zones" "az" {
  state = "available"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}


resource "aws_subnet" "subnet" {
  count = 2
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet("10.0.0.0/16", 2, count.index)
  availability_zone = data.aws_availability_zones.az.names[count.index]
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  
  route {
    gateway_id = aws_internet_gateway.ig.id
    cidr_block = "0.0.0.0/0"
  }
}