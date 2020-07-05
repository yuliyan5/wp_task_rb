# wp_task_rb

After spinnig up this example config it can be reached at
https://ultimatelinuxblog.tk

Spin up Worpress installation on two instances with one separate mysql DB server

# Prerequsites for new user/account:
Configured awscli or AWS* enviroment variables

### Also following resources are not managed by terraform

- s3 bucket for backend
- ssh keys for ec2
- dynamodb table for state lock
- route53 hosted zone
- aws domain certificate

Third party code:

TF modules:
https://github.com/azavea/terraform-aws-vpc

Ansible Galaxy Roles:
oefenweb.wordpress - https://github.com/Oefenweb/ansible-wordpress
idealista.mysql_role - https://github.com/idealista/mysql_role
mrlesmithjr.apache2 - https://github.com/mrlesmithjr/ansible-apache2

### Apply code
terraform init && terraform apply -var-file vars/general.tfvars 

### Destroy Infrastructure
terraform destroy

### Components

- New VPC with jump host with ssh listening on port 2222 
- 2 public and 2 private subnets across two availability zones
- Module "wordpress-ec2" - 2 Wordpress isntances in autoscaling gruop deployed in separate private subnets across two availability zones
- Module "wordpress-db" - 1 DB instance exposed only for the WP instances
- Requests are managed by an Application Load balancer with enabled forwarding to https 443
- After the instances are up, via the user_data they are provisioned with Ansible which uses a playbook according to the instance type
- Playbooks are being templated to have the DB credentials and WP Url dynamic to keep configurations easy to maintain
- DB password is generated with the "random" tf provider and then preserved in aws parameter store
- playbooks and wp content are uploaded to s3 and then used by the instances which have access via an attached instance profile
- DB user data sets a cronjob for wordpress DB Optimize
- Pre-optimize table status is logged and uploaded to s3-bucket for convinient access


### Check output from userdata 
```root@ip-10-0-3-7:~# cat /var/log/cloud-init-output.log

