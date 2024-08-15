#!/usr/bin/env bash

HOST=195.242.83.12
FQDN=esmdtpep.vtb.ru
PORT=443

sdata () {
while :
do
  echo -ne "GET /rest/health HTTP/1.1\nHost: $FQDN\r\n\r\n"
  sleep 1.75
done
}

check () {
while :
do
  sdata | openssl s_client -connect $HOST:$PORT | grep -v 'Accept\|Cache\|Cookie\|Content\|Last\|Referrer\|Server\|Strict\|X\|html\|epoch\|<\|>\|5f3\|^$'
  echo "RESTART at: `date '+%F %T'`"
done
}

check