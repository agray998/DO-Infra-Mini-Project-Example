output "subnet_ids" {
  value = [ for subnet in aws_subnet.project_sub : subnet.id ]
}
