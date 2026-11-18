```
sudo tee /etc/systemd/system/suricata.service > /dev/null << 'EOF'
[Unit]
Description=Suricata unit service
After=network-online.target
Wants=network-online.target

[Service]
Type=notify
NotifyAccess=main
Restart=on-failure
RestartSec=5s
StartLimitBurst=5
#User=suricata
#Group=suricata
ExecStartPre=/bin/rm -f /opt/oisf/suricata/var/run/suricata/suricata.pid
ExecStart=/opt/oisf/suricata/bin/suricata -c /opt/oisf/suricata/etc/suricata/suricata.yaml --pidfile /opt/oisf/suricata/var/run/suricata/suricata.pid --af-packet
ExecReload=/bin/kill -USR2 $MAINPID
ExecStop=/bin/kill $MAINPID

# Resource limits
CPUQuota=800%
MemoryMax=8G
TasksMax=4096
LimitNOFILE=65536
LimitMEMLOCK=infinity

# Hardening
NoNewPrivileges=true
ProtectSystem=strict
ProtectHome=true
PrivateTmp=true
ReadWritePaths=/opt/oisf/suricata/
CapabilityBoundingSet=CAP_NET_RAW CAP_NET_ADMIN CAP_SYS_NICE CAP_BPF
AmbientCapabilities=CAP_NET_RAW CAP_NET_ADMIN CAP_SYS_NICE CAP_BPF

[Install]
WantedBy=multi-user.target
EOF
```
