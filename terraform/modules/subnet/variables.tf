variable "vpc_id" {}

variable "cidr_prefix" {}

variable "rt_id" {}

variable "subnet_count" {
  default = 3
}

variable "zones" {
  default = ["a", "b", "c"]
}
