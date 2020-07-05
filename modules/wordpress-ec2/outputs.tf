output "wp_instance_security_group_id" {
  value       = aws_security_group.sg_main.id
  description = "Security group ID tied to wp instance"
}