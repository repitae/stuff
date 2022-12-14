<!---
## exabgp (venv)
```sh
[-d /app/exabgp/ ] || mkdir -p /app/exabgp/
cd /app/exabgp
python3 -m venv /app/exabgp
source /app/exabgp/bin/activate
pip install pkg-resources setuptools wheel exabgp
pip freeze > /app/exabgp/requirements.txt
cat /app/exabgp/requirements.txt
./bin/exabgp --version # 4.2.21
./bin/exabgp --help
```

## exabgp (pkg)
```sh
export APP=app ; export SRC=src ; export EBGP=exabgp
cd /$APP/$SRC

wget https://github.com/Exa-Networks/exabgp/archive/4.2.21.tar.gz -O exabgp-4.2.21.tar.gz
tar xvf ./exabgp-4.2.21.tar.gz
cp -r ./exabgp-4.2.21 /app/exabgp

cd /$APP/$EBGP/
./sbin/exabgp --version # 4.2.21
./sbin/exabgp --help
```
--->

## exabgp (git)
```sh
export APP=app ; export SRC=src ; export EBGP=exabgp
cd $APP
git clone https://github.com/Exa-Networks/exabgp exabgp
cd exabgp
./sbin/exabgp --version
./sbin/exabgp --help
./sbin/exabgp --run healthcheck --help
./bin/healthcheck --help
git checkout 4.2.21
```

```sh
export APP=app ; export SRC=src ; export EBGP=exabgp
useradd -MUr -s `which nologin` -d /app/exabgp exabgp
chown -R $EBGP:$EBGP /$APP/$EBGP
```

```sh
ETH0ADDR=`ip -4 -o addr show eth0 | awk '{print $4}' | cut -d/ -f 1`

sudo cat << EOF >> /app/exabgp/etc/exabgp.conf
# https://github.com/Exa-Networks/exabgp/tree/master/etc/exabgp
neighbor 192.168.1.94 {
  local-address 192.168.1.96;
  local-as 65500;
  peer-as 65500;
  capability {
    asn4 enable;
    route-refresh enable;
    graceful-restart 5;
    nexthop enable;
    add-path send/receive;
    multi-session enable;
    operational disable;
    aigp disable;
  }
  family {
    ipv4 unicast;
  }
  nexthop {
  }
  add-path {
  }
}
EOF
```

```sh
# env exabgp.tcp.bind=0.0.0.0 exabgp.tcp.port=179 ./sbin/exabgp -d /app/exabgp/etc/exabgp.conf
```

```sh
sudo cat << EOF >> /etc/systemd/system/exabgp.service
[Unit]
Description=ExaBGP
Documentation=man:exabgp(1)
Documentation=man:exabgp.conf(5)
Documentation=https://github.com/Exa-Networks/exabgp/wiki
After=network.target
ConditionPathExists=/app/exabgp/etc/exabgp.conf

[Service]
User=exabgp
Group=exabgp
Environment=exabgp_daemon_daemonize=false
PermissionsStartOnly=true
ExecStartPre=-mkdir -p /app/exabgp/run/
ExecStartPre=-mkfifo -m 600 /app/exabgp/run/exabgp.in
ExecStartPre=-mkfifo -m 600 /app/exabgp/run/exabgp.out
ExecStartPre=-chown exabgp:exabgp /app/exabgp/run/exabgp.in
ExecStartPre=-chown exabgp:exabgp /app/exabgp/run/exabgp.out
ExecStartPre=/app/exabgp/sbin/exabgp --validate /app/exabgp/etc/exabgp.conf
ExecStart=/app/exabgp/sbin/exabgp /app/exabgp/etc/exabgp.conf
ExecStopPost=-rm -f /app/exabgp/run/exabgp.in
ExecStopPost=-rm -f /app/exabgp/run/exabgp.out
ExecReload=kill -USR1 $MAINPID
Restart=always
CapabilityBoundingSet=CAP_NET_BIND_SERVICE CAP_NET_ADMIN
AmbientCapabilities=CAP_NET_BIND_SERVICE CAP_NET_ADMIN
RestrictAddressFamilies=AF_INET AF_UNIX

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo cat << EOF >> /app/exabgp/etc/dm1v4.conf
[dm1v4]
nexthop=192.0.2.1
command="dig @192.0.2.1 a.root-servers.net. a +short"
ip=192.0.2.1
disable=/app/exabgp/run/healthcheck_dm1v4.disable
EOF
```

```sh
sudo cat << EOF >> /app/exabgp/etc/dm2v4.conf
[dm1v4]
nexthop=192.0.2.2
command="dig @192.0.2.2 a.root-servers.net. a +short"
ip=192.0.2.2
disable=/app/exabgp/run/healthcheck_dm2v4.disable
EOF
```

```sh
sudo systemctl daemon-reload 
sudo systemctl enable exabgp
sudo systemctl start exabgp
systemctl status exabgp
```

```sh
sudo journalctl -u exabgp --vacuum-time=1s
sudo journalctl -ru exabgp
```

```sh
cd /app/exabgp/
./bin/exabgpcli show neighbor summary
./bin/exabgpcli show neighbor extensive
./bin/exabgpcli show neighbor configuration
```
