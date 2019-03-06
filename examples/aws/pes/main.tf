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
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  key_name               = "${var.ssh_key_name}"
  iam_instance_profile   = "${aws_iam_instance_profile.ptfe.name}"

  root_block_device {
    volume_size = 80
    volume_type = "gp2"
  }

  tags {
    Name  = "${local.namespace}-instance-${count.index+1}"
    owner = "${var.owner}"
    TTL   = "${var.ttl}"
  }
}

resource "aws_route53_record" "pes" {
  zone_id = "${var.hashidemos_zone_id}"
  name    = "${local.namespace}.hashidemos.io."
  type    = "A"

  alias {
    name                   = "${aws_elb.ptfe.dns_name}"
    zone_id                = "${aws_elb.ptfe.zone_id}"
    evaluate_target_health = true
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
  vpc_security_group_ids  = ["${var.vpc_security_group_ids}"]
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

/*resource "aws_db_instance" "pes" {
  allocated_storage         = 10
  engine                    = "postgres"
  engine_version            = "9.4"
  instance_class            = "db.t2.medium"
  identifier                = "${local.namespace}-db-instance"
  name                      = "ptfe"
  storage_type              = "gp2"
  username                  = "ptfe"
  password                  = "${var.database_pwd}"
  db_subnet_group_name      = "${var.db_subnet_group_name}"
  vpc_security_group_ids    = ["${var.vpc_security_group_ids}"]
  final_snapshot_identifier = "${local.namespace}-db-instance-final-snapshot"
}*/

#------------------------------------------------------------------------------
# iam for ec2 to s3
#------------------------------------------------------------------------------

resource "aws_iam_role" "ptfe" {
  name = "${local.namespace}-iam_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ptfe" {
  name = "${local.namespace}-iam_instance_profile"
  role = "${aws_iam_role.ptfe.name}"
}

data "aws_iam_policy_document" "ptfe" {
  statement {
    sid    = "AllowS3"
    effect = "Allow"

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.pes.id}",
      "arn:aws:s3:::${aws_s3_bucket.pes.id}/*",
    ]

    actions = [
      "s3:*",
    ]
  }
}

resource "aws_iam_role_policy" "ptfe" {
  name   = "${local.namespace}-iam_role_policy"
  role   = "${aws_iam_role.ptfe.name}"
  policy = "${data.aws_iam_policy_document.ptfe.json}"
}

// Launch an ELB to run in front of the primary and standby PTFE servers.
resource "aws_elb" "ptfe" {
    name = "${local.namespace}-elb"
    instances = ["${aws_instance.pes.0.id}"]
    connection_draining = true
    connection_draining_timeout = 400
    subnets = ["${var.subnet_ids}"]
    security_groups = ["${var.vpc_security_group_ids}"]

    listener {
        instance_port = 443
        instance_protocol = "https"
        lb_port = 443
        lb_protocol = "https"
        ssl_certificate_id = "${var.ssl_certificate_id}"
    }

    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 3
        timeout = 5
        target = "HTTPS:443/_health_check"
        interval = 15
    }
}
