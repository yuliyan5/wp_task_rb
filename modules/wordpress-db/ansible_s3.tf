resource "aws_s3_bucket" "rb-wp-ansible-bucket" {
  bucket = var.config_bucket
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = var.config_bucket
  }
}

resource "aws_s3_bucket_object" "ansible-playbook-wordpress-nginx" {
  bucket = aws_s3_bucket.rb-wp-ansible-bucket.id
  key    = "db-playbook.yml"
  source = "./playbooks/db-playbook.yml"

}