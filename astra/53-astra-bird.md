## bird (sys)
```sh
systemctl stop parsecfs.mount && systemctl disable parsecfs.mount 
systemctl stop parsec.service && systemctl disable parsec.service
apt --purge remove auditd parsec-aud parsec-base parsec-cap parsec-mac 
apt --purge remove libx11-data xauth xkb-data
```

## bird (env)
```sh
[ -d /app/bird/ ] || sudo mkdir -p /app/bird/
sudo groupadd -r oiss
sudo useradd -r -d /app/bird/ -s /bin/none bird
sudo usermod -aG oiss bird
sudo chown -R bird:oiss /app/bird/
```

## bird (pkg)
```sh
sudo apt install -y build-essential
sudo apt install -y bison flex wget
sudo apt install -y libncurses-dev libreadline-dev
cd /app/bird/
wget https://bird.network.cz/download/bird-2.13.tar.gz
tar -xvzf ./bird-2.13.tar.gz 
cd bird-2.13
./configure --prefix=/app/bird --with-protocols="bfd bgp kernel pipe static"
sudo cp /app/bird/etc/bird.conf /app/bird/etc/bird.conf.bak
cat /app/bird/etc/bird.conf | grep -v ^# | grep -v ^$ | sudo tee /app/bird/etc/bird.conf
```
## bird (systemd)
```sh
cat << EOF | sudo tee /etc/systemd/system/bird.service
[Unit]
Description=BIRD routing daemon
After=network.target

[Service]
Type=simple
#Type=notify
#User=bird
#Group=oiss
Restart=on-failure
RestartSec=3s
WorkingDirectory=/app/bird
ExecStartPre=/app/bird/sbin/bird -p
ExecStart=/app/bird/sbin/bird -u bird -g oiss -c /app/bird/etc/bird.conf
ExecStartPost=
ExecReload=/app/bird/sbin/birdc configure
ExecStop=/app/bird/sbin/birdc down
AmbientCapabilities="CAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_NET_RAW"

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl enable bird
sudo systemctl start bird
sudo systemctl status bird
sudo systemctl list-units --failed
```

## bird
```sh
```
