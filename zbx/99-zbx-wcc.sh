#!/usr/bin/env bash

[ $# -eq 0 ] && { echo "Usage: $0 fqdn.name"; exit 1; }

FQDN=$1
PORT=443

sdata () {
while :
 do
   echo -e "HEAD / HTTP/1.1\nHost: $FQDN\r\n"
   sleep 2
 done
}

sdata | openssl s_client -connect $FQDN:$PORT
