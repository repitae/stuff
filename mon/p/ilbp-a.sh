#!/usr/bin/env bash

NS=195.242.82.1

while :
do
  for var in www.vtb.ru www.vtb.com esmdtpep.vtb.ru
    do
      echo
      echo `date '+%F %T'`
      echo "NS: $NS"
      echo "FQDN: $var"
      echo -n "ANSWER: "
      dig a @$NS $var +short
      sleep 0.33
    done
  done
done