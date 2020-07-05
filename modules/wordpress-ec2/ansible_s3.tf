
data "aws_s3_bucket" "config" {
  bucket =  var.config_bucket
}




resource "aws_s3_bucket_object" "ansible-playbook-db" {
  bucket = data.aws_s3_bucket.config.id
  key    = "ec2-playbook.yml"
  source = "./playbooks/ec2-playbook.yml"

}