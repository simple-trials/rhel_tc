#!/bin/bash
#
sudo yum update -y 1>/dev/null
sudo yum install -y java-11-openjdk wget 1>/dev/null
#
wget –c https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.74/bin/apache-tomcat-9.0.74.tar.gz
#
sudo mkdir -p /opt/tomcat
sudo tar xf apache-tomcat-9.0.74.tar.gz -C /opt/tomcat
#
#
sudo cp context.xml /opt/tomcat/apache-tomcat-9.0.74/webapps/manager/META-INF/context.xml
sudo cp context.xml /opt/tomcat/apache-tomcat-9.0.74/webapps/host-manager/META-INF/context.xml
sudo cp tomcat-users.xml /opt/tomcat/apache-tomcat-9.0.74/conf/tomcat-users.xml
sudo cp server.xml /opt/tomcat/apache-tomcat-9.0.74/conf/server.xml
#
sudo useradd -r -M -U -d /opt/tomcat -s /bin/false tomcat 2>/dev/null
sudo chown -R tomcat: /opt/tomcat/*
sudo cp tomcat.service /etc/systemd/system/tomcat.service
#
sudo systemctl daemon-reload
#
sudo systemctl start tomcat
#
port=$(sudo cat server.xml | grep "Connector port"  | grep "HTTP" | grep -o 'port="[0-9]*"' | sed 's/port="\([0-9]*\)"/\1/')
#
#
echo -e " log into this public ip $(curl -s ifconfig.me):$port 
