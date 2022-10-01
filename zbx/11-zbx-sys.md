## packages
```sh
sudo dpkg -l > dpkg.dist && dpkg -l | wc
```
## piix4
```sh
echo "blacklist i2c-piix4" | sudo tee -a /etc/modprobe.d/blacklist-piix.conf
sudo update-initramfs -u
```

## garbage
```sh
echo 'APT::Install-Recommends "0";' | sudo tee -a /etc/apt/apt.conf.d/99-no-garbage
echo 'APT::Install-Suggests "0";'  | sudo tee -a /etc/apt/apt.conf.d/99-no-garbage
```

## update
```sh
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
yes | unminimize
```

## snapd
```sh
snap list
sudo systemctl stop snapd
sudo systemctl disable --now snapd
sudo systemctl disable --now snapd.socket
sudo systemctl disable --now snapd.seeded
sudo systemctl disable --now snapd.service
```

## ntp
```sh
timedatectl set-timezone Europe/Moscow
sudo apt install systemd-timesyncd
systemctl status systemd-timesyncd
timedatectl status
```