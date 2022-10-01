#!/bin/bash

ZABBIX_SERVER_IP=1.2.3.4

#Trigger zabbix discovery rule
zabbix_sender -z $ZABBIX_SERVER_IP -s zabbix -k journactl.logs -o $(echo "{\"data\":[{\"{#HOSTNAME}\":\"$(hostname)\"}]}")

LAST_DATE=$(cat /etc/zabbix/scripts/last_sent_log_timestamp | awk '{print $1}')
LAST_SENT_LOG_TIMESTAMP=$(cat /etc/zabbix/scripts/last_sent_log_timestamp | awk '{print $2}')

CURRENT_DATE=$(journalctl -xe | grep "error:\|\"error\":" | tail -n 1 | awk '{print $2}')
CURRENT_TIMESTAMP=$(journalctl -xe | grep "error:\|\"error\":" | tail -n 1 | awk '{print $3}')

if [ -z "$LAST_SENT_LOG_TIMESTAMP" ] || [ -z "$LAST_DATE" ]
then
      LAST_DATE=$CURRENT_DATE
      LAST_SENT_LOG_TIMESTAMP=$CURRENT_TIMESTAMP
      echo "$CURRENT_DATE $CURRENT_TIMESTAMP" > /etc/zabbix/scripts/last_sent_log_timestamp
fi

if [[ $CURRENT_TIMESTAMP > $LAST_SENT_LOG_TIMESTAMP ]] || [[ ${CURRENT_DATE#0} -ne ${LAST_DATE#0} ]]
then
    LOG_LINE=1
    LOG_LINE_TIMESTAMP="99:99:99"
    while [[ $LOG_LINE_TIMESTAMP > $LAST_SENT_LOG_TIMESTAMP ]]
    do
        LOG_LINE_TIMESTAMP=$(journalctl -xe | grep "error:\|\"error\":" | tail -n $LOG_LINE | head -n1 | awk '{print $3}')
        let "LOG_LINE+=1"

        if [[ $LOG_LINE -ge 150 ]]
        then
            echo "RESULT: More than 150 lines, something is wrong"
            echo "$CURRENT_DATE $CURRENT_TIMESTAMP" > /etc/zabbix/scripts/last_sent_log_timestamp
            exit
        fi
    done

    for i in $(seq $LOG_LINE -1 1)
    do
         LOG_LINE_TO_SEND=$(journalctl -xe | grep "error:\|\"error\":" | tail -n $i | head -n1)
         if [[ ! -z "$LOG_LINE_TO_SEND" ]]
         then
             zabbix_sender -z $ZABBIX_SERVER_IP -s zabbix -k journalctl.log[$(hostname)] -o "$LOG_LINE_TO_SEND"
         fi
    done

    echo "$CURRENT_DATE $CURRENT_TIMESTAMP" > /etc/zabbix/scripts/last_sent_log_timestamp
    echo "RESULT: Completed successfully"
else
    echo "RESULT: No new logs"
fi
