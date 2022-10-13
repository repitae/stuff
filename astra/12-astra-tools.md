## tools
```sh
sudo apt install -y autoconf automake bison build-essential flex libtool ragel
sudo apt install -y python3-pip python3-setuptools python3-venv
sudo apt install -y curl ldnsutils lua5.3 mc netcat socat snmpd unzip wget
sudo apt install -y devscripts dialog dpkg-dev gawk git gnupg2 pkg-config
```

## libs
```sh
sudo apt install -y libboost-all-dev
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

## libs
```sh
sudo apt install -y libcap-ng-dev
sudo apt install -y libedit-dev
sudo apt install -y libfstrm-dev
sudo apt install -y libnghttp2-dev
sudo apt install -y libsodium-dev
sudo apt install -y libsnmp-dev
```

## path
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

## mkdir
```sh
[ -d /$APP/$SRC/ ] || sudo mkdir -p /$APP/$SRC/
```
