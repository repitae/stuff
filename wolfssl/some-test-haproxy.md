```
cd /app/haproxy/ssl/
openssl req -newkey rsa:2048 -nodes -x509 -days 365 -keyout ha.key -out ha.crt -subj "/CN=ha"
cat ha.crt ha.key > ha.pem
```

```
cat <<EOF | tee /etc/systemd/system/haproxy.service
[Unit]
Description=haproxy.service
After=network-online.target
Wants=network-online.target

[Service]
#EnvironmentFile=-/app/haproxy/default
#EnvironmentFile=-/app/haproxy/sysconfig
#Environment="CONFIG=/app/haproxy/etc/haproxy.cfg" "PIDFILE=/app/haproxy/run/haproxy.pid" "EXTRAOPTS=-S /app/haproxy/run/master.sock"
ExecStartPre=/app/haproxy/sbin/haproxy -f /app/haproxy/etc/haproxy.cfg -c -q
ExecStart=/app/haproxy/sbin/haproxy -Ws -f /app/haproxy/etc/haproxy.cfg -p /app/haproxy/run/haproxy.pid -S /app/haproxy/run/master.sock
ExecReload=/app/haproxy/sbin/haproxy -Ws -f /app/haproxy/etc/haproxy.cfg -c -q -S /app/haproxy/run/master.sock
ExecReload=/bin/kill -USR2
KillMode=mixed
Restart=on-failure
RestartSec=5s
SuccessExitStatus=143
Type=notify

[Install]
WantedBy=multi-user.target
EOF
```

```
cat <<EOF | tee /app/haproxy/etc/haproxy.cfg
global
  maxconn 64000
  stats socket /app/haproxy/run/master.sock mode 666 level admin
  ssl-default-bind-options ssl-min-ver TLSv1.2 no-tls-tickets
  ssl-default-bind-ciphers ECDHE+AESGCM:EDH+AESGCM
  #ssl-default-bind-ciphers EECDH+AESGCM:EDH+AESGCM:EECDH+AES:EDH+AES
  ssl crt /app/haproxy/ssl/ha.pem

defaults defaults
  maxconn 64000
  timeout connect 5s
  timeout client 10s
  timeout server 10s
  timeout http-keep-alive 30s
  balance roundrobin

listen stats
  mode http
  bind *:8404
  stats enable
  stats uri /stats
  stats refresh 5s

frontend front-8082
  mode tcp
  bind :8082
  default_backend back-8082

frontend front-8083
  mode http
  bind :8083
  http-request redirect scheme https unless { ssl_fc }
  default_backend back-8083

backend back-8082
  mode tcp
  server s1 192.168.1.21:80
  server s2 192.168.1.22:80

backend back-8083
  mode http
  server s1 192.168.1.21:80
  server s2 192.168.1.22:80
EOF
```