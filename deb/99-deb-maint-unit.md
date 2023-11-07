```sh
cat << EOF | sudo tee -a /etc/systemd/system/maintenance.service
[Unit]
Description=maintenance service
After=multi-user.target

[Service]
Restart=no
Type=simple
RemainAfterExit=yes
ExecStart=/bin/true
ExecStop=/bin/true

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl enable maintenance.service
sudo systemctl start maintenance.service
```
