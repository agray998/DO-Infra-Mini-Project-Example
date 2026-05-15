data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

module "public_subnets" {
  source = "modules/subnet"
  vpc_id = aws_vpc.project_vpc.id
  cidr_prefix = "10.0"
  rt_id = aws_route_table.project_rt.id
  subnet_count = 2
}

module "ci" {
  source = "modules/ec2"
  subnet_id = module.public_subnets.subnet_ids[0]
  sg_id = aws_security_group.ci.id
  ami_id = data.aws_ami.ubuntu.id
  instance_name = "Jenkins"
  instance_role = "ci"
  key_pair = "demo-11-05-2026"
}

module "deploy" {
  source = "modules/ec2"
  subnet_id = module.public_subnets.subnet_ids[1]
  sg_id = aws_security_group.deploy.id
  ami_id = data.aws_ami.ubuntu.id
  instance_name = "Deploy"
  instance_role = "appserver"
  key_pair = "demo-11-05-2026"
}
