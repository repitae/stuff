#!/usr/bin/env bash

HOST=185.179.144.37
FQDN=tst.vtbbo.ru
PORT=443

sdata () {
while :
do
  echo -ne "HEAD / HTTP/1.1\nHost: $FQDN\r\n\r\n"
  sleep 1.75
done
}

check () {
while :
do
  sdata | openssl s_client -connect $HOST:$PORT | grep -v 'Content\|html\|epoch\|X\|Cache\|Strict\|Accept\|Last\|Referrer'
  echo "RESTART at: `date '+%F %T'`"
done
}

check