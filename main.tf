module "vpc" {
  source = "./modules/vpc"

  name = "wp-blog"
  region = var.region
  key_name = var.key_name
  cidr_block = "10.0.0.0/16"
  private_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.3.0/24"]
  public_subnet_cidr_blocks = ["10.0.0.0/24", "10.0.2.0/24"]
  availability_zones = ["eu-central-1a", "eu-central-1b"]
  bastion_ami = "ami-1b316af0"
  bastion_ebs_optimized = true
  bastion_instance_type = "t3.nano"

  project = "wp-blog"
  environment = var.environment
}



module "wordpress-ec2" {
  source = "./modules/wordpress-ec2"
  env = var.environment
  application_name = var.application_name
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  #region = var.region
  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size
  certificate_arn = var.certificate_arn
  health_check_path = var.health_check_path
  vpc_id = module.vpc.id
  vpc_private_subnets = module.vpc.private_subnet_ids
  vpc_public_subnets = module.vpc.public_subnet_ids
  bastion_sg = module.vpc.bastion_security_group_id
  zone_id = var.zone_id
  config_bucket_name = var.config_bucket_name
  wp_url =var.wp_url
  config_s3_bucket = module.wordpress-db.config_s3_bucket
  db_pass = module.wordpress-db.db_pass
  db_host = module.wordpress-db.db_private_dns
 # module_depends_on = module.wordpress-db.db_private_dns

}


module "wordpress-db" {
  source = "./modules/wordpress-db"
  env = var.environment
  #application_name = var.application_name
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_id = module.vpc.id
  wp_instance_security_group_id = module.wordpress-ec2.wp_instance_security_group_id
  vpc_private_subnets = module.vpc.private_subnet_ids
  bastion_sg = module.vpc.bastion_security_group_id
  config_bucket_name = var.config_bucket_name

}



variable "max_size" {}
variable "min_size" {}
variable "desired_capacity" {}
variable "instance_type" {}
variable "key_name" {}
variable "environment" {}

variable "image_id" {}
variable "config_bucket_name" {}



variable "application_name" {}
variable "zone_id" {}
variable "certificate_arn" {}
variable "health_check_path" {}

variable "region" {}
variable "wp_url" {}

