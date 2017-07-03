#!/bin/bash

# Install dependencies and some basic system tools
yum install -y epel-release
yum install -y nano vim net-tools telnet nginx httpd-tools
yum install -y java-1.8.0-openjdk

# Configure SELinux
setsebool -P httpd_can_network_connect 1
setenforce 0

# Import ELK gpg key for yum
rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch

# Copy yum .repo files
cp /tmp/config/yum/* /etc/yum.repos.d/

# Install ELK stack
yum install -y elasticsearch
yum install -y kibana
yum install -y logstash

# Copy over application config
cp -f /tmp/config/nginx/nginx.conf                /etc/nginx/nginx.conf
cp -f /tmp/config/nginx/kibana.conf               /etc/nginx/conf.d/kibana.conf
cp -f /tmp/config/nginx/htpasswd.users            /etc/nginx/htpasswd.users
cp -f /tmp/config/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
cp -f /tmp/config/kibana/kibana.yml               /etc/kibana/kibana.yml

# Add symlinks for elasticsearch
ln -s /usr/share/elasticsearch/bin/elasticsearch        /usr/local/sbin/
ln -s /usr/share/elasticsearch/bin/elasticsearch-plugin /usr/local/sbin/

# Add symlinks for kibana
ln -s /usr/share/kibana/bin/kibana        /usr/local/sbin/
ln -s /usr/share/kibana/bin/kibana-plugin /usr/local/sbin/

# Configure plugins

## X-Pack
yes | elasticsearch-plugin install x-pack
kibana-plugin install x-pack

# Start services
systemctl start nginx
systemctl start elasticsearch
systemctl start kibana
systemctl start logstash
 
# Enable services
systemctl enable nginx
systemctl enable elasticsearch
systemctl enable kibana
systemctl enable logstash

