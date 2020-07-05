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


variable "vpc_private_subnets" {
  description = " "
}
variable "vpc_public_subnets" {
  description = " "
}
variable "bastion_sg" {
  description = " "
}


variable "vpc_id" {
  description = "vpc_id"
}
variable "config_bucket_name" {
  description = "config_bucket"
}
#variable "module_depends_on" {
#  description = ""
#}

variable "db_pass" {
  description = ""
}
variable "db_host" {
  description = ""
}

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
variable "wp_url" {
  description = "url for wp site"
}
variable "zone_id" {
  description = "route 53 zone id"
}

variable "config_s3_bucket" {
  description = "output for config bucket id"
}

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

