make TARGET=linux-glibc USE_SYSTEMD=1 USE_THREAD=1 && make install PREFIX=/app/haproxy
	
	
cat << EOF | sudo tee /etc/systemd/system/haproxy.service
[Unit]
Description=haproxy.service
After=network-online.target
Wants=network-online.target

[Service]
EnvironmentFile=-/app/haproxy/default
EnvironmentFile=-/app/haproxy/sysconfig
Environment="CONFIG=/app/haproxy/etc/haproxy.cfg" "PIDFILE=/app/haproxy/run/haproxy.pid" "EXTRAOPTS=-S /app/haproxy/run/master.sock"
ExecStartPre=/app/haproxy/sbin/haproxy -f $CONFIG -c -q
ExecStart=/app/haproxy/sbin/haproxy -Ws -f $CONFIG -p $PIDFILE $EXTRAOPTS
ExecReload=/app/haproxy/sbin/haproxy -Ws -f $CONFIG -c -q $EXTRAOPTS
ExecReload=/bin/kill -USR2 $MAINPID
KillMode=mixed
Restart=on-failure
RestartSec=5s
SuccessExitStatus=143
Type=notify

[Install]
WantedBy=multi-user.target
EOF

cat << EOF | sudo tee /app/haproxy/etc/haproxy.conf
frontend list-8082
  mode tcp
  bind :8082
  default_backend back-80
  
backend back-80
  mode tcp
  balance roundrobin
  server s1 192.168.1.21:80
  server s2 192.168.1.22:80
EOF

/app/haproxy/sbin/haproxy -f /app/haproxy/etc/haproxy.cfg -c