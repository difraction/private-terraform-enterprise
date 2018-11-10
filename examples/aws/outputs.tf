output "database_password" {
  value = "${var.database_password}"
}

output "fqdn" {
  value = "${module.pes.fqdn}"
}

output "database_endpoint" {
   value = "${module.pes.database_endpoint}"
}

output "database_port" {
   value = "${module.pes.database_port}"
}
