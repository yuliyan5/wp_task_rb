module "vpc" {
  source = "./modules/vpc"

  name = "wp-blog"
  region = "eu-central-1"
  key_name = "yuli"
  cidr_block = "10.0.0.0/16"
  private_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.3.0/24"]
  public_subnet_cidr_blocks = ["10.0.0.0/24", "10.0.2.0/24"]
  availability_zones = ["eu-central-1a", "eu-central-1b"]
  bastion_ami = "ami-1b316af0"
  bastion_ebs_optimized = true
  bastion_instance_type = "t3.nano"

  project = "wp-blog"
  environment = "staging"
}
