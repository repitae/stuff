```sh
sudo apt update
sudo apt install -y nginx
```

```sh
cat << EOF | sudo tee /etc/nginx/sites-available/pxe.conf
server {
    listen 80 default_server;
    root /opt/pxe;
    index index.html;
    server_name _;
    location / {
        autoindex on;
    }
}
EOF
```

```sh
sudo ln -s /etc/nginx/sites-available/pxe.conf /etc/nginx/sites-enabled/pxe.conf
rm /etc/nginx/sites-enabled/default
nginx -t && sudo systemctl restart nginx
```
