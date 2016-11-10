#!/bin/bash
cat << END > /etc/yum.repos.d/nginx.repo
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/6/\$basearch/
gpgcheck=0
enabled=1
END

yum -y update
yum -y install nginx

service nginx start
chkconfig nginx on

echo "<pre>$(hostname)</pre>" > /usr/share/nginx/html/index.html
