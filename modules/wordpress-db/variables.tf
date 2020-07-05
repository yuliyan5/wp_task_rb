variable "wp_instance_security_group_id" {}


variable "env" {
  description = "env"
}
variable "image_id" {
  description = "ami id"
}
variable "instance_type" {
  description = "instance type"
}
variable "key_name" {
  description = "ssh key for instances"
}
variable "config_bucket" {
  description = "config_bucket"
}

#variable "security_groups_alb" {
#  description = "security_groups_alb"
#}
variable "vpc_private_subnets" {
  description = " "
}
#variable "vpc_public_subnets" {
#  description = " "
#}
variable "bastion_sg" {
  description = " "
}


variable "vpc_id" {
  description = "vpc_id"
}



#variable "wp_url" {
#  description = "url for wp site"
#}