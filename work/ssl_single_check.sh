#!/usr/bin/env bash

HOST=185.179.146.24
FQDN=auto.vtb.ru
PORT=443

send_head() {
while :
do
  echo -ne "GET / HTTP/1.1\nHost: $FQDN\r\n\r\n"
  sleep 2
done
}

main_check() {
while :
do
  send_head | openssl s_client -servername "$FQDN" -connect "$HOST":"$PORT" | grep -C 5 'Con'
  echo "RESTART at: $(date '+%F %T')"
done
}

main_check

