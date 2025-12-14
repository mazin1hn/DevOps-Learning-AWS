#!/bin/bash

yum update -y
yum install -y httpd

systemctl start httpd
systemctl enable httpd 

echo "<h1>Hello Mazin this is the private EC2v1 from $(hostname -f)</h1>" > /var/www/html/index.html