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
```
sudo sed -i.bak 's/#deb/deb/' /etc/apt/sources.list
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt --purge remove `dpkg -l | grep ^rc | awk '{ print $2}'`
```

## dummy 
```sh
sudo cat << EOF >> /etc/network/interfaces.d/dm1
auto dm1
iface dm1 inet static
 pre-up ip link add $IFACE type dummy
 post-up ifconfig $IFACE up
 pre-down ifconfig $IFACE down
 post-down ip link del $IFACE type dummy
 address 192.0.2.1/32
```

```sh
sudo cat << EOF >> /etc/network/interfaces.d/dm2
auto dm2
iface dm2 inet static
 pre-up ip link add $IFACE type dummy
 post-up ifconfig $IFACE up
 pre-down ifconfig $IFACE down
 post-down ip link del $IFACE type dummy
 address 192.0.2.2/32
EOF
```

## arp
```sh
echo 1 | sudo tee /proc/sys/net/ipv4/conf/all/arp_filter
echo "net.ipv4.conf.all.arp_filter=1" | sudo tee -a /etc/sysctl.conf
```

## ctl
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
