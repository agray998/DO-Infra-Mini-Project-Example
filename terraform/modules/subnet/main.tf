resource "aws_subnet" "project_sub" {
  count                   = var.subnet_count
  vpc_id                  = var.vpc_id
  cidr_block              = "${var.cidr_prefix}.${count.index}.0/24"
  availability_zone       = "eu-west-2${var.zones[count.index]}"
  map_public_ip_on_launch = true
  tags                    = {
    Name = "Project Subnet-${count.index}"
  }
}

resource "aws_route_table_association" "project_rta" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.project_sub[count.index].id
  route_table_id = var.rt_id
}
