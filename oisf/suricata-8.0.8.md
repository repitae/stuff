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
groupadd -r suricata
useradd -r -M -g suricata -s /bin/nologin suricata
```
```
USR=`whoami`
PRF=/opt/oisf
WDR=/home/$USR/oisf
```
```
# sys
echo "net.ipv6.conf.all.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.d/disable_ipv6.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.d/disable_ipv6.conf
cat /etc/sysctl.d/disable_ipv6.conf | sudo sysctl -p /etc/sysctl.d/disable_ipv6.conf
```
```
# env
[ -e  $WDR ] || mkdir -p $WDR && cd $WDR
```
```
# base
sudo apt install linux-headers-$(uname .r) \
autoconf \
automake \
binutils \
build-essential \
coreutils \
gcc \
libtool \
make \
pkg-config
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
sudo sed -i.back 's/eth0/ens18/g' /opt/oisf/suricata/etc/suricata/suricata.yaml
$PRF/suricata/bin/suricata --build-info
```

```
# /etc/systemd/system/suricata.service
[Unit]
Description=Suricata Intrusion Detection Service
After=network-online.target
Wants=network-online.target

[Service]
Type=notify
NotifyAccess=main
WatchdogSec=30s
Restart=on-failure
RestartSec=5s
StartLimitBurst=5
StartLimitIntervalSec=120
#User=suricata
#Group=suricata
ExecStart=/opt/oisf/suricata/bin/suricata -c /opt/oisf/suricata/etc/suricata/suricata.yaml --pidfile /opt/oisf/suricata/run/suricata/suricata.pid --af-packet
ExecReload=/bin/kill -USR2 $MAINPID

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
ReadWritePaths=/opt/oisf/suricata/var/log/suricata /opt/oisf/suricata/var/lib/suricata /opt/oisf/suricata/run/suricata
CapabilityBoundingSet=CAP_NET_RAW CAP_NET_ADMIN CAP_SYS_NICE CAP_BPF
AmbientCapabilities=CAP_NET_RAW CAP_NET_ADMIN CAP_SYS_NICE CAP_BPF

[Install]
WantedBy=multi-user.target
```
```
sudo systemctl daemon-reload
sudo systemctl enable --now suricata
sudo systemd-analyze verify /etc/systemd/system/suricata.service
sudo journalctl -u suricata -f | grep -i watchdog
```
```
# Sample /etc/logrotate.d/suricata configuration file.
@e_logdir@*.log @e_logdir@*.json {
    daily
    missingok
    rotate 5
    compress
    delaycompress
    minsize 500k
    sharedscripts
    postrotate
        /bin/kill -HUP `cat @e_rundir@suricata.pid 2> /dev/null` 2> /dev/null || true
    endscript
}
```