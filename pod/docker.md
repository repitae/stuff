```
sudo apt-get update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod 664 /etc/apt/keyrings/docker.asc
```

```
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.asc] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

```
useradd -U --system -d /opt/monitoring -s /bin/false mon
mkdir -p /opt/monitoring/{prometheus,grafana,alertmanager,blackbox}
chown -R mon:mon /opt/monitoring/
cd /opt/monitoring
```

```
vi /opt/monitoring/docker-compose.yml
```

```
```