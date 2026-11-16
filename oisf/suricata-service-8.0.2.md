[Unit]
Description=Suricata
After=network-online.target

[Service]
Type=notify
ExecStartPre=/bin/rm -f /opt/oisf/var/run/oisf.pid
ExecStart=/opt/oisf/bin/suricata -c /opt/oisf/etc/suricata/suricata.yaml --pidfile /opt/oisf/var/run/suricata.pid
ExecReload=/bin/kill -USR2 $MAINPID
PIDFile=/opt/oisf/var/run/suricata.pid
Restart=on-failure

[Install]
WantedBy=multi-user.target