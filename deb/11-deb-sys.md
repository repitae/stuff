```sh
N=1
sudo sed -i.bak 's/deb-vm/deb-vm-$N/' /etc/hosts
sudo sed -i.bak 's/deb-vm/deb-vm-$N/' /etc/hostname
```

```sh
echo "blacklist i2c-piix4" | sudo tee -a /etc/modprobe.d/blacklist-piix.conf && sudo update-initramfs -u
```

```sh
sudo apt install systemd-timesyncd
cat << EOF | sudo tee -a /etc/systemd/timesyncd.conf
NTP=ru.pool.ntp.org
FallbackNTP=pool.ntp.org
EOF
sudo systemctl restart systemd-timesyncd
systemctl status systemd-timesyncd
```

```sh
echo 'APT::Install-Recommends "0";' | sudo tee -a /etc/apt/apt.conf.d/99-garbage
echo 'APT::Install-Suggests "0";'  | sudo tee -a /etc/apt/apt.conf.d/99-garbage
```

```sh
cat << EOF | sudo tee -a /etc/apt/sources.list
# fastcdn
deb http://deb.debian.org/debian/ bookworm contrib main non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm contrib main non-free non-free-firmware

deb http://deb.debian.org/debian/ bookworm-updates contrib main non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm-updates contrib main non-free non-free-firmware

deb http://deb.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware

deb http://deb.debian.org/debian/ bookworm-backports contrib main non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm-backports contrib main non-free non-free-firmware

deb http://deb.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware
deb-src http://deb.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware
EOF
```

```sh
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt --purge remove `dpkg -l | grep ^rc | awk '{ print $2}'`
```
