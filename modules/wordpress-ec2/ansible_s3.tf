
data "aws_s3_bucket" "config" {
  bucket =  var.config_s3_bucket
}


resource "aws_s3_bucket_object" "ansible-playbook-ec2" {
  bucket = data.aws_s3_bucket.config.id
  key    = "ec2-playbook.yml"
  source = "./ec2-playbook.yml"

  depends_on = [local_file.ec2-playbook]

}

  resource "local_file" "ec2-playbook" {
    content     = data.template_file.ec2-playbook.rendered
    filename  = "./ec2-playbook.yml"
  }


data "template_file" "ec2-playbook" {
  template = "${file("${path.root}/playbooks/ec2-playbook.yml.tmpl")}"
  vars = {
    db_pass   = var.db_pass
    wp_url    = var.wp_url
    db_host   = var.db_host
  }
}