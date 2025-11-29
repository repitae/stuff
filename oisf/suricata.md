```
timedatectl set-timezone Europe/Moscow
# [ -f "/etc/ssl/cacert.pem" ] || wget https://curl.se/ca/cacert.pem -O - > /etc/ssl/cacert.pem
```
```
echo "net.ipv6.conf.all.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.d/disable_ipv6.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" | sudo tee -a /etc/sysctl.d/disable_ipv6.conf
sudo sysctl -p /etc/sysctl.d/disable_ipv6.conf
cat /proc/sys/net/ipv6/conf/all/disable_ipv6
```
```
apt install i2c-tools lm-sensors && modprobe i2c_dev
sensors-detect --auto &&  i2cdetect -l
```
```
sudo apt install autoconf automake build-essential coreutils ethtool libtool pkg-config
sudo apt install cargo cbindgen hwloc rustc zlib1g-dev \
 libcap-ng-dev libhwloc-dev libjansson-dev liblz4-dev libmagic-dev \  
 libmaxminddb-dev libpcap-dev libpcre2-dev libunwind-dev libyaml-dev
```
```    
mkdir -p ~/src/ && cd ~/src/
#curl -LOk https://www.openinfosecfoundation.org/download/suricata-8.0.2.tar.gz
wget https://www.openinfosecfoundation.org/download/suricata-8.0.2.tar.gz
tar xzf suricata-8.0.2.tar.gz
cd ./suricata-8.0.2/
./configure --prefix=/opt/oisf/ --disable-gccmarch-native --enable-af-packet \
--enable-geoip --enable-hwloc --enable-npcap --enable-pie
make -j $(nproc)
sudo make install
sudo make install-full
sudo ldconfig
/opt/oisf/bin/suricata --build-info
sudo /opt/oisf/bin/suricata-update 
sudo /opt/oisf/bin/suricata -c /opt/oisf/etc/suricata/suricata.yaml -i ens18
```



```
sudo systemctl status suricata
```