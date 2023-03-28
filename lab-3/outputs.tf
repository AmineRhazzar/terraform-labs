output "database_ipv4_address" {
  value = aws_db_instance.ps-db.address
}

output "database_domaine" {
  value = aws_db_instance.ps-db.domain
}

output "debug_db_username" {
  value = var.db_username
}

output "debug_db_password" {
  value = var.db_password
}
