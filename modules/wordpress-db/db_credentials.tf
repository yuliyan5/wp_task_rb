resource "random_password" "db_pass" {
  length            = 24
  special           = true
  min_special       = 5
  #override_special  = "!#$%^&*()-_=+[]{}<>:?"
  override_special  = "!"
  keepers           = {
    pass_version  = 1
  }
}


resource "aws_ssm_parameter" "ssm_db_secret" {
  name        = "/wp_db/db_pass"
  description = "DB Pass"
  type        = "SecureString"
  value       = random_password.db_pass.result

  tags = {
    Name        = "wp-db-secret"
  }
}

data "aws_ssm_parameter" "ssm_db_secret" {
  name     = aws_ssm_parameter.ssm_db_secret.name

  depends_on = [aws_ssm_parameter.ssm_db_secret]
}