```
# Deep Packet Inspection Software Toolkit
# https://github.com/ntop/nDPI
# Address Family Express Data Path (AF_XDP)
# https://docs.ebpf.io/linux/concepts/af_xdp/
# https://eduardvasile.ro/blog/af-xdp-vs-dpdk
# https://stackoverflow.com/questions/61666624/testing-xdp-vs-dpdk
# https://www.huge-networks.com/en/blog/conectividade/xdp-vs-dpdk-how-to-overcome-the-traffic-speed-challenge
# Portable Hardware Locality (hwloc)
# https://www.open-mpi.org/projects/hwloc/
# https://www-lb.open-mpi.org/projects/hwloc/tutorials/20160606-PATC-hwloc-tutorial.pdf
# Configuration issue between Suricata 8 and NDPI 5 #3072
# https://github.com/ntop/nDPI/issues/3072
# BashFAQ/031
# https://mywiki.wooledge.org/BashFAQ/031
# Packet Capture Methods
# https://deepwiki.com/OISF/suricata/3.1-packet-capture-methods
# Proofpoint Emerging Threats Rules
# https://rules.emergingthreats.net/open/suricata-8.0.8/
# JA4 Fingerprinting with Suricata 8.0
# https://forum.suricata.io/t/ja4-fingerprinting-with-suricata-8-0/5918
```
```
# sys
echo "net.ipv6.conf.all.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.d/90-disable-ipv6.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.d/90-disable-ipv6.conf
cat /etc/sysctl.d/90-disable-ipv6.conf | sudo sysctl -p /etc/sysctl.d/90-disable-ipv6.conf
```
```
groupadd -r suricata
useradd -r -M -g suricata -s /bin/nologin suricata
```
```
USR=`whoami`
PRF=/opt/oisf
WDR=/home/$USR/oisf
```
```
# env
[ -e  $WDR ] || mkdir -p $WDR && cd $WDR
```
```
# base
sudo apt install linux-headers-$(uname .r) \
sudo apt install \
autoconf \
automake \
binutils \
build-essential \
coreutils \
gcc \
libtool \
make \
pkg-config \
wget
```
```
# deps
sudo apt -y install cargo rustc hwloc
sudo apt -y install \
libbpf-dev \
libcap-ng-dev \
libelf-dev \
libhwloc-dev \
libjansson-dev \
liblz4-dev \
libmagic-dev \
libmaxminddb-dev \
libpcap-dev \
libpcre2-dev \
libunwind-dev \
libxdp-dev \
libyaml-dev \
zlib1g-dev
```
```
# ndpi6 - api does not work with suricata
wget https://github.com/ntop/nDPI/archive/refs/tags/6.0.tar.gz
tar xzvf ./6.0.tar.gz
cd ./nDPI-6.0
./autogen.sh
./configure --prefix=$PRF/ndpi6 --with-pcre2 --with-maxminddb
[ $? -eq 0 ] && make -j$(nproc) || echo "config failed"
[ $? -eq 0 ] && sudo make install || echo "make failed"
cd ../
```
```
# ndpi4
wget https://github.com/ntop/nDPI/archive/refs/tags/4.14.tar.gz
tar xzvf ./4.14.tar.gz
cd ./nDPI-4.14/
./autogen.sh
./configure --prefix=$PRF/ndpi4 --with-pcre2 --with-maxminddb
[ $? -eq 0 ] && make -j$(nproc) || echo "config failed"
[ $? -eq 0 ] && sudo make install || echo "make failed"
cd ../
```
```
# suricata
# wget https://github.com/OISF/suricata/archive/refs/tags/suricata-8.0.8.tar.gz ## git not work on astra
wget https://www.openinfosecfoundation.org/download/suricata-8.0.8.tar.gz
tar xzvf suricata-8.0.8.tar.gz
cd ./suricata-8.0.8
# ./autogen.sh # for git version only
./configure --prefix=$PRF/suricata --with-ndpi=$WDR/nDPI-4.14 \
--enable-ebpf \
--enable-gccmarch-native \
--enable-geoip \
--enable-lua \
--enable-ndpi \
--enable-hwloc \
--enable-pie
[ $? -eq 0 ] && make -j$(nproc) || echo "config failed"
[ $? -eq 0 ] && sudo make install-full || echo "make failed"
$PRF/suricata/bin/suricata --build-info
sudo sed -i.back 's/interface: eth0/interface: ens18/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo /opt/oisf/suricata/bin/suricata -c /opt/oisf/suricata/etc/suricata/suricata.yaml --pidfile /opt/oisf/suricata/var/run/suricata/suricata.pid --af-packet
```
```
sudo sed -i 's/- mdns:/#- mdns:/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- smtp:/#- smtp:/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- smb:/#- smb:/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- ftp/#- ftp/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- rdp/#- rdp/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- nfs/#- nfs/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- tftp/#- tftp/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- ike/#- ike/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- dcerpc/#- dcerpc/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- krb5/#- krb5/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- bittorrent-dht/#- bittorrent-dht/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- snmp/#- snmp/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- rfb/#- rfb/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- sip/#- sip/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- ldap/#- ldap/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- pop3/#- pop3/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo sed -i 's/- pop3/#- pop3/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
sudo /opt/oisf/suricata/bin/suricata -c /opt/oisf/suricata/etc/suricata/suricata.yaml --pidfile /opt/oisf/suricata/var/run/suricata/suricata.pid --af-packet
```

```
sudo tee /etc/systemd/system/suricata.service > /dev/null << 'EOF'
[Unit]
Description=Suricata Unit Service
After=network-online.target
Wants=network-online.target

[Service]
Type=notify
NotifyAccess=main
WatchdogSec=30s
Restart=on-failure
RestartSec=5s
StartLimitBurst=5
#User=suricata
#Group=suricata
ExecStart=/opt/oisf/suricata/bin/suricata -c /opt/oisf/suricata/etc/suricata/suricata.yaml --pidfile /opt/oisf/suricata/var/run/suricata/suricata.pid --af-packet
ExecReload=/bin/kill -HUP $MAINPID
ExecStop=/bin/kill $MAINPID

# Resource limits
CPUQuota=800%
MemoryMax=8G
TasksMax=4096
LimitNOFILE=65536
LimitMEMLOCK=infinity

# Hardening
NoNewPrivileges=true
ProtectSystem=strict
ProtectHome=true
PrivateTmp=true
ReadWritePaths=/opt/oisf/suricata/
CapabilityBoundingSet=CAP_NET_RAW CAP_NET_ADMIN CAP_SYS_NICE CAP_BPF
AmbientCapabilities=CAP_NET_RAW CAP_NET_ADMIN CAP_SYS_NICE CAP_BPF

[Install]
WantedBy=multi-user.target
EOF

```
```
sudo systemctl daemon-reload
sudo systemctl enable --now suricata
sudo systemd-analyze verify /etc/systemd/system/suricata.service
sudo journalctl -u suricata -f | grep -i watchdog
```
```
sudo tee /etc/logrotate.d/suricata > /dev/null << 'EOF'

basedir=/opt/oisf/suricata/var/log/
/var/log/suricata/*.log
/var/log/suricata/*.json
{
    daily
    rotate 7
    missingok
    compress
    delaycompress
    sharedscripts
    postrotate
            /bin/kill -HUP `cat /opt/oisf/suricata/var/run/suricata/suricata.pid 2>/dev/null` 2>/dev/null || true
    endscript
}
EOF
logrotate -d -f /etc/logrotate.d/suricata
```