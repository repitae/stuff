```

\[Unit]
Description=Suricata
After=network-online.target

\[Service]
Type=notify
ExecStartPre=/bin/rm -f /opt/oisf/var/run/oisf.pid
ExecStart=/opt/oisf/bin/suricata -c /opt/oisf/etc/suricata/suricata.yaml --pidfile /opt/oisf/var/run/suricata.pid
ExecReload=/bin/kill -USR2 $MAINPID
PIDFile=/opt/oisf/var/run/suricata.pid
Restart=on-failure

\[Install]
WantedBy=multi-user.target

```



```

systemctl list-jobs

sudo systemctl unmask systemd-networkd systemd-resolved

sudo systemctl enable --now systemd-networkd systemd-resolved

sudo systemctl disable --now systemd-networkd-wait-online.service

sudo systemctl mask systemd-networkd-wait-online.service

\[ -f /etc/network/if-up.d/resolved ] \&\& sudo sed -i "s/return/exit/" /etc/network/if-up.d/resolved

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

