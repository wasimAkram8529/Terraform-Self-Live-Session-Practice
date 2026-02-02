data "aws_availability_zones" "az" {
  state = "available"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet" {
  count = 4
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet("10.0.0.0/16", 4, count.index)
  availability_zone = data.aws_availability_zones.az.names[count.index]
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rt_link" {
  route_table_id = aws_route_table.rt.id
  count = length(aws_subnet.subnet)
  subnet_id = aws_subnet.subnet[count.index].id
}



