variable "application_name" {
  description = "application_name"
}

variable "env" {
  description = "env"
}
variable "image_id" {
  description = "ami id"
}
variable "key_name" {
  description = "ssh key for instances"
}

#variable "security_groups_alb" {
#  description = "security_groups_alb"
#}
variable "vpc_private_subnets" {
  description = " "
}
variable "vpc_public_subnets" {
  description = " "
}
variable "bastion_sg" {
  description = " "
}

/*
variable "subnets_alb" {
  description = "subnets_alb"
}
*/
variable "vpc_id" {
  description = "vpc_id"
}
variable "config_bucket" {
  description = "config_bucket"
}
variable "module_depends_on" {
  description = ""
}

#variable "subnet1-private" {
#  description = "subnet1-private"
#}
#
#variable "subnet2-private" {
#    description = "subnet2-private"
#}
#
#variable "subnet1-public" {
#  description = "subnet1-public"
#}
#
#variable "subnet2-public" {
#    description = "subnet2-public"
#}

/*
variable "subnet3-private" {
    description = "subnet3-private"
}
*/
variable "az-a" {
  description = "AZ A"
  default = "eu-central-1a"
}

variable "az-b" {
  description = "AZ B"
  default = "eu-central-1b"
}

variable "az-c" {
  default = "eu-central-1c"
}

variable "instance_type" {
  description = "EC2 instance type"
  }

variable "desired_capacity" {
  description = "desired_capacity"
}

variable "min_size" {
  description = "min_size"
}


variable "max_size" {
  description = "max_size"
}

variable "health_check_path" {
  default = "/"
}

variable "certificate_arn" {
  description = "Certificate ARN"
}
#variable "wp_url" {
#  description = "url for wp site"
#}

variable "enabled_metrics" {
  description = "A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances"
  type        = list(string)
  default = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}

