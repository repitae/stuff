-01. [`Address Family Express Data Path`](https://docs.ebpf.io/linux/concepts/af_xdp/)
-02. [`AF_XDP vs DPDK in 2026`](https://eduardvasile.ro/blog/af-xdp-vs-dpdk)
-03. [`BashFAQ/031`](https://mywiki.wooledge.org/BashFAQ/031)
-04. [`Configuration issue between Suricata 8 and NDPI 5`](https://github.com/ntop/nDPI/issues/3072)
*05. [`Deep Packet Inspection Software Toolkit`](https://github.com/ntop/nDPI)
*06. [`JA4 Fingerprinting with Suricata 8.0`](https://forum.suricata.io/t/ja4-fingerprinting-with-suricata-8-0/)
*07. [`Packet Capture Methods`](https://deepwiki.com/oisf/suri/3.1-packet-capture-methods)
*08. [`PATC hwloc tutorial`](https://www-lb.open-mpi.org/projects/hwloc/tutorials/20160606-PATC-hwloc-tutorial.pdf)
*09. [`Portable Hardware Locality`](https://www.open-mpi.org/projects/hwloc/)
+10. [`Proofpoint Emerging Threats Rules`](https://rules.emergingthreats.net/open/suricata-8.0.8/)
+11. [`Symmetrical RSS`](http://www.ndsl.kaist.edu/~kyoungsoo/papers/TR-symRSS.pdf)
+12. [`Testing XDP vs DPDK`](https://stackoverflow.com/questions/61666624/testing-xdp-vs-dpdk)
+13. [`XDP vs DPDK how to overcome the traffic speed challenge`](https://www.huge-networks.com/en/blog/conectividade/xdp-vs-dpdk-how-to-overcome-the-traffic-speed-challenge)

```
# sys
echo "net.ipv6.conf.all.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.d/90-disable-ipv6.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.d/90-disable-ipv6.conf
cat /etc/sysctl.d/90-disable-ipv6.conf | sudo sysctl -p /etc/sysctl.d/90-disable-ipv6.conf
```
```
USR=`whoami`
PRF=/opt/oisf
WDR=/home/$USR/oisf
```
```
groupadd -r suri
useradd -r -M -g suri -s /bin/nologin suri -d $PRF/suri
```
```
# env
[ -e  $WDR ] || mkdir -p $WDR && cd $WDR
```
```
# base
sudo apt install linux-headers-$(uname .r)
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
sudo apt -y install cargo dpdk rustc hwloc jq
sudo apt -y install \
libbpf-dev \
libcap-ng-dev \
libelf-dev \
libhiredis-dev \
libhyperscan-dev \
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
# ndpi6
wget https://github.com/ntop/nDPI/archive/refs/tags/6.0.tar.gz # api does not work with suricata
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
# wget https://github.com/oisf/suri/archive/refs/tags/suricata-8.0.8.tar.gz # git version not work on astra
wget https://www.openinfosecfoundation.org/download/suricata-8.0.8.tar.gz
tar xzvf suricata-8.0.8.tar.gz
cd ./suricata-8.0.8
# ./autogen.sh # for git version only
./configure --prefix=$PRF/suri \
--with-ndpi=$WDR/nDPI-4.14 \
--enable-dependency-tracking \
--enable-dpdk \
--enable-ebpf \
--enable-gccmarch-native \
--enable-geoip \
--enable-hiredis \
--enable-hwloc \
--enable-ndpi \
--enable-pie
```
```
[ $? -eq 0 ] && make -j$(nproc) all || echo "config failed"
[ $? -eq 0 ] && sudo make install-full || echo "make failed"
$PRF/suricata/bin/suricata --build-info
sudo sed -i.back 's/interface: eth0/interface: ens18/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo /opt/oisf/suri/bin/suricata -c /opt/oisf/suri/etc/suricata/suricata.yaml --pidfile /opt/oisf/suri/var/run/suricata/suricata.pid --af-packet
```
```
sudo sed -i 's/- mdns:/#- mdns:/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- smtp:/#- smtp:/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- smb:/#- smb:/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- ftp/#- ftp/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- rdp/#- rdp/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- nfs/#- nfs/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- tftp/#- tftp/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- ike/#- ike/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- dcerpc/#- dcerpc/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- krb5/#- krb5/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- bittorrent-dht/#- bittorrent-dht/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- snmp/#- snmp/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- rfb/#- rfb/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- sip/#- sip/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- ldap/#- ldap/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- pop3/#- pop3/g' /opt/oisf/suri/etc/suricata/suricata.yaml
sudo sed -i 's/- pop3/#- pop3/g' /opt/oisf/suri/etc/suricata/suricata.yaml
```
```
sudo /opt/oisf/suri/bin/suricata -T -v \
-c /opt/oisf/suri/etc/suricata/suricata.yaml \
--pidfile /opt/oisf/suri/var/run/suricata/suricata.pid

sudo /opt/oisf/suri/bin/suricata \
-c /opt/oisf/suri/etc/suricata/suricata.yaml \
--pidfile /opt/oisf/suri/var/run/suricata/suricata.pid --af-packet
```
```
sudo tee /etc/systemd/system/suri.service > /dev/null << 'EOF'
[Unit]
Description=Suricata Service
After=network-online.target
Wants=network-online.target

[Service]
Type=notify
NotifyAccess=main
Restart=on-failure
RestartSec=5s
StartLimitBurst=5
#User=suricata
#Group=suricata
ExecStartPre=/bin/rm -f /opt/oisf/suri/var/run/suricata/suricata.pid
ExecStart=/opt/oisf/suri/bin/suricata -c /opt/oisf/suri/etc/suricata/suricata.yaml --pidfile /opt/oisf/suri/var/run/suricata/suricata.pid --af-packet
ExecReload=/bin/kill -USR2 $MAINPID
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
ReadWritePaths=/opt/oisf/suri/
CapabilityBoundingSet=CAP_NET_RAW CAP_NET_ADMIN CAP_SYS_NICE CAP_BPF
AmbientCapabilities=CAP_NET_RAW CAP_NET_ADMIN CAP_SYS_NICE CAP_BPF

[Install]
WantedBy=multi-user.target
EOF
```
```
sudo systemctl daemon-reload
sudo systemctl enable --now suri
sudo systemd-analyze verify /etc/systemd/system/suri.service
sudo journalctl -u suri --no-pager
```
```
sudo tee /etc/logrotate.d/suri > /dev/null << 'EOF'
/opt/oisf/suri/var/log/suricata/*.log
{
    size 100M
    rotate 7
    compress
    missingok
    notifempty
    sharedscripts
    postrotate
        if [ -f /opt/oisf/suri/var/run/suricata/suricata.pid ]; then
            kill -HUP $(/opt/oisf/suri/var/run/suricata/suricata.pid) 2>/dev/null || true
        else
            systemctl restart suri
        fi
    endscript
}
EOF
sudo logrotate -dvf /etc/logrotate.d/suri
```
```
/opt/oisf/suri/bin/suricata-update update-sources
/opt/oisf/suri/bin/suricata-update list-enabled-sources
/opt/oisf/suri/bin/suricata-update list-sources --free | grep Name | awk '{print $2 }'
/opt/oisf/suri/bin/suricata-update enable-source abuse.ch/sslbl-ja3
```