#!/usr/bin/env bash

HOST=185.179.144.43
FQDN=online.vtb.ru
PORT=443

sdata () {
while :
do
  echo -ne "GET /login HTTP/1.1\nHost: $FQDN\r\n\r\n"
  sleep 1.75
done
}

check () {
while :
do
  sdata | openssl s_client -connect $FQDN:$PORT | grep -v 'Content\|html\|X\|Cache\|Strict\|Accept'
  echo "RESTART at: `date '+%F %T'`"
done
}

check