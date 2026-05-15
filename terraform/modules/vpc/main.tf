resource "aws_vpc" "project_vpc" {
  cidr_block = "${var.cidr_prefix}/16"
  tags       = {
    Name = "Project VPC"
  }
}

resource "aws_internet_gateway" "project_gw" {
  vpc_id = aws_vpc.project_vpc.id
  tags   = {
    Name = "Project IGW"
  }
}

resource "aws_route_table" "project_rt" {
  vpc_id = aws_vpc.project_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.project_gw.id
    }

  route {
      ipv6_cidr_block = "::/0"
      gateway_id      = aws_internet_gateway.project_gw.id
    }
  tags = {
    Name = "Project RT"
  }
}
