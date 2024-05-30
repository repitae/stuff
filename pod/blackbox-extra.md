```
 file_sd_configs:
      - files:
        - /etc/prometheus/targets.d/blackbox-http.yml

 file_sd_configs:
      - files:
        - /etc/prometheus/targets.d/blackbox-tls.yml

 file_sd_configs:
      - files:
        - /etc/prometheus/targets.d/blackbox-dns.yml
```
```
sudo nano /opt/prometheus/targets.d/blackbox-icmp.yml
- targets:
  - ya.ru
  - 192.168.1.1
  - 127.0.0.1
  labels:
    alias: ping
```
```
sudo nano /etc/prometheus/targets.d/blackbox-tcp.yml
- targets:
  - google.com:443
  - yandex.ru:443
  labels:
    alias: tcp
```

