#!/bin/bash
apt update
apt install ansible -y
apt install php7.2-mysql -y
apt install awscli -y

ansible-galaxy install idealista.mysql_role

aws s3 cp s3://rb-wp-ansible-bucket/db-playbook.yml .

ansible-playbook --connection=local --inventory 127.0.0.1, db-playbook.yml
