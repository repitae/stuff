```
sudo apt-get install openssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt
sudo openssl dhparam -out /etc/nginx/dhparam.pem 4096
```
```
vi /etc/nginx/snippets/self-signed.conf
ssl_certificate /etc/ssl/certs/nginx.crt;
ssl_certificate_key /etc/ssl/private/nginx.key;

ssl_ecdh_curve secp384r1;
ssl_dhparam /etc/nginx/dhparam.pem;
#ssl_ciphers TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256;
ssl_ciphers ECDHE;
ssl_prefer_server_ciphers off;
ssl_protocols TLSv1.2 TLSv1.3;

ssl_session_cache shared:SSL:10m;
ssl_session_timeout 30m;
ssl_session_tickets off;

#ssl_stapling on;
#ssl_stapling_verify on;
#resolver 1.1.1.1 8.8.8.8 valid=600s;
#resolver_timeout 10s;

add_header X-Frame-Options DENY;
add_header X-Content-Type-Options nosniff;
add_header X-XSS-Protection "1; mode=block";
add_header Strict-Transport-Security "max-age=63072000" always;
```
```
vi /etc/nginx/sites-available/grafana
map $http_upgrade $connection_upgrade {
  default upgrade;
  '' close;
}

upstream grafana {
  server 127.0.0.1:3000;
}

server {
  listen 80 default_server;
  location / {
    return 301 https://$host$request_uri;
  }
}
	
server {
  listen 443 ssl http2;
  return 301 https://$server_name$request_uri;
  include snippets/self-signed.conf;
  server_name _;

#  root /usr/share/nginx/html;
#  index index.html index.htm;

  location / {
    proxy_set_header Host $host;
    proxy_pass http://grafana;
  }

  location /api/live/ {
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection $connection_upgrade;
    proxy_set_header Host $host;
    proxy_pass http://grafana;
  }
}
```