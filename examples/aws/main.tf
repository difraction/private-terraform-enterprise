terraform {
  required_version = ">= 0.11.7"
}

provider "aws" {
  region = "${var.aws_region}"
}

# production external-services ptfe
module "pes" {
  source                 = "pes/"
  namespace              = "${var.namespace}"
  aws_instance_ami       = "${var.aws_instance_ami}"
  aws_instance_type      = "${var.aws_instance_type}"
  ebs_device_name        = "${var.ebs_device_name}"
  subnet_ids             = "${var.subnet_ids}"
  security_group_id = "${var.security_group_id}"
  ssh_key_name           = "${var.ssh_key_name}"
  database_pwd           = "${var.database_password}"
}
