environment = "staging"
application_name = "wp-blog"
image_id = "ami-00f69856ea899baec"
instance_type = "t3.micro"
key_name = "yuli" 
region = "eu-central-1"

#ASG
desired_capacity = "2"
min_size         = "2"
max_size         = "2"
#add az list

#ALB
certificate_arn = "arn:aws:acm:eu-central-1:141011379478:certificate/fbc71912-184e-4c83-be38-f20dfbd3f3d2"
health_check_path = "/"

#Route53
zone_id = "Z04677193KJMJR175911T"

#WP
wp_url = "ultimatelinuxblog.tk"

#S3
config_bucket_name = "rb-wp-ansible-bucket"
