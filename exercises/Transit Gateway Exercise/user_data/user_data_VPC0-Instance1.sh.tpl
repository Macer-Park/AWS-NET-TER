#!/bin/bash
hostnamectl --static set-hostname VPC0Instance1
yum -y update
yum install -y tcpdump squid
cat <<EOT> /etc/squid/squid.conf
http_port 3128
acl lab src 10.0.0.0/8
http_access allow lab
http_access deny all
EOT
systemctl start squid && systemctl enable squid
cat <<EOT> /home/ec2-user/list.txt
10.0.1.10
10.10.1.10
10.10.2.10
10.20.1.10
10.20.2.10
EOT
yum install httpd -y
systemctl start httpd && systemctl enable httpd
echo "<h1>TGW Lab - MgMt Server1</h1>" > /var/www/html/index.html
curl -o /home/ec2-user/pingall.sh https://raw.githubusercontent.com/Macer-Park/AWS-NET-TER/main/scripts/pingall.sh --silent
cp /home/ec2-user/pingall.sh /var/www/html/pingall.sh
cp /home/ec2-user/list.txt /var/www/html/list.txt
chmod +x /home/ec2-user/pingall.sh