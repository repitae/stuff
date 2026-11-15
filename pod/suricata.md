```
# refs xdp
# https://eduardvasile.ro/blog/af-xdp-vs-dpdk
# https://stackoverflow.com/questions/61666624/testing-xdp-vs-dpdk
# https://www.huge-networks.com/en/blog/conectividade/xdp-vs-dpdk-how-to-overcome-the-traffic-speed-challenge
# refs hwloc
# https://www.open-mpi.org/projects/hwloc/
# https://www-lb.open-mpi.org/projects/hwloc/tutorials/20160606-PATC-hwloc-tutorial.pdf
# ref ndpi
# https://github.com/ntop/nDPI/issues/3072
```
```
# env
mkdir -p ~/oisf/
cd ~/oisf/
```
```
# ndpi6 - not nessesery, does not work with suricata
wget https://github.com/ntop/nDPI/archive/refs/tags/6.0.tar.gz
tar xzvf ./6.0.tar.gz
cd ./nDPI-6.0
./autogen.sh
./configure --prefix=/opt/oisf/ndpi6 --with-pcre2 --with-maxminddb
make -j$(nproc)
sudo make install
cd ../

```
```
# ndpi4
wget https://github.com/ntop/nDPI/archive/refs/tags/4.14.tar.gz
tar xzvf ./4.14.tar.gz
cd ../
```
```
# suricata
#wget https://github.com/OISF/suricata/archive/refs/tags/suricata-8.0.8.tar.gz # git
wget https://www.openinfosecfoundation.org/download/suricata-8.0.8.tar.gz
tar xzvf suricata-8.0.8.tar.gz
cd ./suricata-suricata-8.0.8
```
```
# base
sudo apt -y install \
  linux-headers-$(uname .r) \
  autoconf \
  automake \
  binutils \
  build-essential \
  gcc \
  libtool \
  make \
  pkg-config
```
```
# deps
sudo apt -y install \
  cargo \
  hwloc \
  libbpf-dev \
  libcap-ng-dev \
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
  zlib1g-dev \
  rustc
```
```
# cfg
./autogen.sh
./configure --prefix=/opt/suricata \
  --enable-ebpf \
  --enable-gccmarch-native \
  --enable-geoip \
  --enable-ndpi \
  --enable-hwloc \
  --enable-pie \
  --with-ndpi=/home/qwe/oisf/nDPI-4.14/
```
```
# mk
make -j$(nproc)
sudo make install-full
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