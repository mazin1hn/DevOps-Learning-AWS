#!/bin/bash 

yum update -y 
yum install -y httpd 

systemctl start httpd 
systemctl enable httpd 

echo “<h1>Hello Mazin from 1st EC2!<h1/>” > /var/www/html/index.html
