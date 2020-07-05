resource "aws_s3_bucket" "rb-wp-ansible-bucket" {
  bucket = var.config_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = var.config_bucket_name
  }
}

#resource "aws_s3_bucket_object" "ansible-playbook-wordpress-nginx" {
#  bucket = aws_s3_bucket.rb-wp-ansible-bucket.id
#  key    = "db-playbook.yml"
#  source = "./playbooks/db-playbook.yml"
#
#}
resource "aws_s3_bucket_object" "ansible-playbook-wordpress-nginx" {
  bucket = aws_s3_bucket.rb-wp-ansible-bucket.id
  key    = "db-playbook.yml"
  #source = "${file(data.template_file.db-playbook.rendered)}"
  source = "./db-playbook.yml"

  depends_on = [local_file.db-playbook]

}

  resource "local_file" "db-playbook" {
    content     = data.template_file.db-playbook.rendered
    filename  = "./db-playbook.yml"
  }


data "template_file" "db-playbook" {
  template = "${file("${path.root}/playbooks/db-playbook.yml.tmpl")}"
  vars = {
    db_pass   = data.aws_ssm_parameter.ssm_db_secret.value
  }
}

### mysql optimize script

resource "aws_s3_bucket_object" "mysql_optimize_script" {
  bucket = aws_s3_bucket.rb-wp-ansible-bucket.id
  key    = "mysql_optimize.sh"
  #source = "${file(data.template_file.db-playbook.rendered)}"
  source = "./configuration/mysql_optimize.sh"


}