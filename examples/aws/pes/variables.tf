variable "namespace" {}
variable "aws_instance_ami" {}
variable "aws_instance_type" {}
variable "ebs_device_name" {}
variable "ssh_key_name" {}
variable "subnet_ids" {
  type = "list"
}
variable "security_group_id" {}
variable "database_pwd" {}
