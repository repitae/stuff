```sh
sudo mkdir -p /opt/statping && cd /opt/statping
wget -c https://github.com/statping-ng/statping-ng/releases/download/v0.90.80/statping-linux-amd64.tar.gz -O - | tar -xz
```

```sh
sudo cat << EOF >> /etc/systemd/system/statping.service
[Unit]
Description=Statping Service
After=network.target
After=systemd-user-sessions.service
After=network-online.target

[Service]
Type=simple
Restart=always
EnvironmentFile=/opt/statping/env
ExecStart=/opt/statping/statping --ip 127.0.0.1 --port 8080
ExecReload=/usr/bin/kill -s HUP $MAINPID
ExecStop=/usr/bin/kill -s QUIT $MAINPID
WorkingDirectory=/opt/statping

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo cat << EOF >> /opt/statping/env
PORT=8080
HOST=127.0.0.1
VERBOSE=1
STATPING_DIR=/opt/statping
DISABLE_LOGS=false
ALLOW_REPORTS=false
DB_CONN=sqlite
MAX_OPEN_CONN=25
MAX_IDLE_CONN=25
MAX_LIFE_CONN=5
SAMPLE_DATA=false
EOF
```

```sh
sudo cat << EOF >> /etc/nginx/sites-available/statping
upstream backend {
  server 127.0.0.1:8080;
  keepalive 32;
}

server {
  listen 80 default_server;
  server_name _;
  return 301 https://$server_name$request_uri;
}

server {
  listen 443 ssl default_server;
  ssl_certificate /etc/ssl/private/server.crt;
  ssl_certificate_key /etc/ssl/private/private.key;
  server_name _;

  location / {
    client_max_body_size 50M;
    # proxy_set_header Connection "";
    # proxy_set_header Host $http_host;
    # proxy_set_header X-Real-IP $remote_addr;
    # proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    # proxy_set_header X-Forwarded-Proto $scheme;
    # proxy_set_header X-Frame-Options SAMEORIGIN;
    # proxy_set_header X-Client-Verify  SUCCESS;
    # proxy_set_header X-Client-DN      $ssl_client_s_dn;
    # proxy_set_header X-SSL-Subject    $ssl_client_s_dn;
    # proxy_set_header X-SSL-Issuer     $ssl_client_i_dn;
    proxy_buffers 256 16k;
    proxy_buffer_size 16k;
    proxy_read_timeout 1800s;
    proxy_connect_timeout 1800s;
    proxy_http_version 1.1;
    proxy_pass http://backend;
  }
}
EOF
```

```sh
sudo openssl req -newkey rsa:4096  -x509  -sha512  -days 3650 -nodes -out /etc/ssl/private/server.crt -keyout /etc/ssl/private/private.key
```

```sh
sudo ln -s /etc/nginx/sites-available/statping /etc/nginx/sites-enabled/statping
sudo rm /etc/nginx/sites-enabled/default
sudo nginx -t
```
```sh
sudo systemctl daemon-reload
sudo systemctl enable nginx statping
sudo systemctl restart nginx statping
sudo systemctl status nginx statping
```

```sh
curl -X GET -H "Content-Type: application/json" "http://127.0.0.1:8080/api"
curl -X GET -H "Content-Type: application/json" "http://127.0.0.1:8080/api/services"
curl -X GET -H "Content-Type: application/json" "http://127.0.0.1:8080/api/clear_cache"
```

```sh
sudo cat << EOF >> /opt/bkp-st.sh
#!/usr/bin/env bash

DT=$(date +%Y-%m-%d-%H%M%S)
BKP="/opt/backup"
SRC="/opt/statping"

# backup statping directory
tar -zcvpf $BKP/statping-$DT.tar.gz $SRC

# delete files older than 90 days
find $BKP/* -mtime +90 -exec rm {} \;
EOF
```
