#!/bin/bash
apt update
apt install ansible -y
apt install php7.2-mysql -y
apt install awscli -y

ansible-galaxy install oefenweb.wordpress
ansible-galaxy install mrlesmithjr.apache2

aws s3 cp s3://rb-wp-ansible-bucket/ec2-playbook.yml .

ansible-playbook --connection=local --inventory 127.0.0.1, ec2-playbook.yml

aws s3 cp s3://rb-wp-ansible-bucket/index.html .
/bin/cp -f index.html /var/www/html/index.html