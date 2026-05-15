resource "aws_subnet" "project_sub" {
  vpc_id                  = var.vpc_id
  cidr_block              = "${var.cidr_prefix}/24"
  availability_zone       = var.subnet_az
  map_public_ip_on_launch = true
  tags                    = {
    Name = var.subnet_name
  }
}

resource "aws_route_table_association" "project_rta" {
  subnet_id      = aws_subnet.project_sub.id
  route_table_id = var.rt_id
}
