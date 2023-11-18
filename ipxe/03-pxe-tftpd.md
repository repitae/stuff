```sh
sudo apt update
sudo apt install -y tftpd-hpa
```
```sh
sudo cp /etc/default/tftpd-hpa /etc/default/tftpd-hpa.dist
```

```sh
cat << EOF | sudo tee /etc/default/tftpd-hpa 
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/opt/pxe"
TFTP_ADDRESS="0.0.0.0:69"
TFTP_OPTIONS="-4 -c -l -s -vv"
EOF
```

```sh
sudo mkdir -m 777 -p /opt/pxe/{boot,dist,seed}
sudo service tftpd-hpa restart
```

```sh
systemctl status tftpd-hpa
journalctl -xeu tftpd-hpa
```