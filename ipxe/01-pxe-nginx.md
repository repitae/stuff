```sh
sudo apt update
sudo apt install -y nginx
cat << EOF | sudo tee /etc/nginx/sites-available/pxe.conf
server {
    listen 80 default_server;
    root /opt/pxe;
    server_name _;
    location / {
        try_files $uri $uri/ =404;
        autoindex on;
    }
}
EOF
sudo ln -s /etc/nginx/sites-available/pxe.conf /etc/nginx/sites-enabled/pxe.conf
rm /etc/nginx/sites-enabled/default
sudo systemctl restart nginx
```