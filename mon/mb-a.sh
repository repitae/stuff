#!/usr/bin/env bash

HOST=185.179.144.40
FQDN=mb.vtb.ru
PORT=443

sdata () {
while :
do
  echo -ne "GET /mobilebanking/ping.txt HTTP/1.1\nHost: $FQDN\r\n\r\n"
  sleep 1.75
done
}

check () {
while :
do
  sdata | openssl s_client -connect $HOST:$PORT | grep -v 'Content\|html\|X\|Cache\|Strict\|Accept'
  echo "RESTART at: `date '+%F %T'`"
done
}

check