output "fqdn" {
  value = "${aws_route53_record.pes.fqdn}"
}

output "database_endpoint" {
   value = "${aws_rds_cluster.pes.endpoint}"
}

output "database_port" {
   value = "${aws_rds_cluster.pes.port}"
}
