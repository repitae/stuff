#!/usr/bin/env bash

H1=185.179.144.24
H2=185.179.146.24
FQDN=auto.vtb.ru
PORT=443

send_head() {
  echo -ne "GET / HTTP/1.1\nHost: $FQDN\r\n\r\n"
  sleep 2
}

send_data() {
  local HOST1=$1
  local HOST2=$2
  echo
  echo "======================================"
  echo "CONNECTION:"
  echo "FQDN: $FQDN"
  echo "HOST: $HOST1"
  echo "TIME: $(date '+%F %T')"
  echo "======================================"
  send_head | openssl s_client -servername "$FQDN" -connect "$HOST1":"$PORT" | grep -A 5 -B 3 '\---'
  echo
  echo "======================================"
  echo "CONNECTION:"
  echo "FQDN: $FQDN"
  echo "HOST: $HOST2"
  echo "TIME: $(date '+%F %T')"
  echo "======================================"
  send_head | openssl s_client -servername "$FQDN" -connect "$HOST2":"$PORT" | grep -A 5 -B 3 '\---'
  echo
}

main_check() {
while :
do
  send_data $H1 $H2
done
}

main_check


