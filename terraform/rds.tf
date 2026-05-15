resource "aws_db_instance" "project_db" {
  allocated_storage    = 10
  db_name              = "projectdb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = var.rds_pass
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
