output "db_private_dns" {
  value       = aws_instance.db.private_dns
  description = "Security group ID tied to wp instance"
}