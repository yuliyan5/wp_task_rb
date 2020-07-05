#!/bin/bash
apt update
apt install ansible -y
apt install php7.2-mysql -y
apt install awscli -y

#https://github.com/ansible/ansible/issues/31617
export HOME=/root


ansible-galaxy install idealista.mysql_role

aws s3 cp s3://rb-wp-ansible-bucket/db-playbook.yml .

ansible-playbook --connection=local --inventory 127.0.0.1, db-playbook.yml


aws s3 cp s3://rb-wp-ansible-bucket/mysql_optimize.sh ~
chmod 700 ~/mysql_optimize.sh

echo "0 23 * * 0 root /root/mysql_optimize.sh" >> /etc/crontab

