```
sudo apt-get install -y adduser libfontconfig1 musl
wget https://dl.grafana.com/oss/release/grafana_11.0.0~preview_amd64.deb
sudo dpkg -i grafana_11.0.0~preview_amd64.deb

openssl genrsa -out privkey.pem 2048
openssl req -new -key privkey.pem -out signreq.csr
openssl x509 -req -days 365 -in signreq.csr -signkey privkey.pem -out certificate.pem
openssl x509 -text -noout -in certificate.pem

sudo systemctl daemon-reload
sudo systemctl enable grafana-server
sudo systemctl restart grafana-server
https://185.240.103.12:3030/login
```

```
sudo useradd -g users -G sudo -m -u 1000 -d /home/qwe qwe
sudo useradd -g mon -G docker -m -s /bin/false --system -d /opt/monitoring mon
useradd -U --system -s /bin/false mon
```

```
cd /opt/src/

wget https://dl.grafana.com/oss/release/grafana-10.4.2.linux-amd64.tar.gz
tar -zxvf grafana-10.4.2.linux-amd64.tar.gz -C /opt/mon/
ln -s /opt/mon/grafana-v10.4.2 /opt/mon/grafana

wget https://github.com/prometheus/prometheus/releases/download/v2.52.0/prometheus-2.52.0.linux-amd64.tar.gz
tar xvfz prometheus-*.tar.gz -C /opt/mon/
ln -s /opt/mon/prometheus-2.52.0.linux-amd64 /opt/mon/prometheus

wget https://github.com/prometheus/alertmanager/releases/download/v0.27.0/alertmanager-0.27.0.linux-amd64.tar.gz
tar xvfz alertmanager-0.27.0.linux-amd64.tar.gz -C /opt/mon/
ln -s /opt/mon/alertmanager-0.27.0.linux-amd64 /opt/mon/alertmanager

wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.25.0/blackbox_exporter-0.25.0.linux-amd64.tar.gz
tar xvfz blackbox_exporter-*.tar.gz -C /opt/mon/
ln -s /opt/mon/blackbox_exporter-0.25.0.linux-amd64 /opt/mon/blackbox_exporter

wget https://github.com/prometheus/node_exporter/releases/download/v1.8.0/node_exporter-1.8.0.linux-amd64.tar.gz
tar xvfz node_exporter-1.8.0.linux-amd64.tar.gz -C /opt/mon/
ln -s /opt/mon/node_exporter-1.8.0.linux-amd64 /opt/mon/node_exporter
```

```
chown -R mon:mon /opt/mon
```

```
cat << EOF | tee /opt/blackbox/blackbox.yml
modules:
  http_tls_2xx:
    prober: http
    timeout: 5s
    http:
      valid_status_codes: []
      method: GET
      preferred_ip_protocol: "ip4"
      fail_if_ssl: false
      fail_if_not_ssl: true
      tls_config:
        insecure_skip_verify: true
  http_get_2xx:
    prober: http
    timeout: 5s
    http:
      method: GET
      preferred_ip_protocol: "ip4"
  http_post_2xx:
    prober: http
    http:
      method: POST
      preferred_ip_protocol: "ip4"
  tcp_con:
    prober: tcp
    timeout: 5s
    tcp:
      preferred_ip_protocol: "ip4"
  icmp:
    prober: icmp
    timeout: 5s
    icmp:
      preferred_ip_protocol: "ip4"
      ip_protocol_fallback: false
  online:
    prober: dns
    timeout: 5s
    dns:
      query_name: "online.vtb.ru"
      query_type: "A"
      preferred_ip_protocol: "ip4"
  mb:
    prober: dns
    timeout: 5s
    dns:
      query_name: "mb.vtb.ru"
      query_type: "A"
      preferred_ip_protocol: "ip4"
  google:
    prober: dns
    timeout: 5s
    dns:
      query_name: "google.com"
      query_type: "A"
      preferred_ip_protocol: "ip4"
  yandex:
    prober: dns
    timeout: 5s
    dns:
      query_name: "yandex.ru"
      query_type: "A"
      preferred_ip_protocol: "ip4"
EOF
```

```
systemctl daemon-reload
systemctl enable blackbox
systemctl restart blackbox
systemctl status blackbox
```

```
curl -X POST http://localhost:9115/-/reload
curl -X POST http://localhost:9090/-/reload
curl http://localhost:9115/metrics
curl 'localhost:9115/probe?target=1.1.1.1&module=yandex'
curl 'localhost:9115/probe?target=yandex.ru&module=http_tls_2xx'
```