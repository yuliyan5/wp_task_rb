#!/bin/bash

for table in $(mysql -u root  -D wordpress -Bse "show tables"); do mysql -u root  -D wordpress -Bse "analyze table $table"; done  > db-analyze-$(date +%Y%d).log &&
aws s3 cp db-analyze-$(date +%Y%d).log s3://rb-wp-ansible-bucket/db-analyze-$(date +%Y%d).log
mysqlcheck -u root -o wordpress