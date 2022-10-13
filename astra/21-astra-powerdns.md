## pdns
```sh
export APP=app ; export SRC=src ; export PDNS=pdns

export PMIN="--prefix=/$APP/$PDNS --with-modules='' --disable-lua-records"
export PFAT="--prefix=/$APP/$PDNS --with-modules='bind' --with-dynmodules='pipe remote' --enable-tools --enable-ixfrdist --enable-systemd"

cd /$APP/$SRC
wget https://downloads.powerdns.com/releases/pdns-4.6.3.tar.bz2
tar xvf ./pdns-4.6.3.tar.bz2 && cd ./pdns-4.6.3/

apt install libboost-program-options-dev

autoreconf -vi
./configure $PFAT
[[ $? -eq 0 ]] && make -j $(nproc)
[[ $? -eq 0 ]] && make install

useradd -M -U -r -s `which nologin` -d /$APP/$PDNS $PDNS
mkdir -p /$APP/$PDNS/etc/zones/
chown -R $PDNS:$PDNS /$APP/$PDNS
export PATH=$PATH:/$APP/$PDNS/bin
```
```sh
cp /app/pdns/etc/pdns.conf /app/pdns/etc/pdns.conf.dist
cat << EOF > /app/pdns/etc/pdns.conf
setgid=pdns
setuid=pdns

guardian=yes
daemon=yes
master=yes
launch=bind

config-dir=/app/pdns/etc

bind-config=named.conf
bind-check-interval=600

version-string=none

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
cat << EOF >> /app/pdns/etc/zones/named.conf
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
cat << EOF >> /app/pdns/etc/zones/db.example.com
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
sudo cp /app/pdns/lib/systemd/system/pdns.service \
/etc/systemd/system/pdns.service
```
```sh
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

