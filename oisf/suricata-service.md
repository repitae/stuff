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
ExecStart=/opt/oisf/suricata/bin/suricata -c /opt/oisf/suricata/etc/suricata/suricata.yaml --pidfile /opt/oisf/suricata/var/run/suricata/suricata.pid --af-packet
ExecReload=kill -USR2 $MAINPID
ExecStop=kill $MAINPID

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


```
systemctl list-jobs
sudo systemctl unmask systemd-networkd systemd-resolved
sudo systemctl enable --now systemd-networkd systemd-resolved
sudo systemctl disable --now systemd-networkd-wait-online.service
sudo systemctl mask systemd-networkd-wait-online.service
[ -f /etc/network/if-up.d/resolved ] \&\& sudo sed -i "s/return/exit/" /etc/network/if-up.d/resolved
```

```
echo "net.ipv6.conf.all.disable\_ipv6 = 1" | sudo tee -a /etc/sysctl.d/90-disable-ipv6.conf
echo "net.ipv6.conf.default.disable\_ipv6 = 1" | sudo tee -a /etc/sysctl.d/90-disable-ipv6.conf
echo "net.ipv6.conf.lo.disable\_ipv6 = 1" | sudo tee -a /etc/sysctl.d/90-disable-ipv6.conf
sudo sysctl --system
sysctl net.ipv6.conf.all.disable\_ipv6
```

```
sudo journalctl --rotate
sudo journalctl --vacuum-time=1s
cat /dev/null > \~/.bash\_history \&\& history -c \&\& exit
sudo poweroff
```

