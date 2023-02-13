cat devtest-a-13.sh 
#!/usr/bin/env bash

HOST=217.14.62.13
FQDN=217.14.62.13
PORT=443

sdata () {
while :
do
  echo -ne "GET /DVWA/login.php HTTP/1.1\nHost: $FQDN\r\n\r\n"
  sleep 1.75
done
}

check () {
while :
do
  sdata | openssl s_client -connect $HOST:$PORT | grep -v 'Content\|html\|epoch\|X\|Cache\|Strict\|Accept\|Last\|Referrer\|Cookie|<\|>\|^$'
  echo "RESTART at: `date '+%F %T'`"
done
}

check