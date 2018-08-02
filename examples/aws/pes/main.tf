#------------------------------------------------------------------------------
# production external-services ptfe resources
#------------------------------------------------------------------------------

locals {
  namespace = "${var.namespace}-pes"
}

resource "aws_instance" "pes" {
  count                  = 2
  ami                    = "${var.aws_instance_ami}"
  instance_type          = "${var.aws_instance_type}"
  subnet_id              = "${element(var.subnet_ids, count.index)}"
  vpc_security_group_ids = ["${var.security_group_id}"]
  key_name               = "${var.ssh_key_name}"

  root_block_device {
    volume_size = 50
    volume_type = "gp2"
  }

  ebs_block_device {
    device_name = "${var.ebs_device_name}"
    volume_type = "gp2"
    volume_size = 100
    delete_on_termination = false
  }

  tags {
    Name  = "${local.namespace}-instance-${count.index+1}"
  }
}

resource "aws_eip" "pes" {
  instance = "${aws_instance.pes.0.id}"
  vpc      = true
}

resource "aws_s3_bucket" "pes" {
  bucket = "${local.namespace}-s3-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags {
    Name = "${local.namespace}-s3-bucket"
  }
}

resource "aws_db_subnet_group" "pes" {
  name_prefix = "${var.namespace}"
  description = "${var.namespace}-db-subnet-group"
  subnet_ids  = ["${var.subnet_ids}"]
}

resource "aws_db_instance" "pes" {
  allocated_storage         = 10
  engine                    = "postgres"
  engine_version            = "9.4"
  instance_class            = "db.t2.medium"
  identifier = "${local.namespace}-db-instance"
  name                      = "ptfe"
  storage_type              = "gp2"
  username                  = "ptfe"
  password                  = "${var.database_pwd}"
  db_subnet_group_name = "${aws_db_subnet_group.pes.id}"
  vpc_security_group_ids    = ["${var.security_group_id}"]
  final_snapshot_identifier = "${local.namespace}-db-instance-final-snapshot"
}
