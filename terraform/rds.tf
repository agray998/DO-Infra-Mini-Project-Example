resource "aws_db_subnet_group" "project_rds_subnet_group" {
  name       = "project_rds"
  subnet_ids = [module.public_subnets.subnet_ids[1]]
}

resource "aws_db_instance" "project_db" {
  allocated_storage    = 10
  db_name              = "projectdb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_subnet_group_name = "project_rds"
  vpc_security_group_ids = [aws_security_group.deploy.id]
  username             = "foo"
  password             = var.rds_pass
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
