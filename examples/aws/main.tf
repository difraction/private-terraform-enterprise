terraform {
  required_version = ">= 0.10.3"
}

provider "aws" {
  region = "${var.aws_region}"
}

data "aws_route53_zone" "hashidemos" {
  name = "${var.route53_zone}"
}

module "pes" {
  source                 = "pes/"
  namespace              = "${var.namespace}"
  aws_instance_ami       = "${var.aws_instance_ami}"
  aws_instance_type      = "${var.aws_instance_type}"
  ssh_key_name           = "${var.ssh_key_name}"
  subnet_ids             = ["${split(",", var.subnet_ids)}"]
  vpc_security_group_ids = "${var.security_group_id}"
  hashidemos_zone_id     = "${data.aws_route53_zone.hashidemos.zone_id}"
  ssl_certificate_id     = "${var.ssl_certificate_id}"
  database_pwd           = "${var.database_password}"
  owner                  = "${var.owner}"
  ttl                    = "${var.ttl}"
}
