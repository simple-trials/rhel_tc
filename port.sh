#!/bin/bash
#
#set -x
port=$(sudo cat server.xml | grep "Connector port"  | grep "HTTP" | grep -o 'port="[0-9]*"' | sed 's/port="\([0-9]*\)"/\1/')

#
#curl ifconfig.me
echo -e " log into this address for tomcat $(curl -s ifconfig.me):$port"
