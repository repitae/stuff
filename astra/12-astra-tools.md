```sh
cat << EOF | sudo tee /etc/network/interfaces.d/dm1
auto dm1
iface dm1 inet static
 pre-up ip link add $IFACE type dummy
 post-up ifconfig $IFACE up
 pre-down ifconfig $IFACE down
 post-down ip link del $IFACE type dummy
 address 192.0.2.1/32
EOF
```

```sh
cat << EOF | sudo tee /etc/network/interfaces.d/dm2
auto dm2
iface dm2 inet static
 pre-up ip link add $IFACE type dummy
 post-up ifconfig $IFACE up
 pre-down ifconfig $IFACE down
 post-down ip link del $IFACE type dummy
 address 192.0.2.2/32
EOF
```

```sh
echo 1 | sudo tee /proc/sys/net/ipv4/conf/all/arp_filter
echo "net.ipv4.conf.all.arp_filter=1" | sudo tee -a /etc/sysctl.conf
```

```sh
sudo apt install -y autoconf automake bison build-essential flex libtool ragel
sudo apt install -y python3-pip python3-setuptools python3-venv
sudo apt install -y curl ldnsutils lua5.3 mc netcat socat snmpd unzip wget
sudo apt install -y devscripts dialog dpkg-dev gawk git gnupg2 pkg-config
```

```sh
#sudo apt install -y libboost-all-dev
sudo apt install -y libboost-program-options-dev
sudo apt install -y libcurl4 libcurl4-openssl-dev
sudo apt install -y libevent-dev
sudo apt install -y liblua5.3-dev
sudo apt install -y libpcre3-dev
sudo apt install -y libssl-dev 
sudo apt install -y libsystemd0 libsystemd-dev
sudo apt install -y libsqlite3-dev
sudo apt install -y libyaml-cpp-dev
sudo apt install -y zlib1g-dev
```

```sh
sudo apt install -y libcap-ng-dev
sudo apt install -y libedit-dev
sudo apt install -y libfstrm-dev
sudo apt install -y libnghttp2-dev
sudo apt install -y libsodium-dev
sudo apt install -y libsnmp-dev
```

```sh
export APP=app
export SRC=src
export PDNS=pdns
export MEMC=memcached
export PMODS=python
export POLAR=polaris
export QTLS=quictls
export HAPRO=haproxy
```

```sh
[ -d /$APP/$SRC/ ] || sudo mkdir -p /$APP/$SRC/
```
