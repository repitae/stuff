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
```
```
USR=`whoami`
PRF=/opt/oisf
$WDR=/home/$USR/oisf
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
  --enable-ndpi \
  --enable-hwloc \
  --enable-pie
[ $? -eq 0 ] && make -j$(nproc) || echo "config failed"
[ $? -eq 0 ] && sudo make install || echo "make failed"
cd ../
```

```
# Sample Suricata systemd unit file.
[Unit]
Description=Suricata Intrusion Detection Service
After=syslog.target network-online.target

[Service]
# Environment file to pick up $OPTIONS. On Fedora/EL this would be
# /etc/sysconfig/suricata, or on Debian/Ubuntu, /etc/default/suricata.
#EnvironmentFile=-/etc/sysconfig/suricata
#EnvironmentFile=-/etc/default/suricata
ExecStartPre=/bin/rm -f @e_rundir@suricata.pid
ExecStart=/sbin/suricata -c @e_sysconfdir@suricata.yaml --pidfile @e_rundir@suricata.pid $OPTIONS
ExecReload=/bin/kill -USR2 $MAINPID

[Install]
WantedBy=multi-user.target
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