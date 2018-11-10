variable "namespace" {}
variable "aws_instance_ami" {}
variable "aws_instance_type" {}
variable "ssh_key_name" {}
variable "subnet_ids" {
  type = "list"
}
variable "vpc_security_group_ids" {}
variable "hashidemos_zone_id" {}
variable "ssl_certificate_id" {}
variable "database_pwd" {}
variable "owner" {}
variable "ttl" {}
