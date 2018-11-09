#------------------------------------------------------------------------------
# production external-services ptfe resources
#------------------------------------------------------------------------------

locals {
  namespace = "${var.namespace}"
}

resource "aws_instance" "pes" {
  count                  = 1
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

resource "aws_rds_cluster" "pes" {
  cluster_identifier      = "${local.namespace}-cluster"
  engine                  = "aurora-postgresql"
  engine_version          = "9.6.8"
  database_name           = "ptfe"
  master_username         = "ptfe"
  master_password         = "${var.database_pwd}"
  db_subnet_group_name    = "${aws_db_subnet_group.pes.id}"
  vpc_security_group_ids  = ["${var.security_group_id}"]
  final_snapshot_identifier = "${local.namespace}-final-snapshot"
}

resource "aws_rds_cluster_instance" "pes" {
  count              = 1
  identifier         = "${local.namespace}-db-instance"
  cluster_identifier = "${aws_rds_cluster.pes.id}"
  instance_class     = "db.r4.large"
  engine                  = "aurora-postgresql"
  engine_version          = "9.6.8"
  db_subnet_group_name = "${aws_db_subnet_group.pes.id}"
}
