output "db_private_dns" {
  value       = aws_instance.db.private_dns
  description = "Security group ID tied to wp instance"
}
output "config_s3_bucket" {
  value       = aws_s3_bucket.rb-wp-ansible-bucket.id
}
output "db_pass" {
  value       = aws_ssm_parameter.ssm_db_secret.value
  sensitive = true
}