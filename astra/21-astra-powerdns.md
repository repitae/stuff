## pdns
```sh
export APP=app ; export SRC=src ; export PDNS=pdns
export PDNS_MIN="--prefix=/$APP/$PDNS --with-modules='' --disable-lua-records"
mv /$APP/$PDNS /$APP/$PDNS.old
cd /$APP/$SRC

wget https://downloads.powerdns.com/releases/pdns-4.7.4.tar.bz2
tar xvf ./pdns-4.7.4.tar.bz2 && cd ./pdns-4.7.4/

autoreconf -vi
./configure --prefix=/$APP/$PDNS \
  --with-modules="bind" --with-dynmodules="pipe" \
  --enable-tools --enable-ixfrdist --enable-systemd

[[ $? -eq 0 ]] && make -j $(nproc)
[[ $? -eq 0 ]] && make install

[[ -n $(id -u "$PDNS" 2>/dev/null) ]] || useradd -M -U -r -s `which nologin` -d /$APP/$PDNS $PDNS
[[ -d "/$APP/$PDNS/etc/zones" ]] || mkdir -p /$APP/$PDNS/etc/zones/
chown -R $PDNS:$PDNS /$APP/$PDNS
export PATH=$PATH:/$APP/$PDNS/bin
```

```sh
cp /$APP/$PDNS/etc/pdns.conf /$APP/$PDNS/etc/pdns.conf.dist
cat << EOF > /$APP/$PDNS/etc/pdns.conf
setgid=pdns
setuid=pdns

guardian=yes
daemon=yes
master=yes

config-dir=/app/pdns/etc
version-string=none
launch=bind,remote

#remote-connection-string=pipe:command=/app/polaris/bin/polaris-pdns,timeout=2000
#distributor-threads=3
negquery-cache-ttl=60
query-cache-ttl=20
cache-ttl=20

bind-config=/app/pdns/etc/named.conf
bind-check-interval=600

local-port=5353
local-address=0.0.0.0

api=yes
api-key=changeme

webserver=yes
webserver-port=8081
webserver-address=0.0.0.0
webserver-allow-from=0.0.0.0/0
webserver-password=changeme
webserver-print-arguments=yes
EOF
```

```sh
cat << EOF >> /$APP/$PDNS/etc/zones/named.conf
options {
directory "/app/pdns/etc";
version none;
hostname none;
server-id none;
};

zone "example.com" IN {
type master;
file "zones/db.example.com";
};
EOF
```

```sh
cat << EOF >> /$APP/$PDNS/etc/zones/db.example.com
@ IN SOA ns1 admin (
11 ; Serial
2h ; Refresh
4h ; Retry
6d ; Expire
8h ; Negative
)

IN NS ns1
IN NS ns2

ns1 IN A 127.0.0.101
ns2 IN A 127.0.0.102
EOF
```

```sh
[[ -f "/etc/systemd/system/pdns.service" ]] || sudo cp \
  /app/pdns/lib/systemd/system/pdns.service \
  /etc/systemd/system/pdns.service
sudo systemctl daemon-reload
sudo systemctl enable pdns.service
sudo systemctl start pdns.service
sudo journalctl -xe
```

```sh
curl -v -H 'X-API-Key: changeme' http://127.0.0.1:8081/api/v1/servers/localhost | python -m json.tool
curl -v -H 'X-API-Key: changeme' http://127.0.0.1:8081/api/v1/servers/localhost/statistics | python -m json.tool
curl -v -u changeme:changeme http://127.0.0.1:8081/metrics
```

* [metrics](https://github.com/repitae/astra/blob/main/90-metrics-pdns.md)

