resource "aws_instance" "ec2_instance" {
    ami               = var.ami_id
    instance_type     = "t3.micro"
    key_name          = "demo-11-05-2026"
    tags = {
      Name = var.instance_name
      Role = var.instance_role
    }


    network_interface {
      device_index         = 0
      network_interface_id = aws_network_interface.instance_nic.id
    }
}

resource "aws_network_interface" "instance_nic" {
  subnet_id       = var.subnet_id
  security_groups = [var.sg_id]
}
