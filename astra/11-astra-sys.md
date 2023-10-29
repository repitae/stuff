```sh
cat << EOF | sudo tee -a /etc/network/interfaces
# eth0
auto eth0
iface eth0 inet dhcp
EOF
```

```sh
sudo systemctl restart networking
```

```sh
dpkg -l > dpkg.base && dpkg -l | wc
```

```sh
sudo apt -y install --no-install-recommends --no-install-suggests ssh
sudo apt -y install --no-install-recommends --no-install-suggests dialog open-vm-tools
```

```sh
echo 'APT::Install-Recommends "0";' | sudo tee -a /etc/apt/apt.conf.d/99-garbage
echo 'APT::Install-Suggests "0";'  | sudo tee -a /etc/apt/apt.conf.d/99-garbage
```

```sh
sudo sed -i.bak '/GRUB_CMDLINE_LINUX_DEFAULT/s/quiet *//' /etc/default/grub
sudo update-grub
```

```sh
echo "blacklist i2c-piix4" | sudo tee -a /etc/modprobe.d/blacklist-piix.conf
sudo update-initramfs -u
```

```sh
cat << EOF | sudo tee -a /etc/apt/sources.list
# sources
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/repository-main/             1.7_x86-64 main contrib non-free
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/repository-base/             1.7_x86-64 main contrib non-free
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/repository-update/           1.7_x86-64 main contrib non-free
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/repository-extended/         1.7_x86-64 main contrib non-free
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/uu/last/repository-base/     1.7_x86-64 main contrib non-free
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/uu/last/repository-update/   1.7_x86-64 main contrib non-free
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/uu/last/repository-extended/ 1.7_x86-64 main contrib non-free
EOF
```

```sh
sudo sed -i.bak 's/#deb/deb/' /etc/apt/sources.list
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt --purge remove `dpkg -l | grep ^rc | awk '{ print $2}'`
sudo rm -rf /var/cache/apt/archives/*.deb
```

```sh
sudo sed -i.bak 's/astra/alse-cN/' /etc/hosts
sudo sed -i.bak 's/astra/alse-cN/' /etc/hostname
```

```sh
sudo apt update
sudo apt install tuned tuned-utils tuned-utils-systemtap
tuned-adm active
sudo tuned-adm profile virtual-guest
```

```sh
systemctl list-units --type=service
systemctl list-units --all --type=mount
systemctl list-unit-files --state=failed
systemctl list-unit-files --type=service --state=enabled,disabled
```

```sh
systemctl --failed
```

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
