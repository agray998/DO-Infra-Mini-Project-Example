resource "aws_subnet" "project_sub" {
  count                   = 2
  vpc_id                  = var.vpc_id
  cidr_block              = "${var.cidr_prefix}.${count.index}.0/24"
  availability_zone       = var.subnet_az
  map_public_ip_on_launch = true
  tags                    = {
    Name = "Project Subnet-${count.index}"
  }
}

resource "aws_route_table_association" "project_rta" {
  count          = 2
  subnet_id      = aws_subnet.project_sub[count.index].id
  route_table_id = var.rt_id
}
