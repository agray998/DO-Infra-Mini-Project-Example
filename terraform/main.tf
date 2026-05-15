module "PublicSubnets" {
  source = "modules/subnet"
  vpc_id = aws_vpc.project_vpc.id
  cidr_prefix = "10.0"
  rt_id = aws_route_table.project_rt.id
  subnet_count = 2
}

module "CI" {}

module "Deploy" {}
