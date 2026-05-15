resource "aws_vpc" "project_vpc" {
  cidr_block = "${var.cidr_prefix}.0.0/16"
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

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.project_vpc.id

  ingress = [
    {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "egress"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "Project SG"
  }
}
