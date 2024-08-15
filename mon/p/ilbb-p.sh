#!/usr/bin/env bash

NS=185.179.146.1

while :
do
  for var in mb.vtb.ru online.vtb.ru sso-app.vtb.ru
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