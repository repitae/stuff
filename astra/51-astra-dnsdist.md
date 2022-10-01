## dnsdist
```sh
export APP=app ; export SRC=src ; export DNSDIST=dnsdist
cd /$APP/$SRC

wget https://downloads.powerdns.com/releases/dnsdist-1.7.2.tar.bz2
tar xvf ./dnsdist-1.7.2.tar.bz2
cd ./dnsdist-1.7.2/
# apt install -y libcap-ng-dev libedit-dev libfstrm-dev libnghttp2-dev libsodium-dev libsnmp-dev

autoreconf -vi
# ./configure --prefix=/$APP/$DNSDIST --enable-unit-tests --enable-systemd --enable-dnstap --with-ebpf --with-libcap --with-lua --with-net-snmp --with-nghttp2
./configure --prefix=/$APP/$DNSDIST --enable-unit-tests --enable-systemd --enable-dnstap
[[ $? -eq 0 ]] && make -j $(nproc)
[[ $? -eq 0 ]] && make install

[ -d /$APP/$DNSDIST/etc/. ] | mkdir /$APP/$DNSDIST/etc
useradd -MUr -s `which nologin` -d /$APP/$DNSDIST $DNSDIST
#[[ `$(id $DNSDIST 2>/dev/null)` -ne 0 ]] useradd -MUr -s `which nologin` -d /$APP/$DNSDIST $DNSDIST
chown -R $DNSDIST:$DNSDIST /$APP/$DNSDIST
```

```sh
sudo cat << EOF >> /app/dnsdist/etc/dnsdist.conf 
addACL("0.0.0.0/0")

addLocal("192.0.2.1", {reusePort=true, tcpFastOpenSize="1024", cpus={1}})
addLocal("192.0.2.2", {reusePort=true, tcpFastOpenSize="1024", cpus={2}})
addLocal("0.0.0.0")

setConsoleACL({"127.0.0.1/32"})
controlSocket("127.0.0.1:5199")

newServer({address="1.1.1.1", name="cloud1", pool="rdns"})
newServer({address="1.2.4.8", name="china", pool="rdns"})
newServer({address="8.8.8.8", name="google", pool="rdns"})
newServer({address="9.9.9.9", name="quad9", pool="rdns"})
newServer({address="76.76.2.4", name="controld", pool="rdns"})
newServer({address="77.88.8.88", name="yandex", pool="rdns"})

setServerPolicy(roundrobin)
-- setServerPolicy(firstAvailable)
-- setServerPolicy(leastOutstanding)

webserver("0.0.0.0:8083")
setWebserverConfig({password="dnsdist", apiKey="dnsdist", acl="0.0.0.0/0"})

rpc = newPacketCache(10000,
  {maxTTL=86400, minTTL=0, temporaryFailureTTL=60, staleTTL=60, dontAge=false})
getPool("rdns"):setCache(rpc)

setMaxUDPOutstanding(65535)
-- setMaxTCPClientThreads(100)
-- setMaxTCPQueuedConnections(1000)
-- setMaxTCPConnectionDuration(10)
-- setMaxTCPConnectionsPerClient(1000)
-- setMaxTCPQueriesPerConnection(1000)
-- setTCPDownstreamCleanupInterval(60)
-- setCacheCleaningDelay(60)
-- setStaleCacheEntriesTTL(300)
-- setCacheCleaningPercentage(100)
-- setRandomizedIdsOverUDP(false) -- New in version 1.8.0
-- setRandomizedOutgoingSockets(false) -- New in version 1.8.0

snmpAgent(true, enableTraps)
EOF
```

```sh
/app/dnsdist/bin/dnsdist -C /app/dnsdist/etc/dnsdist.conf -u dnsdist -g dnsdist -v
```

```sh
echo "agentxperms 0700 0700 dnsdist dnsdist" | tee -a /etc/snmp/snmpd.conf
systemctl restart snmpd
```

```sh
sudo cp /app/dnsdist/lib/systemd/system/dnsdist.service /etc/systemd/system/dnsdist.service
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable dnsdist.service
sudo systemctl start dnsdist.service
sudo journalctl -xe
```
