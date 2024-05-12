```
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.0/node_exporter-1.8.0.linux-amd64.tar.gz
mkdir /opt/node_exporter-1.8.0.linux-amd64
tar xvfz node_exporter-1.8.0.linux-amd64.tar.gz -C /opt/
ln -s /opt/node_exporter-1.8.0.linux-amd64 /opt/node
cd /opt/node
./node_exporter
```

```
curl http://localhost:9100/metrics | grep "node_"
```

```
cat << EOF | sudo tee /etc/systemd/system/node.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=mon
Group=mon
Type=simple
RestartSec=5
Restart=on-failure
AmbientCapabilities=CAP_NET_RAW
ExecStart=/opt/node/node_exporter
ExecReload=/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target
EOF
```