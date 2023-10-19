## net
```sh
sudo cat << EOF >> /etc/network/interfaces.d/eth0
auto eth0
iface eth0 inet dhcp
EOF
```

```sh
sudo systemctl restart networking
```

## pkg
```sh
dpkg -l > dpkg.base && dpkg -l | wc
```

## ssh
```sh
sudo apt update && sudo apt upgrade
sudo apt install --no-install-recommends --no-install-suggests ssh

```

## grub
```sh
sudo sed -i.bak '/GRUB_CMDLINE_LINUX_DEFAULT/s/quiet *//' /etc/default/grub
sudo update-grub
```

## host
```sh
sudo sed -i.bak 's/astra/ase-c1/' /etc/hosts
sudo sed -i.bak 's/astra/ase-c1/' /etc/hostname
```

## piix4
```sh
echo "blacklist i2c-piix4" | sudo tee -a /etc/modprobe.d/blacklist-piix.conf
sudo update-initramfs -u
```

## garbage
```sh
echo 'APT::Install-Recommends "0";' | tee -a /etc/apt/apt.conf.d/99-no-garbage
echo 'APT::Install-Suggests "0";'  | tee -a /etc/apt/apt.conf.d/99-no-garbage
```

## sources
```sh
cat << EOF | sudo tee -a /etc/apt/sources.list
#
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/repository-main/             1.7_x86-64 main contrib non-free
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/repository-base/             1.7_x86-64 main contrib non-free
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/repository-update/           1.7_x86-64 main contrib non-free
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/repository-extended/         1.7_x86-64 main contrib non-free
#deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/repository-extended/         1.7_x86-64 main contrib non-free astra-ce
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/uu/last/repository-base/     1.7_x86-64 main contrib non-free
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/uu/last/repository-update/   1.7_x86-64 main contrib non-free
deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/uu/last/repository-extended/ 1.7_x86-64 main contrib non-free
#deb https://dl.astralinux.ru/astra/stable/1.7_x86-64/uu/last/repository-extended/ 1.7_x86-64 main contrib non-free astra-ce
EOF
```
```sh
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt --purge remove `dpkg -l | grep ^rc | awk '{ print $2}'`
```
## tools
```sh
apt -y install dialog open-vm-tools
```
## dummy 
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

## 
```sh
echo 1 | sudo tee /proc/sys/net/ipv4/conf/all/arp_filter
echo "net.ipv4.conf.all.arp_filter=1" | sudo tee -a /etc/sysctl.conf
```

## 
```sh
systemctl list-units --all --type=mount
systemctl list-units --type=service
```

```sh
systemctl list-unit-files --state=failed
systemctl list-unit-files --type=service
systemctl list-unit-files --type=service --state=enabled
systemctl list-unit-files --type=service --state=enabled,disabled
```

```sh
systemctl --failed
```
