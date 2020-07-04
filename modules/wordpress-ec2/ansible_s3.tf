resource "aws_s3_bucket" "rb-wp-ansible-bucket" {
  bucket = "rb-wp-ansible-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "rb-wp-ansible-bucket"
  }
}

resource "aws_s3_bucket_object" "ansible-playbook-wordpress-nginx" {
  bucket = aws_s3_bucket.rb-wp-ansible-bucket.id
  key    = "ansible-playbook-wordpress-nginx.tar"
  source = "./configuration/ansible-playbook-wordpress-nginx.tar"

}